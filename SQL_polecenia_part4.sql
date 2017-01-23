--1. Ilu jest pracownik�w w ca�ej firmie?
select count(employee_id)
from employees;

--2. Jaka jest �rednia, najni�sza i najwy�sza p�aca w ca�ej firmie?
select avg(salary) avg, min(salary) min, max(salary) max
from employees;

--3. Ilu pracownik�w jest zatrudnionych w ka�dym z dzia��w? Uporz�dkuj rezultaty wzgl�dem nazw dzia��w. Uwzgl�dnij:
	--3A. tylko dzia�y, kt�re maj� pracownik�w
select count(employee_id) liczba_pracownikow, d.department_name
from employees e join departments d
on e.department_id = d.department_id
group by d.department_name
order by department_name;

	--3B. wszyskie dzia�y - r�wnie� bez pracownik�w
select count(employee_id) liczba_pracownikow, d.department_name
from employees e full join departments d
on e.department_id = d.department_id 
group by d.department_name
order by department_name;

--4. Ile jest dzia��w w ka�dym z kraj�w (uwzgl�dnij A i B analogicznie do punktu 3). Uporz�dkuj rezultaty wzgl�dem nazw kraj�w.
--a
select count(d.department_id) liczba_dzialow, c.country_name
from departments d join locations l
on d.location_id = l.location_id
join countries c 
on l.country_id = c.country_id
group by c.country_name
order by c.country_name

--b
select count(d.department_id) liczba_dzialow, c.country_name
from departments d full join locations l
on d.location_id = l.location_id
join countries c 
on l.country_id = c.country_id
group by c.country_name
order by c.country_name

--5. Jaka jest �rednia p�aca na ka�dym stanowsku? Uporz�dkuj rezultaty wzgl�dem nazw stanowisk.
select avg(e.salary) srednia, j.job_title
from employees e join jobs j
on e.job_id = j.job_id
group by j.job_title
order by j.job_title

--6. Podaj �redni� p�ac� w ka�dym dziale w podziale na stanowska. Uporz�dkuj rezultaty wzgl�dem nazw dzia��w.
select avg(e.salary) srednia, d.department_name, j.job_title
from departments d join employees e
on d.department_id = e.department_id
join jobs j
on e.job_id = j.job_id
group by j.job_title, d.department_name
order by d.department_name

select department_id sos_pomidorowy, AVG(salary) srednia
from employees
where department_id >= 50
group by department_id
having AVG(salary) > 5000