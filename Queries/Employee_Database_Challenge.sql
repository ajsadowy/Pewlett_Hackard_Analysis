-- Deliverable 1

-- Retirement Titles Table Query

SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC;

-- use to check the data table
select * from retirement_titles

-- Removing duplicate rows via Dictinct w/ Orderby
SELECT DISTINCT ON (rt.emp_no) rt.emp_no, rt.first_name, rt.last_name, rt.title
INTO unique_titles
FROM retirement_titles AS rt
ORDER BY emp_no ASC, to_date DESC;

-- use to check data table
select * from unique_titles

-- Query to Retrieve # of employees by recent job title and soon to retire.
SELECT COUNT(ut.emp_no),ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY title 
ORDER BY COUNT(title) DESC;

-- use to check data table
select * from retiring_titles

--Deliverable 2

-- Query to create a Mentorship Eligibility table
SELECT DISTINCT ON(e.emp_no)e.emp_no, e.first_name, e.last_name, 
e.birth_date, de.from_date, de.to_date, t.title
INTO mentorship_eligibility
FROM employees AS e
INNER JOIN dept_employees AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01');

-- use to check data table
select * from mentorship_eligibility;