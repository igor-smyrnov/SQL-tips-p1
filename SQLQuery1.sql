select distinct ETATY.NAZWA  
from ETATY, PRACOWNICY 
where PRACOWNICY.ETAT = ETATY.NAZWA --7

select * 
from PRACOWNICY 
where ETAT='ANALITYK' --8

select Nazwisko, Etat, Placa_pod, id_zesp 
from pracownicy 
where id_zesp in(30,40) order by placa_pod --9

select Nazwisko, ID_zesp, Placa_dod 
from PRACOWNICY 
where PLACA_POD>2000 and PLACA_DOD <3000 --10

select * 
from PRACOWNICY 
where PLACA_POD<>2400 --11

select * 
from PRACOWNICY 
where ETAT not in('Kierownik','Dyrektor') and PLACA_POD>2500 --12

select Nazwisko, ETAT, ID_zesp 
from PRACOWNICY 
where NAZWISKO like '%SKI' --13

select id_prac, id_szefa, nazwisko, placa_pod 
from PRACOWNICY
where PLACA_POD>3000 and ID_SZEFA is not NULL --14

select * 
from PRACOWNICY

select nazwisko, id_zesp 
from PRACOWNICY 
where ID_ZESP=20 and (NAZWISKO like 'S%' or nazwisko like '%ek') --15

select nazwisko, ETAT 
from PRACOWNICY 
where NAZWISKO like '[k-n]%' --16

select nazwisko, ETAT 
from PRACOWNICY 
where NAZWISKO like '[^k-n]%' --17

select nazwisko, ETAT, PLACA_POD, PLACA_DOD 
from PRACOWNICY 
where (PLACA_DOD+PLACA_POD)>3500 order by ETAT,nazwisko; --19

select nazwisko +' '+ CAST(zatrudniony as varchar) 
from PRACOWNICY --20