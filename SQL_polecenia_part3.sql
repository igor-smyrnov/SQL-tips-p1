--1. Wyœwietl imiona i nazwiska wszystkich pracowników.
select first_name, last_name
from employees

--2. Wyœwietl imiona i nazwiska pracowników, którzy nie maj¹ przypisanego managera lub oddzia³u.
select first_name, last_name, manager_id, department_id
from employees
where manager_id is NULL or department_id is NULL

--3. Wyœwietl imiona i nazwiska pracowników, nazwy oddzia³ów oraz nazwiska kierowników dla wszystkich pracowników w firmie.
select e.first_name, e.last_name, d.department_name, m.last_name kierownik
from employees e left outer join departments d
on e.department_id = d.department_id
left outer join employees m
on m.employee_id = e.manager_id

--4. Wyœwietl nazwy krajów oraz wszyskich oddzia³ów w tych krajach. Uwzglêdnij równie¿ kraje bez oddzia³ów.
select c.country_name, d.department_name, COUNT(d.department_name)
from countries c left outer join locations l
on c.country_id = l.country_id
left outer join departments d
on l.location_id = d.location_id
order by c.country_name

-- COUNT
-- SUM
-- AVG
-- MIN
-- MAX

select COUNT(employee_id) counter
from employees
order by counter;

-- select
-- from
-- [ where ]
-- [ group by ]
-- [ having ]
-- [ order by ]