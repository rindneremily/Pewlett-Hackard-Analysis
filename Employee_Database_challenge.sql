-- step 1 
SELECT emp_no, first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

DROP TABLE titles_data CASCADE;
--step 2 
SELECT title, from_date, to_date
INTO titles_data
FROM titles
WHERE (from_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (to_date BETWEEN '1952-01-01' AND '1955-12-31');
SELECT * FROM titles_data;
--step 3 new table
SELECT employees.emp_no,
	employees.first_name,
	employees.last_name,
	titles.title,
	titles.from_date,
	titles.to_date
FROM employees
INNER JOIN titles
ON employees.emp_no = titles.emp_no;

-- step 4 join with primary key mod7.3.3
SELECT 
FROM w as v			--variable
INNER JOIN x as y		--variable
ON x.w = ;

--step 5 mod7.3.4
SELECT COUNT , 
FROM  as 
LEFT JOIN  as 
ON  = 
GROUP BY 
ORDER BY ;

--step 6 export as retirement_titles.csv
