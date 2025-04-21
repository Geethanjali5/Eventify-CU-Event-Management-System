--Query 2
--This query calculates the diversity index for each event, which is the number of unique departments that attendees come from. It helps determine how diverse the event's audience is across different departments within the university.


SELECT e.name AS event_name, 
       COUNT(DISTINCT a.department) AS department_diversity,
       COUNT(a.attendee_id) AS total_attendees
FROM events e
JOIN tickets t ON e.event_id = t.event_id
JOIN attendees a ON t.ticket_id = a.ticket_id
GROUP BY e.name
HAVING COUNT(a.attendee_id) > 0
ORDER BY department_diversity DESC, total_attendees DESC;
