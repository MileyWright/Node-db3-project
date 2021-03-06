-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
Select ProductName, CategoryName 
From Product
Join  Category
on product.Categoryid = category.id;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT Id, CompanyName, ShipVia, o.OrderDate
FROM [order] as o
JOIN Shipper
ON  o.ShipVia = Shipper.Id
WHERE o.OrderDate < '2012-08-09';

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT ProductName, OrderId, Quantity
FROM Product as p
JOIN OrderDetail as o
ON  p.Id = o.ProductId
WHERE OrderId = 10251;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT o.Id as OrderID, ShipName as CustomerCompanyName, LastName
FROM Employee as e
JOIN [order] as o
ON  e.Id = o.EmployeeId