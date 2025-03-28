use bikeinventory;

-- 1. 
select *
from customers;

-- 2.You need to provide customer firstname, lastname and email id --
select first_name, last_name, email
from customers;

-- 3.Retrieve bike details based on a specific brand
select*
from brands
where brand_name = "Surly";

-- 4.Get the total number of orders placed
select count(distinct order_id) as total_order 
from order_items;

-- 5.Retrieve details of all items in a specific order (e.g., order_id = 1).
select *
from order_items
where order_id = 1;

-- 6.Find the total number of customers.
select count(*)
from customers;

-- 7.Retrieve all orders placed in the year 2016.
select *
from orders
where order_date like "%2016%";

-- 8.Retrieve all products along with their brand names.
select *
from products as P join brands as B 
on P.brand_id=B.brand_id;

-- 9.Find all customers who have placed an order, along with their order details.
select C.first_name, C.last_name, O.order_id, O.order_date
from customers as C join orders as O
on C.customer_id = O.customer_id;

-- 10.List all products along with their category names.
select P.product_name, C.category_name
from products as P join categories as C 
on P.category_id = C.category_id;

-- 11.Find which store has sold the most orders.
select S.store_name, count(O.order_id) as total_orders
from stores as S join orders as O
on S.store_id = O.store_id
group by S.store_name
order by total_orders
limit 1;


-- 12.Show the most expensive products first.
select*
from products
order by list_price desc;

-- 13.List the most recent orders.
select *
from orders
order by order_date desc;

-- 14.Get all products that belong to a specific category (e.g., "Mountain Bikes")
select P.product_name, P.category_id, P.list_price, C.category_name
from products as P join categories as C 
on P.category_id = C.category_id
where C.category_name = "Mountain Bikes";

-- 15.Find the Top 10 Best-Selling Products
select p.product_id, p.product_name, SUM(oi.quantity) AS total_quantity_sold
from order_items oi
join products p ON oi.product_id = p.product_id
group by p.product_id, p.product_name
order by total_quantity_sold DESC
limit 10;

-- 16.Calculate the Total Revenue Generated
select SUM(oi.quantity * p.list_price) AS total_revenue
from order_items oi
join products p 
ON oi.product_id = p.product_id;

-- 17.Get the Total Quantity of Each Product Sold
select p.product_id, p.product_name, SUM(oi.quantity) AS total_quantity_sold
from products p
join order_items oi ON p.product_id = oi.product_id
group by p.product_id, p.product_name
order by total_quantity_sold DESC;
