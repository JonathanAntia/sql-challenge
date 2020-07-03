-- 1) List the following details of each employee:
-- employee number, last name, first name, sex, and salary

SELECT e.emp_no AS "Employee Number", e.last_name AS "Last Name", e.first_name AS "First Name",
	e.sex AS "Sex", s.salary AS "Salary"
FROM employees AS e
	JOIN salaries AS s
	ON s.emp_no = e.emp_no;

-- 2) List first name, last name, and hire date for employees who were hired in 1986

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date>='1986-01-01' AND hire_date<='1986-12-31';

-- 3) List the manager of each department with the following information:
-- department number, department name, the manager's employee number, last name, first name

SELECT d.dept_no AS "Department No", d.dept_name AS "Department Name", dm.emp_no AS "Employee No",
	e.last_name AS "Last Name", e.first_name AS "First Name"
FROM dept_manager AS dm
	LEFT JOIN departments AS d
	ON d.dept_no = dm.dept_no
		LEFT JOIN employees AS e
		ON e.emp_no = dm.emp_no;

-- 4) List the department of each employee with the following information:
-- employee number, last name, first name, and department name.

CREATE VIEW department_view AS
SELECT e.emp_no AS "Employee No", e.last_name AS "Last Name", e.first_name AS "First Name",
	d.dept_name AS "Department"
FROM employees AS e
	LEFT JOIN dept_emp AS de
	ON de.emp_no = e.emp_no
		LEFT JOIN departments AS d
		ON d.dept_no = de.dept_no
		ORDER BY e.emp_no;

-- 5) List first name, last name, and sex for employees whose first name is "Hercules" and last name begins with "B"

SELECT first_name, last_name, sex
FROM employees
WHERE first_name='Hercules' AND last_name LIKE 'B%';

-- 6) List all employees in the Sales department, including their employee number, last name, first name,
-- and department name

SELECT "Employee No", "Last Name", "First Name", "Department"
FROM department_view
WHERE "Department"='Sales';

-- 7) List all employees in the Sales and Development department, including their employee number, last name, first name,
-- and department name

SELECT "Employee No", "Last Name", "First Name", "Department"
FROM department_view
WHERE "Department"='Sales' OR "Department"='Development';

-- 8) In descending order, list the frequency count of employees last names,
-- i.e. how many employees share each last name

SELECT last_name, count(last_name) AS "Last Name Count"
FROM employees
GROUP BY last_name
ORDER BY "Last Name Count" DESC;