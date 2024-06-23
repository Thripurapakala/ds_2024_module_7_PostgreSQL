--1.List the employee number, last name, first name, sex, and salary of each employee
select 
	e.emp_no,
	e.last_name,
	e.first_name,
	e.sex,
	s.salary
from 
	employees e 
join salaries s on e.emp_no = s.emp_no
order by e.last_name,
		 s.salary desc;
		 
--2.List the first name, last name, and hire date for the employees who were hired in 1986.

select 
		first_name,
		last_name,
		hire_date
from 	employees 
where extract(year from hire_date) = 1986
--where hire_date between '1/1/1986' and '12/31/1986'
order by hire_date;

--3.List the manager of each department along with their department number, 
--department name, employee number, last name, and first name
select 	d.dept_no as department,
		d.dept_name,
		dm.emp_no,
		e.last_name as manager_last_name,
		e.first_name as manager_first_name
from departments d 
join dept_manager dm on d.dept_no = dm.dept_no
join employees e on dm.emp_no = e.emp_no;

--4.List the department number for each employee along with that employee’s 
--employee number, last name, first name, and department name
select 	d.dept_no,
		d.dept_name,
		e.emp_no,
		e.last_name,
		e.first_name
from departments d 
join dept_emp de on d.dept_no = de.dept_no
join employees e on de.emp_no = e.emp_no
order by emp_no;

--5 List first name, last name, and sex of each employee whose first name is Hercules 
--and whose last name begins with the letter B
select first_name,
	   last_name, 
	   sex
from   employees
where  first_name ='Hercules' and 
	   last_name like 'B%'
order by 
	   last_name;

--6. List each employee in the Sales department, including their employee number, 
--last name, and first name
select  d.dept_no as sales_department,
		d.dept_name as department_name,
		e.emp_no,
		e.last_name,
		e.first_name
from departments d
join dept_emp de on d.dept_no = de.dept_no
join employees e on de.emp_no = e.emp_no
where d.dept_name = 'Sales'
order by first_name,
		 last_name desc;
		 
--7. List each employee in the Sales and Development departments, 
--including their employee number, last name, first name, and department name
select  d.dept_name as department_name,
		e.emp_no,
		e.last_name,
		e.first_name
from departments d
join dept_emp de on d.dept_no = de.dept_no
join employees e on de.emp_no = e.emp_no
where d.dept_name IN ('Sales', 'Development')
order by e.emp_no;		 
		 		 
--8 List the frequency counts, in descending order, of all the employee last names 
--(that is, how many employees share each last name)

select   last_name ,
		 count(emp_no) as num_last_names 
from     employees
group by last_name
order by num_last_names desc;


		






	



	


















