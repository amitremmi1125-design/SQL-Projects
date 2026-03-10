create database event_management;
use event_manamenet;

# venuestable

create table venues (
venue_id int primary key,
venue_name varchar(20),
location varchar(20),
capacity int
);  

insert into venues values
(1, 'city hall', 'bangalore', 900),
(2, 'tech park', 'goa', 800),
(3, 'mall', ' gokak', 300),
(4, 'saba', 'belgavi', 400),
(5, 'habba', 'hubballi', 500);


select*
from venues;

# organizerstable
# organizerstable
CREATE TABLE organizers (
    organizer_id INT PRIMARY KEY,
    organizer_name VARCHAR(50),
    contact_no VARCHAR(15),
    email VARCHAR(50)
);

INSERT INTO organizers VALUES
(1, 'ABC Events', '9876543210', 'abc@events.com'),
(2, 'XYZ Management', '9123456780', 'xyz@events.com');

select *
from organizers;

CREATE TABLE events (
    event_id INT PRIMARY KEY,
    event_name VARCHAR(50),
    event_date DATE,
    venue_id INT,
    organizer_id INT,
    FOREIGN KEY (venue_id) REFERENCES venues(venue_id),
    FOREIGN KEY (organizer_id) REFERENCES organizers(organizer_id)
);

CREATE TABLE events (
    event_id INT PRIMARY KEY,
    event_name VARCHAR(50),
    event_date DATE,
    venue_id INT,
    organizer_id INT,
    FOREIGN KEY (venue_id) REFERENCES venues(venue_id),
    FOREIGN KEY (organizer_id) REFERENCES organizers(organizer_id)
);
INSERT INTO events VALUES
(101, 'Tech Conference', '2025-03-15', 2, 1),
(102, 'Music Fest', '2025-04-10', 1, 2);


select*
from events ;

CREATE TABLE attendees (
    attendee_id INT PRIMARY KEY,
    attendee_name VARCHAR(50),
    email VARCHAR(50),
    phone VARCHAR(15)
);

insert into attendees values
(1, 'amit', 'jhdcd.com','653213516'),
(2, 'aditya', 'jvutyg.com','97496784'),
(3, 'ammas', 'iusx.com', '3525416552');

select*
from attendees;

CREATE TABLE registrations (
    registration_id INT PRIMARY KEY,
    event_id INT,
    attendee_id INT,
    registration_date DATE,
    FOREIGN KEY (event_id) REFERENCES events(event_id),
    FOREIGN KEY (attendee_id) REFERENCES attendees(attendee_id)
);

INSERT INTO registrations VALUES
(1, 101, 1, '2025-03-01'),
(2, 102, 2, '2025-03-05');

select*
from registrations ;

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    registration_id INT,
    amount DECIMAL(8,2),
    payment_date DATE,
    payment_mode VARCHAR(20),
    FOREIGN KEY (registration_id) REFERENCES registrations(registration_id)
);

INSERT INTO payments VALUES
(1, 1, 1500.00, '2025-03-01', 'UPI'),
(2, 2, 2000.00, '2025-03-05', 'Card');

select*
from payments;

use event_management;