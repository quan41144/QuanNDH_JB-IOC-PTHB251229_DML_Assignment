-- create table customers
create table customers(
	customer_id serial primary key,
	full_name varchar(100) not null,
	email varchar(100) not null unique,
	phone varchar(15) unique,
	city varchar(100),
	join_date date
);
-- create table products
create table products(
	product_id serial primary key,
	product_name varchar(100) not null,
	category varchar(100),
	price numeric(15,2) check(price >= 0),
	stock_quantity int check(stock_quantity >= 0)
);
create type status_type as enum('PENDING', 'DELIVERIED', 'SUCCESS', 'CONFIRMED');
-- create table orders
create table orders(
	order_id serial primary key,
	customer_id int references customers(customer_id),
	order_date date default current_date,
	total_amount numeric(15,2) check(total_amount >= 0),
	status status_type default 'PENDING'
);
-- add 10 customers
select * from customers;
insert into customers(full_name, email, phone, city, join_date) values
('Nguyen Duc Hong Quan', 'quan41144@gmail.com', '0962416952', 'Hanoi', '01-01-2026'),
('Nguyen Hong Quan', 'quan411445@gmail.com', '0962416954', 'Hanoi', '02-01-2026'),
('Pham Bao Chau', 'chau@gmail.com', '0962416953', 'Hanoi', '03-01-2026'),
('Nguyen Duc Binh', 'binh41144@gmail.com', '0962386952', 'Hanoi', '04-01-2026'),
('Nguyen Duc Tho', 'tho41144@gmail.com', '0965676952', 'Hanoi', '05-01-2026'),
('Nguyen Duc Minh', 'minh41144@gmail.com', '0962423452', 'Hanoi', '01-02-2025'),
('Nguyen Duc Hung', 'hung41144@gmail.com', '0638416952', 'Hanoi', '02-02-2025'),
('Nguyen Duc Hien', 'hien41144@gmail.com', '0962434567', 'Hanoi', '01-03-2025'),
('Nguyen Duc Tinh', 'tinh41144@gmail.com', '0962349523', 'Hanoi', '01-04-2025'),
('Le Duc Luong', 'luong41144@gmail.com', '0678416952', 'Hanoi', '06-06-2025');
-- add 15 products
select * from products;
insert into products(product_name, category, price, stock_quantity) values
('Iphone 16', 'Electronics', 30000000, 10),
('Iphone 15', 'Electronics', 27000000, 12),
('Iphone 14', 'Electronics', 22000000, 11),
('Iphone 13', 'Electronics', 17000000, 5),
('Iphone 12', 'Electronics', 13000000, 6),
('Laptop hp intel i3', 'Electronics', 4000000, 7),
('Laptop hp intel i5', 'Electronics', 10000000, 20),
('Laptop hp intel i7', 'Electronics', 15000000, 30),
('Laptop hp intel i9', 'Electronics', 35000000, 15),
('Laptop dell intel i7', 'Electronics', 32000000, 27),
('Choi lau nha', 'household goods', 100000, 50),
('Dua', 'household goods', 20000, 30),
('Bat', 'household goods', 15000, 20),
('Giuong', 'household goods', 3000000, 5),
('Tu', 'household goods', 2000000, 7);
-- add 8 orders
select * from orders;
insert into orders(customer_id, status) values
(1, 'PENDING'),
(2, 'SUCCESS'),
(3, 'DELIVERIED'),
(3, 'PENDING'),
(4, 'SUCCESS'),
(5, 'PENDING'),
(6, 'DELIVERIED'),
(7, 'SUCCESS');
-- create table order_details
create table order_details(
	order_id serial not null references orders(order_id),
	product_id serial not null references products(product_id),
	quantity int check(quantity > 0),
	price numeric(15,2) check(price >= 0),
	primary key(order_id, product_id)
);
-- insert data into order_details
insert into order_details(order_id, product_id, quantity, price) values
(1,1,10,1700000),
(2,3,5,8000000),
(1,4,2,400000),
(2,6,10,17000000),
(3,1,2,18000000),
(4,2,3,15000000),
(4,7,10,180000),
(1,7,10,220000),
(5,5,3,500000),
(7,5,3,480000),
(4,5,2,7000000),
(6,3,2,11000000),
(3,3,2,650000),
(2,1,10,17000000),
(1,5,10,17000000),
(6,1,10,17000000),
(7,1,10,17000000);
-- update price 'Electronics' of category to increase 10%
update products
set price = price * 1.10
where category = 'dien thoai cam ung';
-- update phone for customers where email is not null
select * from customers order by customer_id asc;
update customers set phone = '0962423252', email = 'hien42244@gmail.com' where customer_id = 4;
-- update status with values from 'PENDING' to 'CONFIRMED'
update orders set status = 'CONFIRMED' where status = 'PENDING';
-- remove products with a stock quantity of 0
delete from products where stock_quantity = 0;
-- remove customers who have no orders
delete from customers where customer_id not in (select distinct customer_id from orders);