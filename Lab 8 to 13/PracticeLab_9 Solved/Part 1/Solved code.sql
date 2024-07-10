create database bankschema;
use bankschema;

-- --__________________________________ Q:1
select e.name, t.transaction_id
from employee AS e
inner join transaction AS t
on e.eid=t.eid where t.transaction_amount >100000;



-- --__________________________________ Q:2
select name ,Account_number
from customer
join savingaccounts 
on customer.customer_id=savingaccounts.customer_id 
where current_balance >10000 and current_balance <50000;


-- --__________________________________ Q:3
select name ,Account_number
from  customer
inner join savingaccounts
on customer.customer_id=savingaccounts.customer_id;

-- --__________________________________ Q:4   

SELECT 
    c.name AS customer_name, 
    t.transaction_id, 
    t.transaction_amount,
    t.transaction_date
FROM transaction AS t
INNER JOIN savingaccounts AS sa
 ON t.savingAccount_number = sa.Account_number
INNER JOIN customer AS c 
ON sa.customer_id = c.customer_id
WHERE t.transaction_amount > 1500000;


    

-- --__________________________________ Q:5

SELECT 
e.name AS employee_name
FROM employee e
INNER JOIN branch b 
ON e.branch_id = b.branch_id

INNER JOIN bank br 
ON b.bank_id = br.bank_id
WHERE br.bank_name LIKE 'M%';

-- --__________________________________ Q:6

SELECT  Account_number
FROM  loanaccounts AS la
JOIN  customer AS c 
ON la.customer_id = c.customer_id
WHERE  c.name LIKE 'I%n';

-- --__________________________________ Q:7

SELECT employee.name , 
IFNULL(transaction.transaction_amount, NULL) AS transaction_amount
FROM  employee
LEFT JOIN transaction 
ON employee.eid = transaction.eid;


-- --_____________________________ Q:8 NAHI HUA


SELECT     c.name,  phoneNum
FROM customer c
JOIN transaction t ON 
c.customer_id = t.eid
WHERE YEAR(t.transaction_date) = 2003;


-- --_____________________________ Q:9

 SELECT e.name ,
    e.designation,
    b.branch_id,
    b.branch_address
FROM  employee AS e
JOIN branch AS b
 ON e.branch_id = b.branch_id;


-- --_____________________________ Q:10

SELECT 
e.name ,
SUM(t.transaction_amount) 
FROM  employee e
LEFT JOIN transaction t 
ON e.eid = t.eid
GROUP BY 
e.name;


