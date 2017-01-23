SELECT * INTO pracownicy_kopia FROM PRACOWNICY
DROP TABLE pracownicy_kopia
GO

DROP PROCEDURE Podwyzka
GO

CREATE PROCEDURE Podwyzka
	@ile real,
	@nazwa varchar(20)
AS
	SET @ile = (100+@ile)/100
	UPDATE PRACOWNICY
	SET PLACA_DOD= PLACA_DOD * @ile 
	where id_zesp = (SELECT id_zesp From ZESPOLY WHere NAZWA=@nazwa)
GO
EXEC Podwyzka @nazwa = 'systemy rozproszone', @ile = 10

-------------------------------------------------------------

DROP PROCEDURE Wstaw_Pracownika
GO
CREATE PROCEDURE Wstaw_Pracownika
	@imie varchar(11),
	@nazwisko varchar(11),
	@stanowisko varchar(11),
	@pensja real,
	@id_zesp real
AS	
	DECLARE @id_prac INT
	SET @id_prac = (SELECT MAX(ID_PRAC) FROM PRACOWNICY)+10
	
	DECLARE @data_zatr DATE
	SET @data_zatr = (GETDATE())
	
	DECLARE @id_szefa INT
	SET @id_szefa = (SELECT ID_PRAC FROM PRACOWNICY WHERE Placa_POD=(SELECT MAX(PLACA_POD) FROM PRACOWNICY WHERE ID_ZESP like @id_zesp))
	
	INSERT INTO PRACOWNICY (ID_PRAC, IMIE, NAZWISKO,ETAT,PLACA_POD,ID_ZESP,ID_SZEFA, ZATRUDNIONY) VALUES (@id_prac,@imie,@nazwisko,@stanowisko,@pensja,@id_zesp,@id_szefa,@data_zatr)

GO
EXEC Wstaw_Pracownika @imie='Yevhen', @nazwisko='Kviatkovskyi', @stanowisko='analityk',
@pensja = 2400, @id_zesp = 10

-------------------------------------------------------

DROP PROCEDURE Najlepszy
GO
CREATE PROCEDURE Najlepszy
	@id_zesp INT
AS	
	DECLARE @max Real
	EXEC Zwroc_Max_Zesp @id_zesp,@max OUTPUT
	SELECT * FROM PRACOWNICY WHERE PLACA_POD = @max
GO


DROP PROCEDURE Zwroc_Max_Zesp
GO
CREATE PROCEDURE Zwroc_Max_Zesp
	@id_zesp INT,
	@max REAL OUTPUT
AS
	SET @max=(SELECT MAX(PLACA_POD) FROM PRACOWNICY WHERE ID_ZESP=@id_zesp)
GO

EXEC Najlepszy @id_zesp = 20




