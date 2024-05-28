use Assignments;

/*Question (1) Implement the provided relation model using SQL ( DDL part )
-- Create tables (Customer, Product and Orders)*/

Create Table Customer
(
customer_id int Primary key,
customer_name varchar (50),
customer_Tel int
);

Create Table product
(
product_id int Primary key,
product_name varchar (50),
category varchar (30),
price float
);

Create Table Orders
(
customer_id int references Customer(customer_id),
product_id int references Product (product_id),
order_date date,
quantity int,
total_amount float
);

/*Question (2) Insert data into your tables ( DML part )
insert data into tables (Customer, Product, Orders)*/

insert into Customer (customer_id, customer_name, customer_Tel) values (1, 'John Smith','1234567890');

insert into Customer (customer_id, customer_name, customer_Tel) values (2, 'Emma Johnson', '1432789890');

insert into Customer (customer_id, customer_name, customer_Tel) values (3, 'Michael Lee', '1475619610');

insert into Customer (customer_id, customer_name, customer_Tel) values (4, 'Sarah Johnson', '1344029756');

insert into Customer (customer_id, customer_name, customer_Tel) values (5, 'David Kim', '1810521410');

insert into Customer (customer_id, customer_name, customer_Tel) values (6, 'Sarah Davis', '1808257900');

--insert data into table Product

insert into Product (Product_id, product_name, category, price) values (01, 'Oraimo Smart watch', 'gadget', 25500.00); 

insert into Product (Product_id, product_name, category, price) values (02, 'HP Spectre laptop', 'gadget', 855000.00); 

insert into Product (Product_id, product_name, category, price) values (03, 'Battery widget', 'Widget', 1200.00); 

insert into Product (Product_id, product_name, category, price) values (04, 'NumptyMe Bluetooth Relay Controller', 'widget',2000.00); 

insert into Product (Product_id, product_name, category, price) values (05, 'F-Pro Bluetooth Bud', 'gadget',8500.00); 

insert into Product (Product_id, product_name, category, price) values (06, 'Amazon Read on', 'widget',900.00); 

--insert data into table Orders

insert into Orders (customer_id, product_id, order_date, quantity, total_amount) values (1, '01', '2022-05-17', 2, 50000.00); 

insert into Orders (customer_id, product_id, order_date, quantity, total_amount) values (2, '02', '2022-05-18', 1, 855000.00); 

insert into Orders (customer_id, product_id, order_date, quantity, total_amount) values (3, '03', '2022-05-18', 1, 1200.00);

insert into Orders (customer_id, product_id, order_date, quantity, total_amount) values (4, '04', '2022-05-19', 1, 2000.00);

insert into Orders (customer_id, product_id, order_date, quantity, total_amount) values (5, '05', '2022-05-21', 3, 25000.00);

insert into Orders (customer_id, product_id, order_date, quantity, total_amount) values (6, '05', '2022-05-23', 1, 900.00);


/*Question (3) Write a SQL query to retrieve the names of the customers who have placed an order for at least one widget and at least one gadget, 
along with the total cost of the widgets and gadgets ordered by each customer.
The cost of each item should be calculated by multiplying the quantity by the price of the product.*/


SELECT C.customer_name, 
 SUM(O.quantity * P.price) AS 'Total_cost'
FROM Customer C
JOIN Orders O ON C.customer_id = O.customer_id
JOIN product P ON O.product_id = P.product_id
WHERE P.category IN ('Widget', 'Gadget')
GROUP BY C.customer_name
;
 
 --or 

   WITH Widget_GadgetOrders AS (
    SELECT C.customer_name, 
           SUM(O.quantity * P.price) AS Total_cost
    FROM Customer C
    JOIN Orders O ON C.customer_id = O.customer_id
   JOIN product P ON O.product_id = P.product_id
    WHERE P.category IN ('Widget', 'Gadget')
    GROUP BY C.customer_name
)
SELECT * 
FROM Widget_GadgetOrders;


