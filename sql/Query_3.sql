--Query: Most Active Attendees
--This query lists the most active attendees that have attended more than one event sorted by their events attended
SELECT a.first_name, 
       a.last_name, 
       COUNT(DISTINCT e.event_id) AS events_attended
FROM attendees a
JOIN tickets t ON a.ticket_id = t.ticket_id
JOIN events e ON t.event_id = e.event_id
GROUP BY a.first_name, a.last_name
HAVING COUNT(DISTINCT e.event_id) > 1 -- Consider only attendees who attended more than 1 event
ORDER BY events_attended DESC;