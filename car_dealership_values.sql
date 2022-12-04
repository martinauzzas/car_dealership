-- Insert values in car table
insert into car (car_id, model, make, year_, action_)
values (1, 'Volvo', 'XC40', 2020, 'repair');
insert into car (car_id, model, make, year_, action_)
values (2, 'Mercedes-Benz', 'eqa 250', 2021, 'sell');
insert into car (car_id, model, make, year_, action_)
values (3, 'Mercedes-Benz', 'c class', 2020, 'repair');

--Insert values in saleperson table
insert into saleperson(saleperson_id, first_name, last_name)
values (1, 'Max', 'Stano');
insert into saleperson(saleperson_id, first_name, last_name)
values (2, 'Frank', 'Matatano');

--Insert values in customer table
insert into customer (customer_id, first_name, last_name, email, address, phone_number)
values (1, 'Ron', 'Perry', 'ronperry@gmail.com', '1564 Street, AZ', 9504521498);
insert into customer (customer_id, first_name, last_name, email, address, phone_number)
values (2, 'Garfield', 'Cat', 'meow@gmail.com', '1564 Couch, AZ', 9504780498);
insert into customer (customer_id, first_name, last_name, email, address, phone_number)
values (3, 'Spongebob', 'Squarepants', 'spongebob@gmail.com', '1564 Sea, AZ', 9504000498)

--Insert values in mechanic table
insert into mechanic(mechanic_id, first_name, last_name)
values (1, 'Luke', 'Rond');
insert into mechanic(mechanic_id, first_name, last_name)
values(2, 'Cole', 'Rond');

--Insert values in part table
insert into part(part_id, part_name, quantities, mechanic_id)
values(1, 'Lights', 4, 1);
insert into part(part_id, part_name, quantities, mechanic_id)
values(2, 'Air filter', 3, 2);

--Insert into dealership table
insert into dealership(dealership_id, name_)
values (1, 'Fix and Repair Cars');
	
-- Function to add ticket
create or replace function addTicket(_ticket_id Integer, _car_id Integer, _customer_id Integer, _mechanic_id Integer, _work_to_do VARCHAR(1000), _total_ numeric (10,2), _part_id Integer)
returns void
as $MAIN$
begin 
	insert into ticket(ticket_id, car_id, customer_id, mechanic_id, work_to_do, total_, part_id)
	values(_ticket_id, _car_id, _customer_id, _mechanic_id, _work_to_do, _total_, _part_id);
end;
$MAIN$
language plpgsql;

select addTicket (2, 3, 2, 2, 'Fix air filter', 150.00, 2 )

select * from ticket

-- Adding ticket to the customer and dealership
create or replace function addHistoryTicket(_ticket_id Integer)
returns void
as $MAIN$
begin 
	insert into dealership(service_history)
	values(ticket_id);
	insert into customer(history_service)
	values(ticket_id);
end;
$MAIN$
language plpgsql;

select addHistoryTicket(2)

--Adding invoice
create or replace function addInvoice(_invoice_id Integer, _saleperson_id Integer, _customer_id Integer, _car_id Integer, _total numeric (10,2))
returns void
as $MAIN$
begin 
	insert into invoice(invoice_id, saleperson_id, customer_id, car_id, total)
	values(_invoice_id, _saleperson_id, _customer_id, _car_id, _total);
end;
$MAIN$
language plpgsql;

select addInvoice(1, 2, 2, 2, 50000.00)


