-- =========================================
-- CAR RENTAL SYSTEM DATABASE PROJECT
-- =========================================

create database Car_rental_system1 ;
use car_rental_system1;


-- CUSTOMER TABLE

create table Customer
(
customer_id int primary key auto_increment,
customer_name varchar(100),
address varchar(100),
mobile_number bigint unique not null,
email_id varchar(50),
driver_license varchar(100),
preferred_payment enum("cash","card","online"),
status enum("active","inactive")
);

insert into Customer
(customer_name,address,mobile_number,email_id,driver_license,preferred_payment,status)
values
("payal_nikam","satara",9685749301,"payalnikam@gmail.com","MH-2018-9876543","cash","active"),
("santoshi_deshmukh","patan",9843450923,"santoshiiD@gmail.com","MH-2019-7876593","online","active"),
("saniya_terevkar","mumbai",9821219087,"saniyaterevkar@gmail.com","MH-2019-7876123","card","active"),
("priyanka_kadam","satara",9820909765,"priyakadam@gmail.com","DL-2019-8989564","cash","active"),
("rasika_shelake","karad",9087090923,"rasikashelke@gmail.com","DL-2019-9876123","online","active"),
("shivanjali_jadhav","karad",8087090967,"shivjadhave@gmail.com","MH-2019-9087123","card","active");

select * from customer;

-- LOCATION TABLE

create table Location
(
location_id int primary key auto_increment,
location_name varchar(100) unique,
address varchar(100),
city varchar(50) not null,
state varchar(100),
country varchar(50) not null,
zip_code varchar(10),
customer_id int,
foreign key (customer_id) references customer(customer_id)
);

insert into Location
(location_name,address,city,state,country,zip_code,customer_id)
values
("Kamothe Sector 18", "Near Mansarovar Station", "Navi Mumbai", "Maharashtra", "India", "410206",1),
("Seawoods Station", "Palm Beach Road, Seawoods", "Navi Mumbai", "Maharashtra", "India", "400706",2),
("Shivaji Nagar", "Shivaji Nagar, Central Pune", "Pune", "Maharashtra", "India", "411005",3),
("Hinjewadi", "Hinjewadi IT Park, Western Pune", "Pune", "Maharashtra", "India", "411057",4),
("Belapur CBD","Sector 11, CBD Belapur", "Navi Mumbai", "Maharashtra","India", "400614",5),
("Wakad","Wakad Area, Western Pune", "Pune", "Maharashtra","India", "411057",6);

select * from location;

-- CARS TABLE

create table Cars
(
car_id int primary key auto_increment,
manufacturer varchar(100),
model varchar(100),
year int,
license_plate varchar(100),
status enum("available","booked","maintenance"),
location_id int,
foreign key (location_id) REFERENCES Location(location_id)
);

insert into cars
(manufacturer,model,year,license_plate,status,location_id)
values
("Toyota","Fortuner",2022,"ABC122","available",1),
("Ford","Mustang",2023,"XYZ098","booked",2),
("Honda","Civic",2021,"MKY567","maintenance",3),
("Hyundai","Sonata",2020,"RDS345","maintenance",4),
("BMW","X5",2020,"RRL123","booked",5),
("Hyundai","Creta",2025,"DSP667","available",6);

select * from cars;

-- BOOKING TABLE

create table Booking1
(
booking_id int primary key,
customer_id int,
foreign key(customer_id) REFERENCES Customer(customer_id),
car_id int,
foreign key(car_id) REFERENCES Cars(car_id),
pickup_date date,
return_date date,
pickup_location varchar(100),
return_location varchar(100),
status enum("pending","cancelled","confirmed","completed")
);

insert into Booking1
values
(101,1,1,"2025-10-01","2025-11-01","kurla","navi mumbai","pending"),
(102,2,2,"2025-07-01","2025-09-12","seawood","Tilaknagar","cancelled"),
(103,3,3,"2024-05-08","2024-06-06","Thane","Vashi","confirmed"),
(104,4,4,"2022-01-06","2022-02-03","Kalyan","Bandra","completed"),
(105,5,5,"2025-01-07","2025-05-07","Dadar","Panvel","pending"),
(106,6,6,"2025-07-09","2025-09-09","sion","Chembur","cancelled");

select * from Booking1;

-- PAYMENT TABLE

create table Payment
(
payment_id int primary key,
booking_id int,
foreign key(booking_id) REFERENCES Booking1(booking_id),
amount decimal(10,2) not null,
payment_date datetime,
payment_method enum ("card","cash","online"),
status enum("paid","failed","refunded")
);

insert into Payment
values
(1001,101,250.00,"2025-09-01 14:12:00","card","paid"),
(1002,102,300.00,"2025-01-20 09:30:00","online","failed"),
(1003,103,350.00,"2025-10-25 11:45:00","cash","refunded"),
(1004,104,320.00,"2025-07-11 11:45:00","card","paid"),
(1005,105,600.00,"2025-06-05 11:45:00","online","paid"),
(1006,106,600.00,"2025-06-05 11:45:00","cash","paid");

select * from payment;

-- MAINTENANCE TABLE

create table Maintenance
(
maintenance_id int auto_increment primary key,
car_id int,
foreign key(car_id) REFERENCES Cars(car_id),
maintenance_type varchar(100),
description text,
scheduled_date date,
status enum("scheduled","cancelled","completed")
);

insert into Maintenance
(car_id,maintenance_type,description,scheduled_date,status)
values
(1,"Oil Change","Regular engine oil change","2025-10-15","scheduled"),
(2,"Tire Rotation","Rotate tires to extend their life","2025-09-10","completed"),
(3,"Brake Inspection","Check brake pads and discs","2025-11-05","scheduled"),
(4,"Battery Replacement","Replace old battery with new one","2025-07-20","cancelled"),
(5,"Engine Tune-up","Complete engine tune-up service","2025-08-30","scheduled");

select * from Maintenance;

-- FEEDBACK TABLE

create table Feedback
(
feedback_id int primary key,
customer_id int,
foreign key(customer_id) REFERENCES Customer(customer_id),
booking_id int,
foreign key (booking_id) REFERENCES Booking1(booking_id),
rating int check (rating between 1 and 5),
comment text
);

insert into Feedback values
(50,1,101,5,"Excellent service"),
(51,2,102,4,"Smooth ride"),
(52,3,103,3,"Average Experience"),
(53,4,104,5,"no issues at all, Will definitely rent again"),
(54,5,105,3,"Car was okay, but not as clean as I expected"),
(55,6,106,2,"Car had mechanical issues,not happy");

select * from Feedback;

--  QUERIES

# Find total revenue generated
select sum(amount) as total_revenue
from Payment
where status = "paid";

# Show cars currently available
select manufacturer,
model,
license_plate
from Cars
where status = "available";

# Find customers who paid online
select customer_name,
preferred_payment
from Customer
where preferred_payment = "online";

# Find number of cars in each status
select status,
count(*) as total_cars
from Cars
group by status;

#Show customers who gave rating less than 3
select
c.customer_name,
f.rating,
f.comment
from Feedback f
join Customer c
on f.customer_id = c.customer_id
where rating < 3;

# Find total maintenance records
select count(*) as total_maintenance_records
from Maintenance;

#Show feedback comments with customer names
select
c.customer_name,
f.comment
from Feedback f
join Customer c
on f.customer_id = c.customer_id;

