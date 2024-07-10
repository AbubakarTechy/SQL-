create database bankschema;
use bankschema;

-- ________________Q:1
select name, phoneNum
from customer AS c
inner join 
loanaccounts AS l
on c.customer_id=l.customer_id where current_credit > 15000;

-- ___________________Q:2 ----->
select name, Address
from customer 
where customer_id in
(select customer_id from loanaccounts
 where name="Imran Khan");
 
 -- ___________________Q:3

 select c.name, c.phoneNum, la.current_credit
from  customer c
left join
    loanaccounts la on c.customer_id = la.customer_id
where
    la.current_credit is null;

 
 -- ___________________Q:4   
select c.* from customer c
where c.customer_id in (
    select la.customer_id
    from loanaccounts la
)
and c.customer_id not in (
    select sa.customer_id
    from savingaccounts sa
);


 -- ___________________Q:5 
select t.*,c.name AS customer_name, e.name AS salesman_name
from transaction t
join 
    loanaccounts la on t.loanAccount_number = la.Account_number
join 
    customer c on la.customer_id = c.customer_id
join 
    employee e on t.eid = e.eid;


 -- ___________________Q:6 
 select c.*, sa.*, branch_id
from customer c
join savingaccounts sa On c.customer_id = sa.customer_id
where c.customer_id in(select sa.customer_id from savingaccounts sa);

 
 -- ___________________Q:7 
 select 
    c.name AS customer_name,
    c.Address AS customer_address,
    b.branch_address AS branch_address,
    bk.bank_name AS bank_name
from customer c
join 
    savingaccounts sa on c.customer_id = sa.customer_id
join 
    branch b on sa.branch_id = b.branch_id
join 
    bank bk on b.bank_id = bk.bank_id;
    
 -- ___________________Q:8
select b.branch_id, b.branch_address
from branch b
where b.bank_id in (
    select bk.bank_id
    from bank bk
    where bk.bank_name = 'Allied Bank Limited'
);


 -- ___________________Q:9

select
    e.name AS employee_name,
    e.designation,
    b.branch_address,
    bk.bank_name
from employee e
right join
    branch b on e.branch_id = b.branch_id
right join 
    bank bk on b.bank_id = bk.bank_id;

 -- ___________________Q:10
 
 select distinct b.branch_id
from branch b
where  b.branch_id in (
    select la.branch_id
    from loanaccounts la
) and b.branch_id in (
    select sa.branch_id
    from savingaccounts sa
);


 
 