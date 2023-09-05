create function add_mechanic(_mech_id INTEGER, _first_name VARCHAR, _last_name VARCHAR)
returns void
as $MAIN$
begin 
	insert into mechanic(mech_id, first_name, last_name)
	values (_mech_id, _first_name, _last_name);
end;
$MAIN$
language plpgsql;

select add_mechanic(1, 'Noah', 'Blake');

select * from mechanic

select add_mechanic(2, 'Bella', 'Rose');

select * from mechanic

INSERT INTO customer(
	customer_id,
	first_name,
	last_name,
	address,
	billing_info
) VALUES(
	1,
	'Blake',
	'Nielson',
	'123 Anywhere Ln, Anywhere, US',
	'4242-4242-4242-4242 623 05/24'
);

INSERT INTO customer(
	customer_id,
	first_name,
	last_name,
	address,
	billing_info
) VALUES(
	2,
	'Courtney',
	'Nielson',
	'123 Anywhere Ln, Anywhere, US',
	'4242-4242-4242-4242 623 05/24'
);

select * from customer

INSERT INTO car(
	car_serial_number, 
	vehicle_make, 
	vehicle_model, 
	vehicle_year, 
	customer_id
) VALUES(
	123456789,
	'Tesla',
	'Model 3',
	2019,
	2
);

INSERT INTO car(
	car_serial_number, 
	vehicle_make, 
	vehicle_model, 
	vehicle_year, 
	customer_id
) VALUES(
	237658972,
	'Jeep',
	'Cherokee',
	2018,
	1
);

select * from car

insert INTO salesperson(
	sales_id, 
	first_name, 
	last_name
) values (
	1, 
	'Bob', 
	'Smith'
);

insert INTO salesperson(
	sales_id, 
	first_name, 
	last_name
) values (
	2, 
	'Jane', 
	'Doe'
);

select * from salesperson

insert into invoice(
	invoice_id,
	sale_date,
	car_serial_number,
	sales_id,
	customer_id
) values (
	1,
	current_date, 
	237658972,
	1,
	1
);

insert into invoice(
	invoice_id,
	sale_date,
	car_serial_number,
	sales_id,
	customer_id
) values (
	2,
	current_date, 
	123456789,
	2,
	2
);

select * from invoice

insert into service_ticket(
	service_ticket_number,
	car_serial_number,
	service_issue,
	mech_id, 
	service_date,
	customer_id
) values (
	1, 
	237658972,
	'New purchase service',
	1,
	current_date,
	1
);

insert into service_ticket(
	service_ticket_number,
	car_serial_number,
	service_issue,
	mech_id, 
	service_date,
	customer_id
) values (
	2, 
	123456789,
	'Oil change',
	2,
	current_date,
	2
);

select * from service_ticket

insert into parts(
	part_name,
	part_id,
	part_cost,
	service_ticket_number
) values (
	'oil_gallon',
	123,
	10.99,
	2
);

insert into parts(
	part_name,
	part_id,
	part_cost,
	service_ticket_number
) values (
	'oil_filter',
	222,
	12.99,
	2
);

select * from parts