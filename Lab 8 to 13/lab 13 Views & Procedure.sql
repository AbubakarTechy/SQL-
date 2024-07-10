create database classicmodels;
use classicmodels;

-- ____________________________________Q=1
CREATE VIEW Abubakar AS
SELECT customers.customerNumber, customers.customerName
FROM customers
LEFT JOIN orders ON customers.customerNumber = orders.customerNumber
WHERE orders.orderNumber IS NULL;

SELECT * FROM Abubakar;

-- ____________________________________Q=2
CREATE VIEW l1f23bsse0371 AS
SELECT employeeNumber, firstName, lastName
FROM employees;

SELECT * FROM l1f23bsse0371;


-- ____________________________________Q=3
ALTER VIEW l1f23bsse0371 AS
SELECT employeeNumber, firstName, lastName
FROM employees
WHERE reportsTo IS NULL;

SELECT * FROM l1f23bsse0371;

-- ____________________________________Q= 4
CREATE VIEW l10371 AS
SELECT employees.employeeNumber, employees.firstName, employees.lastName, offices.city
FROM employees
JOIN offices ON employees.officeCode = offices.officeCode;

SELECT * FROM l10371;


-- ____________________________________Q= 5
DELIMITER //
CREATE PROCEDURE ShowAllEmployees()
BEGIN
    SELECT * FROM employees;
END //
DELIMITER ;

CALL ShowAllEmployees();


-- ____________________________________Q= 6
DELIMITER //
CREATE PROCEDURE ShowEmployeesByOffice(IN officeCodeInput CHAR(10))
BEGIN
    SELECT * FROM employees
    WHERE officeCode = officeCodeInput;
END //
DELIMITER ;

CALL ShowEmployeesByOffice('1'); -- Example input

-- ____________________________________Q= 7
DELIMITER //
CREATE PROCEDURE CountEmployeesOffice6()
BEGIN
    SELECT COUNT(*) AS employeeCount
    FROM employees
    WHERE officeCode = '6';
END //
DELIMITER ;

CALL CountEmployeesOffice6();

-- ____________________________________Q= 8
DELIMITER //
CREATE PROCEDURE CountEmployeesByOffice(IN officeCodeInput CHAR(10), OUT employeeCount INT)
BEGIN
    SELECT COUNT(*) INTO employeeCount
    FROM employees
    WHERE officeCode = officeCodeInput;
END //
DELIMITER ;

CALL CountEmployeesByOffice('1', @empCount); -- Example input
SELECT @empCount;

-- ____________________________________Q= 9
DROP VIEW Abubakar;

-- ____________________________________Q= 10
DROP PROCEDURE ShowAllEmployees;
