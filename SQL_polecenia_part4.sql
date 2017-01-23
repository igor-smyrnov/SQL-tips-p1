--1. Ilu jest pracowników w ca³ej firmie?
select count(employee_id)
from employees;

--2. Jaka jest œrednia, najni¿sza i najwy¿sza p³aca w ca³ej firmie?
select avg(salary) avg, min(salary) min, max(salary) max
from employees;

--3. Ilu pracowników jest zatrudnionych w ka¿dym z dzia³ów? Uporz¹dkuj rezultaty wzglêdem nazw dzia³ów. Uwzglêdnij:
	--3A. tylko dzia³y, które maj¹ pracowników
select count(employee_id) liczba_pracownikow, d.department_name
from employees e join departments d
on e.department_id = d.department_id
group by d.department_name
order by department_name;

	--3B. wszyskie dzia³y - równie¿ bez pracowników
select count(employee_id) liczba_pracownikow, d.department_name
from employees e full join departments d
on e.department_id = d.department_id 
group by d.department_name
order by department_name;

--4. Ile jest dzia³ów w ka¿dym z krajów (uwzglêdnij A i B analogicznie do punktu 3). Uporz¹dkuj rezultaty wzglêdem nazw krajów.
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

--5. Jaka jest œrednia p³aca na ka¿dym stanowsku? Uporz¹dkuj rezultaty wzglêdem nazw stanowisk.
select avg(e.salary) srednia, j.job_title
from employees e join jobs j
on e.job_id = j.job_id
group by j.job_title
order by j.job_title

--6. Podaj œredni¹ p³acê w ka¿dym dziale w podziale na stanowska. Uporz¹dkuj rezultaty wzglêdem nazw dzia³ów.
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