-- _______________________________TASK # 1
create database WeddingDress0371;
use WeddingDress0371;

-- _______________________________TASK # 2
create table Customer0371(
CustomerId int primary key,
CName varchar(10),
CAge int not null,
CAddress varchar(10),
CContactNumber int
);

-- _______________________________TASK # 3
INSERT INTO  Customer0371
values
(CustomerId, CName, CAge, CAddress,CContactNumber),
(1 ,"Ayesha", 24 , "Johar Town" , 0300-1234567 ),
(4,"Ahmed", 29 , "Wapda Town" , 0333-1234567 ),
(6,"Rameen", 27 , "DHA" ,  null ),
(2,"Amina", 20 , "Model Town" , 0334-1234567 ),
(3,"Kashif", 18 , "Gulberg" , 03336-1234567 );

-- _______________________________TASK # 4

Create table Designer0371(
DesignerId int primary key,
DName varchar(10) not null,
DCategory varchar(20) not null,
DContactNumber int not null
);

-- _______________________________TASK # 5
insert into Designer0371
values
(DesignerId, DName,DCategory,DContactNumber),
(100 , "MariaB" , "Unstiched Ladies" ,03039548035 ),
(101 , "Charcoal" , "Men Dressing" ,03339540025 ),
(102 , "Sana Safinaz" , "Unstiched Ladies" ,03359544036 ),
(103 , "Khaadi" , "Unstiched Ladies" ,03359837449 ),
(104 , "Oxford" , "Warm Clothes" ,03042234441 );

-- _______________________________TASK # 6
create table customerDesigner0371(
CDID int primary key,
CustomerId int not null,
foreign key (CustomerId) references Customer(CustomerId),
DesignerId int not null,
foreign key(DesignerId) references Designer(DesignerId),
DressType varchar(25) not null,
Priority varchar(25) default 'Normal'
);


-- _______________________________TASK # 7
insert into customerDesigner0371
values
(CDID, CustomerId, DesignerId,DressType, priority),
(1, 1 , 103, "Sari" , "normal"),
(2, 1 , 102, "Fancy Suit" , "normal"),
(3, 1 , 103, "Fancy Suit" , "urgent"),
(4, 4 , 101, "Waiscot" , "urgent"),
(5, 4, 104, "Sweater" , "urgent"),
(6, 6 , 100, "Fancy Suit" , "normal"),
(7, 2 , 100, "Fancy Suit" , "normal"),
(8, 6 , 100, "Winter Suit" , "urgent"),
(9, 3 , 104, "Kurta" , "normal"),
(10, 3 , 104, "Sweater" , "normal");

-- _______________________________TASK # 8

select count(*)
from customerDesigner0371;

-- _______________________________TASK # 9
select CustomerId, count(*)
from Customer0371
group by CustomerId;

-- _______________________________TASK # 10

select DesignerId, count(*)
from Designer0371
group by DesignerId;

-- _______________________________TASK # 11

select count(*)
from customerDesigner0371
where priority="normal";

-- _______________________________TASK # 12

select c.CName ,d.CustomerId
from Customer0371 as c
join customerDesigner0371 as d
on c.CustomerId=d.CustomerId
group by CName
 having count(d.DressType) >1;

-- _______________________________TASK # 13
select D.DName
from Designer0371 D
join customerDesigner0371 CD 
on D.DesignerID = CD.DesignerID
group by D.DName
order by COUNT(*) desc
limit 1;

-- _______________________________TASK # 14
select C.CName
from Customer0371 C
join customerDesigner0371 CD 
on C.CustomerID = CD.CustomerID
group by C.CName
order by COUNT(*) ASC
limit 1;

-- _______________________________TASK # 15
select DName
from Designer0371
order by DName
LIMIT 1;

-- _______________________________TASK # 16
select C.CName, D.DName
from customerDesigner0371 CD
join Customer0371 C
on CD.CustomerID = C.CustomerID
JOIN Designer0371 D 
ON CD.DesignerID = D.DesignerID
ORDER BY CD.CDID
LIMIT 1;

-- _______________________________TASK # 17
select C.CName, CD.DressType
from Customer0371 as C
join customerDesigner0371 CD 
ON C.CustomerID = CD.CustomerID;

-- _______________________________TASK # 18

select C.CName, D.DName, CD.Priority
from Customer0371 C
join customerDesigner0371 CD 
on C.CustomerID = CD.CustomerID
join Designer0371 D 
on CD.DesignerID = D.DesignerID;

-- _______________________________TASK # 19
alter table Designer0371
MODIFY COLUMN DCategory0371 varchar(35);

-- _______________________________TASK # 20
update Designer0371
set DCategory = 'Unstitched Ladies Suit'
where DCategory = 'Unstitched Ladies';
-- _______________________________TASK # 21

select C.CName, CD.DressType, CD.Priority
from Customer0371 C
join CustomerDesigner0371 CD 
on C.CustomerID = CD.CustomerID
join Designer0371 D
on CD.DesignerID = D.DesignerID
where D.DName = 'MariaB';

-- _______________________________TASK # 22

delete from Customer0371
WHERE CName = 'Kashif';
-- _______________________________TASK # 23

update Designer0371
set DContactNumber = '0300-1111111'
where DName = 'Khaadi';

-- _______________________________TASK # 24
select distinct D.DName, D.DContactNumber
from Designer0371 D
join CustomerDesigner0371 CD
on D.DesignerID = CD.DesignerID
where CD.Priority = 'Urgent';



