CREATE TABLE organizers (
    organizer_id INTEGER PRIMARY KEY,
    name VARCHAR(50),
    type INTEGER
);

CREATE TABLE campuses (
    name VARCHAR(30) PRIMARY KEY,
    address VARCHAR(50),
    opens VARCHAR(8),
    closes VARCHAR(8)
);

CREATE TABLE locations (
    venue VARCHAR(30) PRIMARY KEY,
    address VARCHAR(60),
    capacity INTEGER,
    -- Fields required by Foreign Key.
    campus VARCHAR(30),
    FOREIGN KEY (campus) REFERENCES campuses(name)
);

CREATE TABLE events (
    event_id INTEGER PRIMARY KEY,
    name VARCHAR(50),
    event_time TIMESTAMP,
    description VARCHAR(200),
    event_type VARCHAR(30),
    -- Fields required by Foreign Key.
    organizer_id INTEGER,
    location VARCHAR(30),
    FOREIGN KEY (organizer_id) REFERENCES organizers(organizer_id),
    FOREIGN KEY (location) REFERENCES locations(venue)
);

CREATE TABLE tickets (
    ticket_id INTEGER PRIMARY KEY,
    fee INTEGER CONSTRAINT check_fee_non_negative CHECK (fee >= 0),
    ticket_type VARCHAR(10),
    -- Fields required by Foreign Key.
    event_id INTEGER,
    FOREIGN KEY (event_id) REFERENCES events(event_id)
);

CREATE TABLE attendees (
    attendee_id INTEGER PRIMARY KEY,
    uni_id VARCHAR(20),
    first_name VARCHAR(60) ,
    last_name VARCHAR(60) ,
    email VARCHAR(120),
    department VARCHAR(50),
    user_type VARCHAR(20),
    -- Fields required by Foreign Key.
    ticket_id INTEGER,
    FOREIGN KEY (ticket_id) REFERENCES tickets(ticket_id)
);

CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    order_date TIMESTAMP,
    total_price INTEGER,
    -- Fields required by Foreign Key.
    ticket_id INTEGER UNIQUE,
    FOREIGN KEY (ticket_id) REFERENCES tickets(ticket_id)
);

CREATE TABLE payments (
    payment_id INTEGER PRIMARY KEY,
    payment_method VARCHAR(20),
    transaction_id VARCHAR(255),
    -- Fields required by Foreign Key.
    order_id INTEGER UNIQUE,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

CREATE TABLE reviews (
    review_id SERIAL PRIMARY KEY,
    event_id INTEGER REFERENCES events(event_id),
    reviewer_name VARCHAR(100),
    review_text TEXT NOT NULL -- Document-style text attribute
);
