-- 1. Write a SQL query that outputs all information about all departments.
SELECT *
FROM company.departments;

-- 2. Write a SQL query that outputs all department names.
SELECT d.name
from departments d;
-- 3. Write a SQL query that outputs first and last name of each employee, along with their salary.
SELECT e.first_name, e.last_name, e.salary
from employees e;
-- 4. Write a SQL query that outputs the full name of each employee.
select concat(ifnull(first_name, ''), if(middle_name is not null, concat(' ', middle_name), ''), ' ', ifnull(last_name, '')) as full_name
from employees;
-- 5. Write a SQL query to generate an email addresses for each employee. Consider that the email domain is company.com. For example, John Doe's email would be "John.Doe@company.com". The produced column should be named "Full Email Addresses".
SELECT REPLACE(REPLACE(concat(first_name, '.', last_name, '@company.com'), ' ', ''),' \''', '') as 'Full Email Addresses'
From employees;

-- 6. Write a SQL query to find all the different employee salaries.
SELECT DISTINCT salary
FROM employees;

-- 7. Write a SQL query that outputs all information about the employees whose job title is "Sales Representative".
SELECT *
FROM employees
WHERE job_title = 'Sales Representative';

-- 8. Write an SQL query to find all employees who have a salary that is bigger than their manager's.
SELECT *
FROM employees e,
join employees m
on e.manager_id = m.employee_id
where e.salary > m.salary;

SELECT *
from employees e, employees m
where  e.manager_id = m.employee_id
and e. salary > m.salary;

-- 9. Write a SQL query to find the names of all employees whose first name starts with "SA".
SELECT e.first_name
FROM employees e
Where e.first_name LIKE 'SA%';

-- 10. Write a SQL query to find the names of all employees whose last name contains "ei".
SELECT e.last_name
FROM employees e
WHERE e.last_name LIKE '%ei%';

-- 11. Write a SQL query to find all employees whose salary is in the range [20000…30000].
SELECT *
FROM employees
WHERE salary BETWEEN 20000 AND 30000;

-- 12. Write a SQL query to find the names of all employees whose salary is 25000, 14000, 12500 or 23600.
SELECT concat(e.first_name, ' ', e.last_name) 'names'
FROM employees e
WHERE e.salary = 25000
   OR e.salary = 14000
   OR e.salary = 12500
   OR e.salary = 23600;

-- 13. Write a SQL query to find all employees that do not have manager.
SELECT concat(e.first_name, ' ', e.last_name) 'names'
FROM employees e
WHERE manager_id IS NULL;

-- 14. Write a SQL query to find the names of all employees who were hired before their managers.
SELECT concat(e.first_name, ' ', e.last_name) 'names'
FROM employees e,
     employees m
WHERE e.manager_id = m.employee_id
  AND e.hire_date < m.hire_date;

SELECT e.first_name, e.last_name, e.hire_date as 'Employee hire date', m.hire_date as 'Manager hire date'
from employees e
left join employees m on e.e.manager_id = m.employee_id
where e.hire_date< m.hire_date;

-- 15. Write a SQL query to find all employees whose salary is more than 50000. Order them in decreasing order, based on their salary.
SELECT *
FROM employees
WHERE salary > 50000
ORDER BY first_name DESC;

-- 16. Write a SQL query to find the top 5 best paid employees.
SELECT concat(first_name, ' ', last_name, ' ', salary)
FROM employees
ORDER BY salary DESC LIMIT 5;

-- 17. Write a SQL query that outputs all employees along their address.
SELECT e.middle_name, t.name
FROM employees e,
     towns t
         JOIN addresses a on t.town_id = a.town_id
WHERE LEFT (e.middle_name, 1) = LEFT (t.name, 1);


-- 18. Write a SQL query to find all employees whose middle name is the same as the first letter of their town.
SELECT e.employee_id,
       CONCAT(e.first_name, ' ', e.last_name) AS Employee,
       m.employee_id                          AS ManagerID,
       CONCAT(m.first_name, ' ', m.last_name) AS Manager
FROM Employees e
         JOIN Employees m
              ON e.manager_id = m.employee_id;


-- 19. Write a SQL query that outputs all employees (first and last name) that have a manager, along with their manager (first and last name).

SELECT CONCAT(e.first_name, ' ', e.last_name, ' [Address: ', a.text, ']') AS Employee,
       CONCAT(m.first_name, ' ', m.last_name)                             AS Manager
FROM Employees e
         JOIN Employees m
              ON e.manager_id = m.employee_id
         JOIN Addresses a
              ON e.address_id = a.address_id;


-- 20. Write a SQL query that outputs all employees that have a manager (first and last name), along with their manager (first and last name) and the employee's address.
SELECT e.employee_id,
       CONCAT(e.first_name, ' ', e.last_name) AS Employee,
       m.employee_id                          AS ManagerID,
       CONCAT(m.first_name, ' ', m.last_name) AS Manager
FROM Employees e
         JOIN Employees m
              ON e.manager_id = m.employee_id;

select e.first_name as employee_first_name, e.last_name as employee_last_name,
       m.first_name as manager_first_name, m.last_name as manager_last_name,
       a.text as address
from employees e
         join employees m on e.manager_id = m.employee_id
         join addresses a on e.address_id = a.address_id
order by e.employee_id;

-- 21. Write a SQL query to find all departments and all town names in a single column.
SELECT d.Name
FROM Departments d
UNION
SELECT t.Name
FROM Towns t;


-- 22. Write a SQL query to find all employees and their manager, along with the employees that do not have manager. If they do not have a manager, output "n/a".
SELECT e.employee_id,
       CONCAT(e.first_name, ' ', e.last_name) as Employee,
       m.employee_id                          AS ManagerID,
       CASE
           WHEN e.manager_id IS NULL THEN 'n/a'
           ELSE CONCAT(m.first_name, ' ', m.last_name)
           END                                as Manager
FROM Employees m
         RIGHT JOIN Employees e
                    ON e.manager_id = m.employee_id;


-- 23. Write a SQL query to find the names of all employees from the departments "Sales" AND "Finance" whose hire year is between 1995 and 2005.
SELECT e.department_id, e.first_name, e.job_title, d.name
FROM employees e,
     departments d
WHERE e.department_id = d.department_id
    AND d.Name IN ('Sales', 'Finance')
    AND YEAR (
    e.hire_date) BETWEEN 1995
  AND 2005;

select e.first_name, e.last_name
from employees e
join departments d on e.department_id = d.department_id
where d.name in ('Sales', 'Finance')
and year(e.hire_date) BETWEEN 1995
  AND 2005;
