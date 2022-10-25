use Ателье
/*ЗАДАНИЕ 1.1*/
/*Разработать хранимую процедуру, которая по заданному
номеру ателье возвращает название ателье.*/
CREATE PROC P1 (@nubmer int = 1, @name nvarchar(30) OUTPUT)
AS
	SELECT @name = Название
		FROM Ателье
		WHERE Номер = @nubmer
GO
DECLARE @name nvarchar(30)
EXEC P1 1, @name OUTPUT
PRINT @name
GO

/*ЗАДАНИЕ 1.4*/
/*Разработать хранимую процедуру, которая изменяет стоимость
заданной пользователем услуги согласно скидкам, указанным
в следующей таблице:
Длительность выполнения      Скидка на услугу
(сутки)				
    >30								50%
	10..30							20%
	<10								10%*/
CREATE PROC P4 (@serviceName nvarchar(30) = 'Укорачивание')
AS
DECLARE @serviceNubmer int
DECLARE @discount float
DECLARE @duration float
SELECT @serviceNubmer = Код
	FROM Услуги
	WHERE Название = @serviceName

SELECT @duration = [Длительность выполнения] 
	FROM Услуги
	WHERE Код = @serviceNubmer

SELECT @discount = CASE
	WHEN @duration > 30 THEN (1-0.5)
	WHEN @duration BETWEEN 10 AND 30 THEN (1-0.2)
	WHEN @duration < 10 THEN (1-0.1)
END
UPDATE Стоимость
SET Стоимость = Стоимость * @discount
WHERE Услуга = @serviceNubmer
GO

EXEC P4

