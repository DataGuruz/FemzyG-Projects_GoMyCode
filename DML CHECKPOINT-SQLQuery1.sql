create Database Assignment;
use Assignment;

--Question 1) Write the appropriate SQL queries to insert all the provided records in their corresponding tables.

--create tables Products, Cusomers, Orders
create Table Products(
product_name varchar (70), 
price float
);

create Table Customers(
customer_name varchar (70),
address varchar (100)
);

create Table Orders(
customer_id int, 
product_id int,
quantity int,
order_date date
);

--insert given values into tables Products, Cusomers, Orders

insert into Products (product_name, price) values('cookies', '10');

insert into Products (product_name, price) values('candy', '5.2');

insert into Customers(customer_name, address) values('Ahmed', 'Tunisia');

insert into Customers(customer_name, address) values('Coulibaly', 'Senegal');

insert into Customers(customer_name, address) values('Hassan', 'Egypt');

insert into Orders (customer_id, product_id, quantity, order_date) values('1', '2', '3','2023-01-22');

insert into Orders (customer_id, product_id, quantity, order_date) values('2', '1', '10','2023-04-14');

--Question 2) Update the quantity of the second order, the new value should be 6

UPDATE Orders SET quantity = 6 WHERE customer_id=2;

--Question 3) Delete the third customer from the customers table

DELETE FROM customers WHERE customer_name = 'Hassan';
 select * from Customers;

--Question 4) Delete the orders table content then drop the table.

 DELETE FROM Orders; 
 DROP TABLE orders;

