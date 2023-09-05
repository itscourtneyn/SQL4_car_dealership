CREATE TABLE customer(
	customer_id SERIAL primary KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	address VARCHAR(150),
	billing_info VARCHAR(150)
);

CREATE TABLE car(
	car_serial_number SERIAL PRIMARY KEY,
	vehicle_make VARCHAR(100),
	vehicle_model VARCHAR(100),
	vehicle_year NUMERIC(4),
	customer_id SERIAL,
	foreign key(customer_id) references customer(customer_id)
);

create table salesperson(
	sales_id SERIAL primary key,
	first_name VARCHAR(100),
	last_name VARCHAR(100)
);


create table invoice(
	invoice_id SERIAL primary KEY,
	sale_date DATE default current_date,
	car_serial_number SERIAL,
	foreign key(car_serial_number) references car(car_serial_number),
	sales_id SERIAL,
	foreign key (sales_id) references salesperson (sales_id),
	customer_id SERIAL,
	foreign key(customer_id) references customer(customer_id)
);

create table mechanic(
	mech_id SERIAL primary key,
	first_name VARCHAR(100),
	last_name VARCHAR(100)
);

create table service_ticket(
	service_ticket_number SERIAL primary KEY,
	car_serial_number SERIAL,
	foreign key(car_serial_number) references car(car_serial_number),
	service_issue VARCHAR(300),
	mech_id SERIAL, 
	foreign key(mech_id) references mechanic (mech_id),
	service_date DATE default current_date,
	customer_id SERIAL,
	foreign key(customer_id) references customer(customer_id)
);

create table parts(
	part_name VARCHAR(100),
	part_id SERIAL primary KEY,
	part_cost numeric(5,2),
	service_ticket_number SERIAL, 
	foreign key(service_ticket_number) references service_ticket(service_ticket_number)
);

select * from car