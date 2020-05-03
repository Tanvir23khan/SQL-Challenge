-- Data Analysis --


-- 1. List the following details of each employee: 
-- employee number, last name, first name, sex, and salary.
SELECT employee.employee_id, employee.last_name, employee.first_name, employee.sex, salary.salary
FROM employee
JOIN salary
ON employee.employee_id = salary.employee_id;


-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date 
FROM employee
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';
--WHERE EXTRACT(YEAR FROM hire_date) = 1986


-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.
SELECT department.department_id, department.department_name, department_manager.employee_id, 
employee.last_name, employee.first_name
FROM department
JOIN department_manager
ON department.department_id = department_manager.department_id
JOIN employee
ON department_manager.employee_id = employee.employee_id;


-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
SELECT department_employee.employee_id, employee.last_name, employee.first_name, department.department_name
FROM department_employee
JOIN employee
ON department_employee.employee_id = employee.employee_id 
JOIN department
ON department_employee.department_id = department.department_id;

------ OR
-- SELECT employee.employee_id, employee.last_name, employee.first_name, department.department_name
-- FROM employee
-- JOIN department_employee
-- ON employee.employee_id = department_employee.employee_id 
-- JOIN department
-- ON department_employee.department_id = department.department_id;


-- 5. List first name, last name, and sex for employees whose first name is "Hercules" 
-- and last names begin with "B."
SELECT first_name, last_name, sex
FROM employee
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';


-- 6. List all employees in the Sales department, including their 
-- employee number, last name, first name, and department name.
SELECT department_employee.employee_id, employee.last_name, employee.first_name, department.department_name
FROM department_employee
JOIN employee
ON department_employee.employee_id = employee.employee_id
JOIN department
ON department_employee.department_id = department.department_id
WHERE department.department_name = 'Sales';

------OR
-- SELECT employee.employee_id, employee.last_name, employee.first_name, department.department_name
-- FROM employee
-- JOIN department_employee
-- ON employee.employee_id = department_employee.employee_id
-- JOIN department
-- ON department_employee.department_id = department.department_id
-- WHERE department.department_name = 'Sales';


-- 7. List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
SELECT department_employee.employee_id, employee.last_name, employee.first_name, department.department_name
FROM department_employee
JOIN employee
ON department_employee.employee_id = employee.employee_id
JOIN department
ON department_employee.department_id = department.department_id
WHERE department.department_name IN ('Sales', 'Development');
---- instead of "IN", we can use "OR"
---- WHERE department.department_name = 'Sales' OR department.department_name = 'Development';


-- 8. In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.
SELECT last_name,
COUNT(last_name) AS "count_last_name"
FROM employee
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;

