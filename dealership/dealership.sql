create table car(
car_id SERIAL primary key,
model VARCHAR(100),
used_status BOOLEAN,
color VARCHAR(50),
price NUMERIC(6,0)
);

create table salesman(
salesman_id SERIAL primary key,
invoice VARCHAR(150),
name VARCHAR(100),
car_id INTEGER,
foreign key(car_id) references car
);

create table ticket(
service_ticket_id SERIAL primary key,
services_done VARCHAR(300),
parts_used VARCHAR(300),
car_id INTEGER,
mechanic_id INTEGER,
foreign key(car_id) references car,
foreign key(mechanic_id) references mechanic
);

create table customer(
customer_id SERIAL primary key,
name VARCHAR(100),
salesman_id INTEGER,
service_ticket_id INTEGER,
car_id INTEGER,
foreign key(salesman_id) references salesman,
foreign key(service_ticket_id) references ticket,
foreign key(car_id) references car
);

create table mechanic(
mechanic_id SERIAL primary key,
name VARCHAR(100)
);



insert into customer(
customer_id,
name,
salesman_id,
service_ticket_id,
car_id
) values(
50,
'Bob',
1,
null,
100
);

insert into salesman(
salesman_id,
invoice,
name,
car_id
) values(
1,
'Car price + dealership fee',
'John',
100
);

insert into car(
car_id,
model,
used_status,
color,
price
) values(
100,
'Toyota camry',
false,
'silver',
'24000'
);

insert into ticket(
service_ticket_id,
services_done,
parts_used,
mechanic_id,
car_id
) values(
00,
null,
null,
null,
null
);

insert into mechanic(
mechanic_id,
name
) values (
00,
null
)




insert into customer(
customer_id,
name,
salesman_id,
service_ticket_id,
car_id
) values(
55,
'Ben',
null,
300,
500
);

insert into salesman(
salesman_id,
invoice,
car_id
) values(
00,
null,
null
);

insert into car(
car_id,
model,
used_status,
color,
price
) values(
500,
'Ford F150',
null,
'silver',
null
);

insert into ticket(
service_ticket_id,
services_done,
parts_used,
mechanic_id
) values(
300,
'Replaced mirror',
'Driverside mirror',
20
);

insert into mechanic(
mechanic_id,
name
) values (
20,
'Bill'
);


create or replace function add_car(_car_id INTEGER, _model VARCHAR, _used_status BOOLEAN, _color VARCHAR, _price NUMERIC)
returns void
as $MAIN$
begin
	insert into car(car_id, model, used_status, color, price)
	values(_car_id, _model, _used_status, _color, _price);
end
$MAIN$
language plpgsql;

select add_car(422, 'Honda Civic', true, 'maroon', 11000)

select add_car(423, 'Buick Encore', false, 'white', 25000)


