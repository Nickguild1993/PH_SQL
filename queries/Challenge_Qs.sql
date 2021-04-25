
-- Challenge Queries 

-- Retirment_titles
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
-- INTO retiring_titles
FROM employees AS e
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no
;


-- Unique titles 
SELECT DISTINCT ON (e.emp_no) 
	e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO unique_titles
FROM employees AS e
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no, t.title DESC
;
-- **** t.title DESC **** is the key here- it picks the last instance of that e.emp_no being mentioned,
-- which means in this case, it picks their most current title (since that is below their older title
-- in terms on the row hierarchy)

SELECT COUNT(emp_no) FROM unique_titles;

SELECT COUNT(title), title
INTO retirement_title_count
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC
;
-- retiring titles (unique) w/o doing a join 
SELECT DISTINCT ON (emp_no) 
	emp_no,
	first_name,
	last_name,
	title
INTO unique_retiring_titles
FROM retiring_titles
ORDER BY emp_no, to_date DESC;