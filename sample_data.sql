-- insert data into customers
insert into customers(full_name, email, phone, city, join_date) values
('Nguyen Van An', 'an.nguyen@gmail.com', '0901234567', 'Hanoi', '2025-01-10'),
('Tran Thi Bich', 'bich.tran@gmail.com', '0902345678', 'Ho Chi Minh', '2025-02-15'),
('Le Van Cuong', 'cuong.le@gmail.com', null, 'Da Nang', '2025-03-20'),
('Pham Thi Dung', 'dung.pham@gmail.com', '0904567890', 'Hanoi', '2025-04-05'),
('Hoang Van Em', 'em.hoang@gmail.com', '0905678901', 'Hai Phong', '2025-05-12'),
('Vu Thi Phuong', 'phuong.vu@gmail.com', '0906789012', 'Can Tho', '2025-06-18'),
('Dang Van Giang', 'giang.dang@gmail.com', '0907890123', 'Hanoi', '2025-07-22'),
('Bui Thi Hue', 'hue.bui@gmail.com', null, 'Ho Chi Minh', '2025-08-30'),
('Do Van Hung', 'hung.do@gmail.com', '0909012345', 'Da Nang', '2025-09-10'),
('Ngo Thi Khanh', 'khanh.ngo@gmail.com', '0910123456', 'Hue', '2025-10-01');
select * from customers;
-- insert data into products
insert into products(product_name, category, price, stock_quantity) values
('iPhone 15 Pro', 'Electronics', 28000000, 10),
('Samsung Galaxy S24', 'Electronics', 20000000, 15),
('Macbook Air M2', 'Electronics', 25000000, 8),
('Sony WH-1000XM5', 'Electronics', 8000000, 20),
('Chuot VXE R1 SE+', 'Electronics', 550000, 50),
('Ban phim Keychron', 'Electronics', 2000000, 30),
('Ghe Cong Thai Hoc', 'Furniture', 4500000, 5),
('Ban Nang Ha', 'Furniture', 7000000, 7),
('Den Ban Pixar', 'Furniture', 350000, 40),
('Gia Sach Go', 'Furniture', 1200000, 12),
('Sofa Phong Khach', 'Furniture', 15000000, 0),
('Ao Thun Basic', 'Fashion', 150000, 100),
('Quan Jean Nam', 'Fashion', 450000, 60),
('Giay Sneaker', 'Fashion', 1200000, 25),
('Balo Laptop', 'Fashion', 500000, 35);
select * from products;
-- insert data into orders
insert into orders(customer_id, order_date, status, total_amount) values
(1, '2025-11-01', 'PENDING', 28550000),
(1, '2025-12-05', 'SUCCESS', 2000000),
(2, '2025-11-10', 'DELIVERIED', 4500000),
(3, '2025-11-15', 'PENDING', 150000),
(4, '2025-11-20', 'SUCCESS', 25000000),
(5, '2025-12-01', 'CONFIRMED', 7000000),
(6, '2025-12-10', 'DELIVERIED', 1200000),
(7, '2025-12-20', 'SUCCESS', 550000);
select * from orders;
-- insert data into order_details
insert into order_details(order_id, product_id, quantity, price) values
(1, 2, 1, 28000000), 
(1, 9, 1, 550000),
(2, 7, 1, 2000000),
(3, 7, 1, 4500000),
(4, 12, 1, 150000),
(5, 3, 1, 25000000),
(6, 8, 1, 7000000),
(7, 14, 1, 1200000),
(8, 5, 1, 550000);
select * from order_details;