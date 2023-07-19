# SQL - Tasks

## Instructions

1. Start your favorite SQL Client and create new database "company", using the [provided script](./company_database.sql)
2. Connect to the database "company" and examine the major tables.
3. Use the "company" database for all tasks.
4. Happy querying :)


## Tasks

1. Write a SQL query that outputs all information about all departments.
1. Write a SQL query that outputs all department names.
1. Write a SQL query that outputs first and last name of each employee, along with their salary.
1. Write a SQL query that outputs the full name of each employee.
   - *Hint*: [MySQL concat](http://www.mysqltutorial.org/sql-concat-in-mysql.aspx)
   - *Hint*: [Concat with null values](http://www.mysqltutorial.org/mysql-ifnull/). Consider what fields may and my not have null values.
1. Write a SQL query to generate an email addresses for each employee. Consider that the email domain is company.com. For example, John Doe's email would be "John.Doe@company.com". The produced column should be named "Full Email Addresses".
1. Write a SQL query to find all the different employee salaries.
1. Write a SQL query that outputs all information about the employees whose job title is "Sales Representative".
1. Write a SQL query to find all employees who have a salary that is bigger than their manager's.
1. Write a SQL query to find the names of all employees whose first name starts with "SA".
1. Write a SQL query to find the names of all employees whose last name contains "ei".
1. Write a SQL query to find all employees whose salary is in the range [20000…30000].
1. Write a SQL query to find the names of all employees whose salary is 25000, 14000, 12500 or 23600.
1. Write a SQL query to find all employees that do not have manager.
1. Write a SQL query to find the names of all employees who were hired before their managers.
1. Write a SQL query to find all employees whose salary is more than 50000. Order them in decreasing order, based on their salary.
1. Write a SQL query to find the top 5 best paid employees.
   - *Hint*: [MySQL limit](http://www.mysqltutorial.org/mysql-limit.aspx)
1. Write a SQL query that outputs all employees along their address.
1. Write a SQL query to find all employees whose middle name is the same as the first letter of their town.
   - *Hint*: [MySQL left() function](https://www.w3schools.com/sql/func_mysql_left.asp)
1. Write a SQL query that outputs all employees (first and last name) that have a manager, along with their manager (first and last name).
1. Write a SQL query that outputs all employees that have a manager (first and last name), along with their manager (first and last name) and the employee's address.
1. Write a SQL query to find all departments and all town names in a single column.
1. Write a SQL query to find all employees and their manager, along with the employees that do not have manager. If they do not have a manager, output "n/a".
1. Write a SQL query to find the names of all employees from the departments "Sales" AND "Finance" whose hire year is between 1995 and 2005.