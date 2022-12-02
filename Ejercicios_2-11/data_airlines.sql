CREATE SCHEMA data_airlines;

USE data_airlines;

create table aircraft(
model VARCHAR(255),
seats int,
primary key(model)
);

create table status(
status_id int auto_increment,
status VARCHAR(255),
primary key(status_id)
);

create table customer(
id int auto_increment,
name VARCHAR(255),
status_id int,
customer_mileage int,
primary key(id),
foreign key(status_id) REFERENCES status(status_id)
);

create table flight(
flight_number VARCHAR(255),
aircraft_model VARCHAR(255),
flight_mileage int,
primary key(flight_number),
foreign key(aircraft_model) REFERENCES aircraft(model)
);

create table customer_flight(
id int auto_increment,
customer_id int,
flight_number VARCHAR(255),
primary key(id),
foreign key(customer_id) REFERENCES customer(id),
foreign key(flight_number) REFERENCES flight(flight_number)
);

INSERT INTO aircraft VALUES
('Boeing 747', 400),
('Airbus A330', 236),
('Boeing 777', 264);

INSERT INTO status(status) VALUES
('Gold'),
('Silver'),
('None');

INSERT INTO customer(name, status_id, customer_mileage) VALUES
('Agustine Riviera', 2, 115235),
('Alaina Sepulvida', 3, 6008),
('Tom Jones', 1, 205767),
('Sam Rio', 3, 2653),
('Jessica James', 2, 127656),
('Ana Janco', 2, 136773),
('Jennifer Cortez', 1, 300582),
('Christian Janco', 2, 14642);

INSERT INTO flight(flight_number, flight_mileage, aircraft_model) VALUES
('DL143', 135, 'Boeing 747'),
('DL122', 4370, 'Airbus A330'),
('DL53', 2078, 'Boeing 777'),
('DL222', 1765, 'Boeing 777'),
('DL37', 531, 'Boeing 747');

INSERT INTO customer_flight(customer_id, flight_number) VALUES
(1, 'DL143'),
(1, 'DL122'),
(2, 'DL122'),
(1, 'DL143'),
(3, 'DL122'),
(3, 'DL53'),
(1, 'DL143'),
(4, 'DL143'),
(1, 'DL143'),
(3, 'DL222'),
(5, 'DL143'),
(4, 'DL143'),
(6, 'DL222'),
(7, 'DL222'),
(5, 'DL122'),
(4, 'DL37'),
(8, 'DL222');

-- EJERCICIO 3
SELECT count(*) FROM flight;

-- EJERCICIO 4
SELECT AVG(flight_mileage) FROM flight;

-- EJERCICIO 5
SELECT AVG(seats) FROM aircraft;

-- EJERCICIO 6
SELECT status_id, AVG(customer_mileage) FROM customer GROUP BY status_id;

-- EJERCICIO 7
SELECT MAX(customer_mileage) FROM customer GROUP BY status_id;

-- EJERCICIO 8
SELECT count(*) FROM aircraft WHERE model LIKE 'Boeing%';

-- EJERCICIO 9
SELECT flight_number,flight_mileage FROM flight WHERE flight_mileage between 300 AND 2000;

-- EJERCICIO 10
SELECT status_id, AVG(flight_mileage) FROM customer_flight
JOIN customer ON customer_flight.customer_id = customer.id
JOIN flight ON customer_flight.flight_number = flight.flight_number
GROUP BY customer.status_id;

-- EJERCICIO 11
SELECT status_id, MAX(aircraft_model) FROM customer_flight
JOIN customer ON customer_flight.customer_id = customer.id
JOIN flight ON customer_flight.flight_number = flight.flight_number
WHERE customer.status_id = 1;