/*Question (3) Write a query to retrieve the names of the customers who have placed an order for at least one widget, 
along with the total cost of the widgets ordered by each customer.*/

SELECT C.customer_name, p.product_name, p.category,
 SUM(O.quantity * P.price) AS 'Total_cost'
FROM Customer C
JOIN Orders O ON C.customer_id = O.customer_id
JOIN product P ON O.product_id = P.product_id
WHERE P.category = 'Widget'
GROUP BY C.customer_name, p.product_name, p.category
;


/* Question (5) Write a query to retrieve the names of the customers who have placed an order for at least one gadget,
  along with the total cost of the gadgets ordered by each customer.*/
 
 SELECT C.customer_name, p.product_name, p.category,
 SUM(O.quantity * P.price) AS 'Total_cost'
FROM Customer C
JOIN Orders O ON C.customer_id = O.customer_id
JOIN product P ON O.product_id = P.product_id
WHERE P.category = 'Gadget'
GROUP BY C.customer_name, p.product_name, p.category
;

/*select p.product_name, p.category, C.customer_name from product P
join Orders O on P.product_id= O.product_id
join Customer C on O.customer_id = C.customer_id
Group By P.product_name, p.category, c.customer_name;*/


/*Question (6): Write a query to retrieve the names of the customers who have placed an order for at least one doohickey,
  along with the total cost of the doohickeys ordered by each customer.*/

  WITH DoohickeyOrders AS (
    SELECT C.customer_name, P.product_name, P.category,
           SUM(O.quantity * P.price) AS Total_doohickey_cost
    FROM Customer C
    JOIN Orders O ON C.customer_id = O.customer_id
   JOIN product P ON O.product_id = P.product_id
    WHERE P.category = 'Gadget'
    GROUP BY C.customer_name, P.product_name, P.category
	)
SELECT * 
FROM DoohickeyOrders;


/* Question (7): Write a query to retrieve the total number of widgets and gadgets ordered by each customer,
   along with the total cost of the orders.*/

	SELECT C.customer_name,  P.product_name, 
 SUM(O.quantity) AS total_quantity,
 SUM(O.quantity * P.price) AS total_cost
FROM Customer C
JOIN Orders O ON C.customer_id = O.customer_id
JOIN product P ON O.product_id = P.product_id
WHERE P.category IN ('Widget', 'Gadget')
GROUP BY C.customer_name, P.product_name
;
 
/*Question (8) Write a query to retrieve the names of the products that have been ordered by at least one customer, 
  along with the total quantity of each product ordered.*/

  select P.product_name, 
  SUM(O.quantity) AS total_quantity
  from product P
  join Orders O on P.product_id= O.product_id
  GROUP BY P.product_name 
  HAVING SUM(O.quantity) > 0;

/* Question (9):Write a query to retrieve the names of the customers who have placed the most orders, 
along with the total number of orders placed by each customer.*/

SELECT C.customer_name, 
       COUNT(*) AS Total_number_of_orders
FROM Customer C
JOIN Orders O ON C.customer_id = O.customer_id
GROUP BY C.customer_name
ORDER BY Total_number_of_orders DESC;

/* Question (10): Write a query to retrieve the names of the products that have been ordered by at least one customer, 
along with the total quantity of each product ordered.*/

SELECT P.product_name, 
       SUM(O.quantity) AS Total_quantity_ordered
FROM Product P
JOIN Orders O ON P.product_id = O.product_id
GROUP BY P.product_name
HAVING SUM(O.quantity) > 0;
  
/* Question (11): Write a query to retrieve the names of the customers who have placed an order on every day of the week,
   along with the total number of orders placed by each customer.*/

   SELECT C.customer_name, 
       COUNT(DISTINCT O.order_date) AS Total_days_with_orders,

       COUNT(*) AS Total_number_of_orders
FROM Customer C
JOIN Orders O ON C.customer_id = O.customer_id
GROUP BY C.customer_name
ORDER BY Total_days_with_orders;