-- Retrieve all the customers names and addresses who lives in United States
select name, address 
from customers 
where country=' United States';

--Retrieve all the customers ordered by ascending name
select * 
from customers
order by name asc;

--Retrieve all the products which cost more than 100
select * 
from products
where unit_price > 100;

--Retrieve all the products whose name contains the word socks
select *
from products 
where product_name 
like '%socks%';

--Retrieve the 5 most expensive products
select *
from products 
order by unit_price desc
limit 5;

--Retrieve all the products with their corresponding suppliers. 
--The result should only contain the columns product_name, unit_price and supplier_name
select products.product_name, products.unit_price, suppliers.supplier_name 
from products 
join suppliers on suppliers.id = products.supplier_id;

--Retrieve all the products sold by suppliers based in the United Kingdom. 
--The result should only contain the columns product_name and supplier_name
select products.product_name, suppliers.supplier_name 
from products
join suppliers on suppliers.id = products.supplier_id
where suppliers.country ='United Kingdom';

--Retrieve all orders from customer ID 
select *
from orders
where customer_id = 1;

-- Retrieve all orders from customer named Hope Crosby
select *
from orders 
join customers on customers.id = orders.customer_id
where customers.name = 'Hope Crosby';

--Retrieve all the products in the order ORD006. 
--The result should only contain the columns product_name, unit_price and quantity.
select products.product_name, products.unit_price, order_items.quantity, orders.order_reference
from orders
join order_items on orders.id = order_items.order_id
join products on order_items.product_id = products.id
where orders.order_reference = 'ORD006';

--Retrieve all the products with their supplier for all orders of all customers. 
--The result should only contain the columns name (from customer), order_reference order_date, product_name, supplier_name and quantity.
select customers.name, orders.order_reference, orders.order_date, products.product_name, suppliers.supplier_name, order_items.quantity 
from customers 
join orders on customers.id = orders.customer_id 
join order_items on orders.id = order_items.order_id
join products on order_items.product_id = products.id
join suppliers on products.supplier_id = suppliers.id;

--Retrieve the names of all customers who bought a product from a supplier from China.
select customers.name 
from customers  
join orders on orders.customer_id = customers.id 
join order_items on orders.id = order_items.order_id
join products on order_items.product_id  = products.id
join suppliers on products.supplier_id = suppliers.id
where suppliers.country='China';