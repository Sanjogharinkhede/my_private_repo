INSERT INTO Books (Title, Author, ISBN, Publisher, PublishedYear, TotalCopies, AvailableCopies, Genre)
VALUES 
('Pride and Prejudice', 'Jane Austen', '9780141439518', 'Modern Library', 1993, 10, 10, 'Classic'),
('Moby Dick', 'Herman Melville', '9781503280786', 'Penguin Classics', 1951, 8, 8, 'Adventure'),
('Great' 'Expectations','Charles Dickens',9780141439563,'Penguin Classics',1961,10,10,'Classic'),
('War and Peace','Leo Tolstoy',9781400079988,'Vintage',1969,12,12,'Historical Fiction'),
('Anna Karenina','Leo Tolstoy',9780143035008,'Penguin Classics',1977,10,9,'Classic'),
('Wuthering Heights','Emily Brontë',9780141439556,'Penguin Classics',1947,8,8,'Classic');



SELECT 
    customers.Name AS CustomerName,
    customers.Email AS CustomerEmail,
    orders.TotalAmount AS OrderAmount
FROM 
    orders
INNER JOIN 
    customers
ON 
    customers.CustomerID = orders.CustomerID
WHERE 
    orders.TotalAmount > (SELECT AVG(TotalAmount) FROM orders)



SELECT 
    customers.Name AS Name,
    customers.Email AS Email,
    'Last 30 Days Orders' AS OrderCategory
FROM 
    customers
INNER JOIN 
    orders
ON 
    customers.CustomerID = orders.CustomerID
WHERE 
    orders.OrderDate >= CURDATE() - INTERVAL 30 DAY

UNION

SELECT 
    customers.Name AS Name,
    customers.Email AS Email,
    'No Orders' AS OrderCategory
FROM 
    customers
LEFT JOIN 
    orders
ON 
    customers.CustomerID = orders.CustomerID
WHERE 
    orders.OrderID IS NULL;




START TRANSACTION;

Select * from orders;

INSERT INTO orders (CustomerID, OrderDate, TotalAmount,status)
VALUES (1, CURDATE(), 500.00,"Pending");


COMMIT;


START TRANSACTION;

UPDATE orders
SET TotalAmount = 999.00
WHERE OrderID = 1;

Select * from orders;

ROLLBACK;

Select * from orders;


START TRANSACTION;

INSERT INTO orders (CustomerID, OrderDate, TotalAmount, Status)
VALUES (10, '2025-01-20', 2150.00, 'Completed');
INSERT INTO orders (CustomerID, OrderDate, TotalAmount, Status)
VALUES (1, '2025-01-20', 550.00, 'Pending');

SAVEPOINT Monday;

INSERT INTO orders (CustomerID, OrderDate, TotalAmount, Status)
VALUES (11, '2025-01-21', 3200.00, 'Pending');
INSERT INTO orders (CustomerID, OrderDate, TotalAmount, Status)
VALUES (10, '2025-01-20', 550.00, 'Completed');

SAVEPOINT Tuesday;

INSERT INTO orders (CustomerID, OrderDate, TotalAmount, Status)
VALUES (8, '2025-01-22', 1520.00, 'Completed');
INSERT INTO orders (CustomerID, OrderDate, TotalAmount, Status)
VALUES (8, '2025-01-22', 120.00, 'Completed');
SAVEPOINT Wednesday;

Select * from Orders;
ROLLBACK TO SAVEPOINT Tuesday