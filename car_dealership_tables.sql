create table car (
	car_id SERIAL primary key,
	model VARCHAR(100),
	make VARCHAR(100),
	year_ Integer,
	action_ VARCHAR(50)
);


create table saleperson(
	saleperson_id SERIAL primary key,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	car_id Integer,
	foreign key (car_id) references car(car_id)
);

alter table saleperson
	add invoice_id Integer;


create table customer(
	customer_id SERIAL primary key,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	email VARCHAR(100),
	address VARCHAR(300),
	phone_number VARCHAR(10),
	car_id Integer,
	foreign key (car_id) references car(car_id)
);
alter table customer 
	add history_service Integer;

alter table customer
	add invoice_id Integer;


create table mechanic(
	mechanic_id SERIAL primary key,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	car_id Integer,
	foreign key (car_id) references car(car_id)
);


create table part(
	part_id SERIAL primary key,
	part_name VARCHAR(100),
	quantities Integer,
	mechanic_id Integer,
	foreign key (mechanic_id) references mechanic(mechanic_id)
);

create table invoice(
	invoice_id SERIAL primary key,
	saleperson_id Integer,
	customer_id Integer,
	car_id Integer,
	total numeric (10,2),
	foreign key (saleperson_id) references saleperson(saleperson_id),
	foreign key (customer_id) references customer (customer_id),
	foreign key (car_id) references car(car_id)
);


create table ticket(
	ticket_id SERIAL primary key,
	car_id Integer,
	customer_id Integer,
	mechanic_id Integer,
	work_to_do VARCHAR(1000),
	total_ NUMERIC(10,2),
	part_id Integer,
	foreign key (car_id) references car(car_id),
	foreign key (customer_id) references customer(customer_id),
	foreign key (mechanic_id) references mechanic(mechanic_id),
	foreign key (part_id) references part(part_id)
);

	
create table dealership(
	dealership_id SERIAL primary key,
	name_ VARCHAR(100),
	ticket_id Integer,
	foreign key (ticket_id) references ticket (ticket_id)
);
alter table dealership
	add service_history Integer;
	
alter table dealership 
	drop column ticket_id;



	