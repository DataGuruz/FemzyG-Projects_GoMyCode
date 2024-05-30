use Assignments;


/* Question (1): Convert the given entity-relationship diagram into a relational model.

                Wine (NumW, Category, Year, Degree)

				Producer (NumP, FirstName, LastName, Region)

                Harvest (Quantity, #NumW, #Nump)

  Question (2): Implement the relational model using SQL. */

  Create Table Wine
  (
  num_w int Primary key,
  category varchar (50),
  year int,
  degree float
  );

  CREATE Table Producer
  (
  num_P int Primary key,
  first_name varchar (50),
  last_name varchar (50),
  region varchar (70)
  );

  CREATE Table Harvest(
  PRIMARY KEY (num_w, num_p),
  Quantity int,
  num_W int FOREIGN KEY references Wine (num_W),
  num_p int FOREIGN KEY references Producer (num_P)
  );

 

  /* Question (3): Insert data into the database tables.*/

     INSERT INTO Wine (num_w, category, year, degree) VALUES (1, 'Red', 2018, 13.5); 

     INSERT INTO Wine (num_w, category, year, degree) VALUES (2, 'White', 2019, 12.8);

     INSERT INTO Wine (num_w, category, year, degree) VALUES (3, 'Rose', 2020, 11.7); 

     INSERT INTO Wine (num_w, category, year, degree) VALUES (4, 'Sparkling', 2017, 12.3);

	 INSERT INTO Wine (num_w, category, year, degree) VALUES (5, 'Chardonnay', 2016, 13.6);

	 INSERT INTO Wine (num_w, category, year, degree) VALUES(6, 'Cabernet Sauvignon', 2021, 11.4);

	 select * from Wine;


	 INSERT INTO Producer (num_P, first_name, last_name, region) VALUES (1, 'John', 'Smith', 'Napa Valley');

	 INSERT INTO Producer (num_P, first_name, last_name, region) VALUES (2, 'Emily', 'Davis', 'Bordeaux');
	
	 INSERT INTO Producer (num_P, first_name, last_name, region) VALUES (3, 'Michael', 'Johnson', 'Sousse');
	 
	 INSERT INTO Producer (num_P, first_name, last_name, region) VALUES (4, 'Sarah', 'Brown', 'Tuscany');

	 INSERT INTO Producer (num_P, first_name, last_name, region) VALUES (5, 'Maria', 'Garcia', 'Loire Valley');

	 INSERT INTO Producer (num_P, first_name, last_name, region) VALUES (6,'Sophie', 'Dubois', 'Adelaide');



	 INSERT INTO Harvest (quantity, num_w, num_p) VALUES (1000, 1, 1);
	
	 INSERT INTO Harvest (quantity, num_w, num_p) VALUES (800, 2, 2);

	 INSERT INTO Harvest (quantity, num_w, num_p) VALUES (1200, 3, 3);

	 INSERT INTO Harvest (quantity, num_w, num_p) VALUES (900, 4, 4);

	 INSERT INTO Harvest (quantity, num_w, num_p) VALUES (700, 5, 5);

	 INSERT INTO Harvest (quantity, num_w, num_p) VALUES (1400, 6, 6);
	  

	/* Question (4): Give the list of the producers.
	                                                  */
		SELECT * FROM Producer;

  /* Question (5): Give the list of producers sorted by name.
                                                           */
     SELECT first_name, last_name 
	 FROM Producer;

	             --OR

	 SELECT * FROM Producer order by first_name, last_name;

  /* Question (6): Give the list the producers of Sousse
                                                         */
      select * from Producer where region = 'Sousse'
	  order by first_name, last_name;

	                --OR

	 SELECT * FROM Producer
     WHERE region = 'Sousse';

	 /* Question (7): Calculate the total quantity of wine produced having the number 12.
	                                                                                   */

	 SELECT SUM(quantity) AS Total_quantity
     FROM Harvest
     WHERE num_w = 12;

	 /* Question (8): Calculate the quantity of wine produced by category.
	                                                                   */
	
	SELECT COUNT(Quantity) AS "Quantity of wine", Category 
    FROM Harvest H
    JOIN Wine W ON H.num_w = W.num_w
	GROUP BY W.category;


	/* Question (9): Which producers in the Sousse region have harvested at least one wine in quantities greater than 300 liters? 
	We want the names and first names of the producers, sorted in alphabetical order.  */

	SELECT W.num_w, P.region, P.first_name, P.last_name 
	FROM producer P
	JOIN Harvest H ON P.num_p = H.num_p
	JOIN Wine W ON H.num_w = W.num_w
	WHERE P.region = 'Sousse' AND H.quantity > 300
    ORDER BY H.quantity, P.first_name, P.last_name DESC;
	

	/* Question (10): List the wine numbers that have a degree greater than 12 and that have been produced by producer number 24.  */

	select W.num_w AS List_of_Wine_by_numbers, W.degree, P.num_P
	from Wine W 
	join Harvest H on W.num_w = H.num_w
	join Producer P on H.num_p = P.num_p 
	where W.degree > 12 AND P.num_p = '24'
	order by W.num_w;