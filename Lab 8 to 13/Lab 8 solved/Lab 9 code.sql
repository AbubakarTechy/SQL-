create database classicmodels;
use classicmodels;

-- ____________________________Q:1
select firstName,lastName
from employees
where officeCode in
(select officeCode from offices where country="USA");


-- ____________________________Q:2
select * 
from customers
where customerNumber in
(select customerNumber from payments where amount >1000 and amount <5000 );

-- ____________________________Q:3
select customerName,phone
from customers
where customerNumber in 
(select customerNumber from orders where year(orderDate)=2003 and year(shippedDate)=2003);


-- ____________________________Q:4
select *
from customers 
where customerNumber not in
(select customerNumber from orders);

select customerNumber from orders;

-- ____________________________Q:5
select productName, productCode
from products
where productCode in
(select productCode from orderdetails where quantityOrdered >30 and quantityOrdered<50);

-- ____________________________Q:6
select customerName
from customers 
where customerNumber in
(select customerNumber from orders where status="cancelled");


-- ____________________________Q:7
select orderNumber from
orders
where orderNumber in
(select orderNumber from orderdetails group by orderNumber
having sum(quantityOrdered* priceEach) >60000);

-- ____________________________Q:8
SELECT DISTINCT customerNumber
FROM orders 
WHERE EXISTS (
    SELECT 1
    FROM orderDetails 
    WHERE orderNumber = orderNumber
    GROUP BY orderNumber
    HAVING SUM(quantityOrdered * priceEach) > 60000);

