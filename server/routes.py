from flask import request, render_template, g, redirect, url_for
from config import app, query_executor
from sqlalchemy import text


@app.route('/')
def index():
    return redirect(url_for('browse_events'))

@app.route('/events', methods=['GET'])
def browse_events():
    filters = []
    params = {}

    if 'organizer' in request.args and request.args['organizer'] is not '':
        filters.append("o.name = :organizer")
        params['organizer'] = request.args['organizer']
    if 'event_type' in request.args and request.args['event_type'] is not '':
        filters.append("e.event_type = :event_type")
        params['event_type'] = request.args['event_type']
    if 'campus' in request.args and request.args['campus'] is not '':
        filters.append("l.campus = :campus")
        params['campus'] = request.args['campus']

    filter_query = " AND ".join(filters) if filters else "1=1"

    query = text(f"""
        SELECT e.event_type, e.event_id, e.name AS event_name, e.event_time, e.description, o.name AS organizer, l.venue, l.campus
        FROM events e
        JOIN organizers o ON e.organizer_id = o.organizer_id
        JOIN locations l ON e.location = l.venue
        WHERE {filter_query}
        ORDER BY e.event_time
    """)
    
    if not params:
        params = None
    events = query_executor._execute_fetch_query(query, params)
    
    return render_template("events.html", events=events)

@app.route('/event/<int:event_id>', methods=['GET'])
def event_details(event_id):
    """
    Fetch details of a specific event and its available tickets.
    """
    # Fetch event details
    event_query = text("""
        SELECT e.event_type, e.event_id, e.name AS event_name, e.event_time, e.description, e.event_type,
               o.name AS organizer, l.venue, l.campus
        FROM events e
        JOIN organizers o ON e.organizer_id = o.organizer_id
        JOIN locations l ON e.location = l.venue
        WHERE e.event_id = :event_id
    """)
    event = query_executor._execute_fetch_query(event_query, {"event_id": event_id})

    if not event:
        return "Event not found.", 404

    # Fetch tickets for the event
    tickets_query = text("""
        SELECT ticket_id, fee, ticket_type
        FROM tickets
        WHERE event_id = :event_id
    """)
    tickets = query_executor._execute_fetch_query(tickets_query, {"event_id": event_id})
    return render_template("events_details.html", event=event[0], tickets=tickets)


@app.route('/book_ticket/<int:event_id>', methods=['POST'])
def book_ticket(event_id):
    """
    Book a ticket for a specific event using an existing ticket_id.
    """
    ticket_type = request.form.get('ticket_type')
    email = request.form.get('email')
    if not ticket_type or not email:
        return "Invalid input. All fields are required.", 400

    try:
        # Fetch an available ticket_id for the given event and ticket type. We find ticket that has not been booked already before
        ticket_query = text("""
            SELECT t.ticket_id as ticket_id 
            FROM tickets as t LEFT JOIN attendees a ON t.ticket_id=a.ticket_id
            WHERE t.event_id = :event_id AND t.ticket_type = :ticket_type AND a.ticket_id IS NULL
            LIMIT 1
        """)
        tickets = query_executor._execute_fetch_query(ticket_query, {"event_id": event_id, "ticket_type": ticket_type})

        if not tickets:
            return "No available tickets for the selected type.", 404

        ticket_id = tickets[0]['ticket_id']

        # Fetch the next available attendee_id
        attendee_id_query = text("SELECT COALESCE(MAX(attendee_id), 0) + 1 AS next_id FROM attendees")
        next_attendee_id = query_executor._execute_fetch_query(attendee_id_query)[0]['next_id']

        # Insert the attendee to link email with the ticket
        attendee_query = text("""
            INSERT INTO attendees (attendee_id, email, ticket_id) 
            VALUES (:attendee_id, :email, :ticket_id)
        """)
        query_executor._execute_query(attendee_query, {
            "attendee_id": next_attendee_id,
            "email": email,
            "ticket_id": ticket_id
        })

        return redirect('/my_tickets?email=' + email)  # Redirect to my tickets page

    except Exception as e:
        app.logger.info(f"Error booking ticket: {e}")
        return "Failed to book ticket", 500


@app.route('/my_tickets', methods=['GET', 'POST'])
def my_tickets():
    """
    View tickets associated with a user's email and provide an option to delete them.
    """
    if request.method == 'POST':
        # Get email from the form submission
        email = request.form.get('email')
        if not email:
            return "Email is required to view tickets.", 400
    else:
        # Get email from the URL query parameter
        email = request.args.get('email')
        if not email:
            # Render a form to prompt for email
            return render_template("prompt_email.html")

    # Fetch tickets associated with the email
    query = text("""
        SELECT t.ticket_id, t.fee, t.ticket_type, e.name AS event_name, e.event_time
        FROM tickets t
        JOIN events e ON t.event_id = e.event_id
        JOIN attendees a ON t.ticket_id = a.ticket_id
        WHERE a.email = :email
    """)
    try:
        tickets = query_executor._execute_fetch_query(query, {"email": email})
        app.logger.info(tickets)
    except Exception as e:
        print(f"Error fetching tickets: {e}")
        tickets = []

    return render_template("my_tickets.html", tickets=tickets, email=email)


@app.route('/remove_ticket/<int:ticket_id>', methods=['POST'])
def remove_ticket(ticket_id):
    try:
        # Delete the attendee associated with the ticket_id
        delete_query = text("""
            DELETE FROM attendees
            WHERE ticket_id = :ticket_id
        """)
        query_executor._execute_query(delete_query, {"ticket_id": ticket_id})
        return redirect('/my_tickets')  # Redirect back to the "My Tickets" page
    except Exception as e:
        print(f"Error removing ticket: {e}")
        return "Failed to remove ticket", 500
