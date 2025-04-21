CREATE OR REPLACE FUNCTION update_tickets_table()
RETURNS TRIGGER AS $update_tickets$
   BEGIN
      UPDATE tickets set bought=TRUE
      WHERE tickets.ticket_id=NEW.ticket_id;
      RETURN NEW;
   END;
$update_tickets$ LANGUAGE plpgsql;

CREATE TRIGGER update_tickets_table 
AFTER INSERT ON attendees
FOR EACH ROW EXECUTE PROCEDURE update_tickets_table();


ALTER TABLE tickets ADD COLUMN "bought" BOOLEAN DEFAULT FALSE