select nazwisko, LEN(nazwisko) as dlugosc from PRACOWNICY --1
select SUBSTRING(etat, 1, 2)+'_'+cast(ID_PRAC as varchar) from PRACOWNICY --2
select nazwisko from PRACOWNICY where SUBSTRING(nazwisko, 1,len(nazwisko)/2) like '%L%' --3
select nazwisko, round(PLACA_POD*1.15, 0) as placa from PRACOWNICY --4
select nazwisko, DATEDIFF(YY,zatrudniony,'2014-01-01') as staz from PRACOWNICY --5
select nazwisko, ZATRUDNIONY from PRACOWNICY where ID_ZESP=20 --6
select GETDATE() --7
select DATEName(DW,GETDATE()) --8
select *, case when Adres= 'Piotrkowska 3' then 'Srodmiescie' else 'Widzew' end dzielnica from ZESPOLY --9
select nazwisko, case when Placa_pod<3100 then 'mniejsza' when Placa_pod=3100 then 'rowna' else 'wieksza' end from Pracownicy --10
select * from PRACOWNICY