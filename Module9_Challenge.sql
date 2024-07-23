DROP table departments
DROP table dept_emp
DROP table employees
DROP table titles
Drop table dept_manager
DRop table salaries
	
CREATE TABLE Departments (
  Dept_no VARCHAR(30) NOT NULL,
  Dept_name VARCHAR(30) NOT NULL,
  Primary Key (Dept_no)
);

Select * From Departments

CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no VARCHAR(30) NOT NULL,
	PRIMARY KEY (Emp_no, Dept_no),
    FOREIGN KEY (Emp_no) REFERENCES Employees(Emp_no),
    FOREIGN KEY (Dept_no) REFERENCES Departments(Dept_no)	
);
Select * From dept_emp

CREATE TABLE dept_manager (
  dept_no VARCHAR(30) NOT NULL,
  Emp_no INT,
  PRIMARY KEY (Emp_no, Dept_no),
FOREIGN KEY (Dept_no) REFERENCES Departments(dept_no),			
FOREIGN KEY (Emp_no) REFERENCES Employees(Emp_no)
);
Select * From dept_manager

CREATE TABLE Employees (
    Emp_no INT NOT NULL,
	Emp_title_id varchar(30) not null,
	Birth_date varchar(30) not null,
	First_name varchar(30) not null,
	Last_name varchar(30) not null,
	Sex varchar(30) not null,
	Hire_date varchar(30) not null,
	Primary Key (Emp_no)
);

--ALTER TABLE Employees
--	ADD FOREIGN KEY (Emp_title_id) REFERENCES Titles(Title_id);--

Select * FRom Employees	

CREATE TABLE Salaries (
  Emp_no INT,
  Salary INT,	
	Primary Key (Emp_No),
	Foreign key (Emp_No) references Employees (Emp_no)
);
Select * From Salaries

CREATE TABLE titles (
  Title_id varchar(30)not null,
  Title varchar(30) not null,	
  Primary Key (Title_id)
);
Select * From Titles

--List the employee number, last name, first name, sex, and salary of each employee
SELECT 
    e.Emp_no as "Employee Number", 
    e.Last_name as "Last name", 
    e.First_name as "First Name", 
    e.Sex, 
    s.Salary as "Salary of Each Employee"
FROM 
    Employees e
JOIN 
    Salaries s ON e.Emp_no = s.Emp_no;


--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT 
    First_name, 
    Last_name, 
    Hire_date
FROM 
    Employees
WHERE 
    Hire_date LIKE '%1986';

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT 
    d.Dept_no as "Department No",
    d.Dept_name as "Department Name",
    dm.Emp_no as "Employee No",
    e.Last_name,
    e.First_name
FROM 
    Departments d
JOIN 
    Dept_manager dm ON d.Dept_no = dm.Dept_no
JOIN 
    Employees e ON dm.Emp_no = e.Emp_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT 
    d.Dept_no as "Department No",
    e.Emp_no as "Employee No",
    e.Last_name,
    e.First_name,
    d.Dept_name as "Department Name"
FROM 
    Employees e
JOIN 
    Dept_Emp de ON e.Emp_no = de.Emp_no
JOIN 
    Departments d ON de.Dept_no = d.Dept_no;

--List the first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT 
    First_name, 
    Last_name, 
    Sex
FROM 
    Employees
WHERE 
    First_name = 'Hercules'
    AND Last_name LIKE 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT 
    e.Emp_no as "Employee No",
    e.Last_name,
    e.First_name
FROM 
    Employees e
JOIN 
    Dept_Emp de ON e.Emp_no = de.Emp_no
JOIN 
    Departments d ON de.Dept_no = d.Dept_no
WHERE 
    d.Dept_name = 'Sales';
--Testing 
--SELECT 
    e.Emp_no AS "Employee No",
    e.Last_name,
    e.First_name
--FROM 
    Employees e
--JOIN 
    Dept_Emp de ON e.Emp_no = de.Emp_no
--WHERE 
    de.Dept_no = D007;



--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT 
    e.Emp_no,
    e.Last_name,
    e.First_name,
    d.Dept_name
FROM 
    Employees e
JOIN 
    Dept_Emp de ON e.Emp_no = de.Emp_no
JOIN 
    Departments d ON de.Dept_no = d.Dept_no
WHERE 
    d.Dept_name IN ('Sales', 'Development');

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT 
    Last_name, 
    COUNT(*) AS Frequency
FROM 
    Employees
GROUP BY 
    Last_name
ORDER BY 
    Frequency DESC;








