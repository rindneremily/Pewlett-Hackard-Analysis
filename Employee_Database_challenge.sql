-- Creating tables for PH-EmployeeDB
DROP TABLE employees CASCADE;
CREATE TABLE departments (
     dept_no VARCHAR(4) NOT NULL,
     dept_name VARCHAR(40) NOT NULL,
     PRIMARY KEY (dept_no),
     UNIQUE (dept_name)
);
CREATE TABLE employees (
     emp_no INT NOT NULL,
     birth_date DATE NOT NULL,
     first_name VARCHAR NOT NULL,
     last_name VARCHAR NOT NULL,
     gender VARCHAR NOT NULL,
     hire_date DATE NOT NULL,
     PRIMARY KEY (emp_no)
);
DROP TABLE dept_manager CASCADE;

CREATE TABLE dept_manager (
dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);
CREATE TABLE salaries (
  emp_no INT NOT NULL,
  salary INT NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  PRIMARY KEY (emp_no)
);
DROP TABLE departments CASCADE;

SELECT * FROM departments;
CREATE TABLE dept_emp (
  dept_no VARCHAR NOT NULL,
  emp_no INT NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  PRIMARY KEY (dept_no, emp_no)
);
DROP TABLE titles CASCADE;
CREATE TABLE titles (
  emp_no INT NOT NULL,
  title VARCHAR NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
 -- FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  PRIMARY KEY (emp_no, title, from_date)
);

-- step 1 
SELECT emp_no, first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';
SELECT * FROM employees;
DROP TABLE titles_data CASCADE;
--step 2 
SELECT title, from_date, to_date
INTO titles_data
FROM titles
WHERE (from_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (to_date BETWEEN '1952-01-01' AND '1955-12-31');
SELECT * FROM titles;
--step 3 new table
SELECT employees.emp_no,
	employees.first_name,
	employees.last_name,
	titles.title,
	titles.from_date,
	titles.to_date
FROM employees
INNER JOIN titles
ON (employees.emp_no = titles.emp_no);

--step 5 mod7.3.4
-- Employee count by department number
--WANT count by
SELECT COUNT(de.emp_no), de.from_date
FROM titles_data as ti
LEFT JOIN dept_emp as de
ON de.emp_no = de.emp_no
GROUP BY de.from_date
ORDER BY de.from_date;
SELECT * FROM titles_data
ORDER BY to_date DESC;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON ti.emp_no,
ti.first_name,
ti.last_name,
ti.titles

INTO retire_data
FROM titles_data
ORDER BY from_date, to_date DESC;

SELECT title
INTO unique_titles
FROM titles
WHERE (to_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (from_date BETWEEN '1952-01-01' AND '1955-12-31');

-- Employee count by department number
SELECT COUNT(es.emp_no), ut.title
FROM employees as es
LEFT JOIN titles as ut
ON es.emp_no = ut.emp_no
GROUP BY ut.emp_no;


--D2
--step 1
SELECT emp_no, first_name, last_name, birth_date
INTO mentor_elig
FROM employees
WHERE birth_date BETWEEN '1965-01-01' AND '1965-12-31';
SELECT * FROM employees;
