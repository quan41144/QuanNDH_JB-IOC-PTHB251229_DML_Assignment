-- search customers with name
select * from customers where full_name ilike 'Nguyen%';
-- filter products by price range
select * from products where price between 10000000 and 15000000;
-- search customers who don't have a phone number
select * from customers where phone is null;
-- top 5 the most expensive products
select * from products order by price desc limit 5 offset 0;
-- order list pagination
select * from orders limit 4 offset 4;
-- count the number of customers by city
select city, count(customer_id) as "Số khách hàng"
from customers group by city;
-- search orders within a specific timeframe
select * from orders
where order_date between '2025-01-01' and '2026-06-01';
-- search products have not been sold yet
select * from products p
where not exists (
	select * from order_details od
	where od.product_id = p.product_id
);
