-- 2.  Dla bazy danych AdventureWorks (tabela Sales.SalesOrderHeader) napisz następujące zapytania:
--
--    a)  Znajdź klienta (CustomerID), który złożył najwięcej zamówień
--
Select Top 1 with Ties CustomerID, Count(SalesOrderID) as "ilosc zamowien"
from Sales.SalesOrderHeader
Group by CustomerID
order by "ilosc zamowien" DESC
---b) Policz łączną wartość wszystkich zamówień 
Select Sum(SubTotal) as "łączną wartość wszystkich zamówień  "
from Sales.SalesOrderHeader
---c) Znajdź zamówienia złożone po 2005-07-01
Select SalesOrderId
from Sales.SalesOrderHeader
where OrderDate>=2005-07-01
----d) Znajdź terytorium (TerritoryID), które ma najmniej złożonych zamówień 
Select Top 1 TerritoryID, Count(SalesOrderID) as "najmniej złożonych zamówień"
from Sales.SalesOrderHeader
Group by TerritoryID
order by "najmniej złożonych zamówień" 
---e) Znajdź zamówienie, które ma najwięcej niezależnych składników (uwzgl. Tabelę SalesOrderDetail) 
Select Top 1 With Ties Count(SalesOrderID) as "ilosc zamowien"
from Sales.SalesOrderDetail
group by SalesOrderID
order by "ilosc zamowien" desc
