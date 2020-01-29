--List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT Employee.emp_no, Employee.last_name, Employee.fist_name, Employee.gender, Salary.salary
FROM Employees AS Employee
INNER JOIN Salaries AS Salary
ON Salary.emp_no = Employee.emp_no;

--List employees who were hired in 1986.
SELECT emp_no, last_name, fist_name, hire_date
FROM Employees 
WHERE hire_date LIKE '1986%';


--List the manager of each department with the following information: 
--department number, department name, the manager’s employee number, last name, first name, and start and end employment dates.
SELECT DepartmentManager.dept_no, Departments.dept_name, Employees.emp_no, Employees.last_name, Employees.fist_name, DepartmentManager.from_date, DepartmentManager.to_date
FROM DepartmentManager
INNER JOIN Employees
ON Employees.emp_no = DepartmentManager.emp_no
INNER JOIN Departments
ON Departments.dept_no = DepartmentManager.dept_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT DepartmentEmployees.emp_no, Employees.last_name, Employees.fist_name, Departments.dept_name
FROM DepartmentEmployees
INNER JOIN Employees
ON Employees.emp_no = DepartmentEmployees.emp_no
INNER JOIN Departments
ON Departments.dept_no = DepartmentEmployees.dept_no;

--List all employees whose first name is “Hercules” and last names begin with “B.”
SELECT Employees.emp_no, Employees.fist_name, Employees.last_name, Employees.hire_date
FROM Employees
WHERE fist_name = 'Hercules' AND last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT Employees.emp_no, Employees.last_name, Employees.fist_name 
FROM Employees
WHERE emp_no IN 
	(
	SELECT emp_no
	FROM DepartmentEmployees
	WHERE dept_no = (
	SELECT dept_no
	FROM Departments
	WHERE dept_name = 'Sales'
		)
		
	);

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT Employees.emp_no, Employees.last_name, Employees.fist_name, Departments.dept_name
FROM Employees
INNER JOIN DepartmentEmployees
ON DepartmentEmployees.emp_no = Employees.emp_no
INNER JOIN Departments
ON Departments.dept_no = DepartmentEmployees.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT (last_name) AS "Total Last Names"
FROM Employees
GROUP BY last_name
ORDER BY "Total Last Names" DESC;