

use HR 
go

select * from EMPLOYEES
SELECT * from COUNTRIES
SELECT * from locations

-- 1
SELECT FIRST_NAME, LAST_NAME from EMPLOYEES WHERE DEPARTMENT_ID =Any (select DEPARTMENT_ID from DEPARTMENTS where LOCATION_ID =ANY (select LOCATION_ID from LOCATIONS 
WHERE COUNTRY_ID = (select COUNTRY_ID from COUNTRIES where COUNTRY_NAME = 'United Kingdom')))

-- 2
SELECT city from locations where country_id =any (
SELECT country_id from COUNTRIES where region_id = (select region_id from REgions where region_name = 'Asia' ))

-- 3
SELECT * from employees where manager_id =any 
(select manager_id from employees where department_id = 
(SELECT department_id from departments where location_id = 
(select location_id from locations where city = 'Toronto')))

-- 4
select department_name from departments where location_id = 
(SELECT location_id from locations where state_province = 'California')

--5 
SELECT first_name, last_name from employees where employee_id =any 
(SELECT manager_id from employees WHERE department_id =
(SELECT department_id from departments where location_id = 
(select location_id from locations where street_address = '2011 Interiors Blvd')
))


--- b
--1) 
use AdventureWorks2019

SELECT * from Sales.Customer
SELECT * from production.Product
SELECT * from sales.SalesOrderDetail
SELECT * from sales.SalesOrderHeader
SELECT * from Person.address
SELECT * from person.person

-- 1

SELECT
    person.FirstName,
    person.LastName,
    product.name
FROM
    Production.Product as product,
    Person.person as person,
    sales.SalesOrderDetail as detail,
    sales.SalesOrderHeader as header,
    sales.Customer as cust

WHERE
    product.ProductID =any
    (SELECT detail.ProductID  WHERE detail.SalesOrderID =any
    (SELECT header.SalesOrderID where header.CustomerID =any
    (SELECT cust.CustomerID WHERE person.BusinessEntityID = cust.CustomerID)))
    




-- 2
SELECT ProductID, Name
FROM production.Product
WHERE ProductID NOT IN (
    SELECT DISTINCT ProductID
    FROM sales.SalesOrderDetail
);

-- 3 
SELECT ProductID, Name
FROM production.Product
WHERE ProductID IN (
    SELECT DISTINCT ProductID
    FROM sales.SalesOrderDetail
);


