-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
select p.ProductName, c.CategoryName from product as p join category as c on p.categoryid = c.id;
-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
select id, ShipName from [order] where OrderDate < '2012-08-09';

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
select p.ProductName, o.quantity 
from Product as p 
join OrderDetail as o 
on o.productid = p.id
where o.orderid = 10251
order by p.productname;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
select o.id as 'OrderID', c.companyname as 'Company Name' , e.lastname as 'Employee LastName'
from [order] as o
join customer as c on c.id = o.customerid
join employee as e on e.id = o.employeeid
