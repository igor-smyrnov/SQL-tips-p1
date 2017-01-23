--1. Wy�wietl imiona i nazwiska wszystkich pracownik�w.
select first_name, last_name
from employees

--2. Wy�wietl imiona i nazwiska pracownik�w, kt�rzy nie maj� przypisanego managera lub oddzia�u.
select first_name, last_name, manager_id, department_id
from employees
where manager_id is NULL or department_id is NULL

--3. Wy�wietl imiona i nazwiska pracownik�w, nazwy oddzia��w oraz nazwiska kierownik�w dla wszystkich pracownik�w w firmie.
select e.first_name, e.last_name, d.department_name, m.last_name kierownik
from employees e left outer join departments d
on e.department_id = d.department_id
left outer join employees m
on m.employee_id = e.manager_id

--4. Wy�wietl nazwy kraj�w oraz wszyskich oddzia��w w tych krajach. Uwzgl�dnij r�wnie� kraje bez oddzia��w.
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