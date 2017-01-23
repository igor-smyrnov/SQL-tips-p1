-- 2.  Dla bazy danych AdventureWorks (tabela Sales.SalesOrderHeader) napisz następujące zapytania:
--
--    a)  Znajdź klienta (CustomerID), który złożył najwięcej zamówień
--

--with Ties CustomerID,

select top 1 CustomerID, Count(SalesOrderID) as "ilosc zamowien"
from SalesLT.SalesOrderHeader
Group by CustomerID
order by "ilosc zamowien" desc

---b) Policz łączną wartość wszystkich zamówień 

Select Sum(SubTotal) as "łączną wartość wszystkich zamówień  "
from SalesLT.SalesOrderHeader

---c) Znajdź zamówienia złożone po 2005-07-01

Select SalesOrderId, OrderDate
from SalesLT.SalesOrderHeader
where OrderDate>=2005-07-01

----d) Znajdź terytorium (TerritoryID), które ma najmniej złożonych zamówień 

Select Top 1 TerritoryID, Count(SalesOrderID) as "najmniej złożonych zamówień"
from SalesLT.SalesOrderHeader
order by "najmniej złożonych zamówień" 

---e) Znajdź zamówienie, które ma najwięcej niezależnych składników (uwzgl. Tabelę SalesOrderDetail) 

Select Top 1 Count(SalesOrderID) as "ilosc zamowien"
from SalesLT.SalesOrderDetail
group by SalesOrderID

