create database Traffi_Violation_Management_Sys ;
use Traffi_Violation_Management_Sys ;

CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    role VARCHAR(20),   -- Admin / Traffic Police
    phone VARCHAR(15),
    email VARCHAR(50)
);

INSERT INTO users (name, role, phone, email)
VALUES
('Ramesh Kumar', 'Admin', '9876543210', 'ramesh@traffic.gov'),
('Suresh Patil', 'Traffic Police', '9123456789', 'suresh@traffic.gov'),
('Anita Sharma', 'Traffic Police', '9988776655', 'anita@traffic.gov'),
('Vikram Rao', 'Traffic Police', '9090909090', 'vikram@traffic.gov'),
('Neha Singh', 'Admin', '9012345678', 'neha@traffic.gov');

select*
from users;

CREATE TABLE vehicle_owner (
    owner_id INT PRIMARY KEY AUTO_INCREMENT,
    owner_name VARCHAR(50),
    address VARCHAR(100),
    phone VARCHAR(15),
    license_no VARCHAR(20) UNIQUE
);

INSERT INTO vehicle_owner
VALUES
(1,'Amit Kumar', 'Bengaluru, Karnataka', '9876543210', 'KA01A12345'),
(2, 'Rahul Sharma', 'Mumbai, Maharashtra', '9123456789', 'MH02B67890'),
(3, 'Sneha Patel', 'Ahmedabad, Gujarat', '9988776655', 'GJ01C54321'),
(4, 'Vikram Singh', 'Jaipur, Rajasthan', '9876501234', 'RJ14D98765'),
(5, 'Priya Nair', 'Kochi, Kerala', '9090909090', 'KL07E45678');

SELECT * FROM vehicle_owner;

CREATE TABLE vehicle (
    vehicle_id INT PRIMARY KEY AUTO_INCREMENT,
    vehicle_no VARCHAR(15) UNIQUE,
    vehicle_type VARCHAR(20),   -- Car, Bike, Truck
    owner_id INT,
    FOREIGN KEY (owner_id) REFERENCES vehicle_owner(owner_id)
);

INSERT INTO vehicle (vehicle_no, vehicle_type, owner_id)
VALUES
('KA01AB1234', 'Car', 1),
('MH02CD5678', 'Bike', 2),
('GJ01EF9012', 'Truck', 3),
('RJ14GH3456', 'Car', 4),
('KL07IJ7890', 'Bike', 5);

SELECT * FROM vehicle;

CREATE TABLE violation_type (
    violation_id INT PRIMARY KEY AUTO_INCREMENT,
    violation_name VARCHAR(50),
    fine_amount INT
);

INSERT INTO violation_type (violation_name, fine_amount)
VALUES
('No Helmet', 500),
('Over Speeding', 1000),
('Signal Jumping', 1500),
('No Seat Belt', 500),
('Drunk Driving', 5000),
('Using Mobile While Driving', 1000),
('Triple Riding', 800),
('No Parking Zone', 300);

SELECT * FROM violation_type;

CREATE TABLE traffic_violation (
    challan_id INT PRIMARY KEY AUTO_INCREMENT,
    vehicle_id INT,
    violation_id INT,
    violation_date DATE,
    location VARCHAR(50),
    issued_by INT,
    status VARCHAR(20),   -- Paid / Unpaid
    FOREIGN KEY (vehicle_id) REFERENCES vehicle(vehicle_id),
    FOREIGN KEY (violation_id) REFERENCES violation_type(violation_id),
    FOREIGN KEY (issued_by) REFERENCES users(user_id)
);

INSERT INTO traffic_violation (vehicle_id, violation_id, violation_date, location, issued_by, status)
VALUES
(1, 1, '2026-03-01', 'Bangalore', 2, 'Unpaid'),
(2, 2, '2026-03-02', 'Mumbai', 3, 'Paid'),
(3, 3, '2026-03-03', 'Ahmedabad', 4, 'Unpaid'),
(4, 4, '2026-03-04', 'Jaipur', 2, 'Paid'),
(5, 5, '2026-03-05', 'Kochi', 3, 'Unpaid');

SELECT * FROM traffic_violation;

CREATE TABLE payment (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    challan_id INT,
    payment_date DATE,
    amount INT,
    payment_mode VARCHAR(20),  -- Cash / UPI / Card
    FOREIGN KEY (challan_id) REFERENCES traffic_violation(challan_id)
);

INSERT INTO payment (challan_id, payment_date, amount, payment_mode)
VALUES
(2, '2026-03-02', 1000, 'UPI'),
(4, '2026-03-04', 500, 'Cash'),
(1, '2026-03-06', 500, 'Card'),
(3, '2026-03-07', 1500, 'UPI'),
(5, '2026-03-08', 5000, 'Card');

SELECT * FROM payment;

