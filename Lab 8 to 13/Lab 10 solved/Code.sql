create database swirl;
use swirl;

-- Q:1

select Title, count(TrackId)
from album as a
join track as t
on a.AlbumId=t.AlbumId
group by Title
order by TrackId desc;


-- Q:2

select Name, min(Quantity), max(Quantity),avg(Quantity) ,sum(Quantity)
from Track as t
join InvoiceLine as l
on t.TrackId=l.TrackId
group by Name
order by name
limit 1000;


-- Q:3

select FirstName,LastName
from customer as c
where exists(
	select * from invoice as i
    where c.CustomerId=i.CustomerId
    and year(InvoiceDate)=2013
);

-- Q:4
select FirstName, LastName
from employee
where employeeId= any(
select SupportRepId from customer as c
where country="brazil"
);

-- ______Q:5
select FirstName, LastName, Birthdate
from employee
order by Birthdate 
limit 1;

-- ---------- Q:6
select InvoiceLineId
from invoiceline
where UnitPrice>(
		select avg(UnitPrice)
        from invoiceline
);

-- --_---------- Q:7
select i.InvoiceId,BillingState,BillingCity,
sum(li.UnitPrice * li.Quantity)
from invoice as i
join invoiceline as li
on i.InvoiceId = li.InvoiceId
group by i.InvoiceId,BillingState,BillingCity
order by i.InvoiceId;

-- --_---------- Q:8
select EmployeeId,LastName,FirstName
from employee
where employeeId in(
select distinct 	ReportsTo from employee where reportsTo is not null);

-- --_---------- Q:9
select * from 
invoice as i
where InvoiceDate = (
		select Max(InvoiceDate)
        from invoice
);