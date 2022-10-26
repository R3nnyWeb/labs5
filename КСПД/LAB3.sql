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

/*ЗАДАНИЕ 2	Разработать хранимую процедуру, которая осуществляет
вставку записей в таблицу Услуги. Хранимая процедура
должна обеспечить защиту данных от дублирования согласно
следующему правилу: могут существовать несколько услуг с
одинаковыми названиями, но у них должна быть разная
длительность выполнения.*/

CREATE PROC P2 (@name varchar(30), @duration int)
AS
	IF NOT EXISTS (SELECT *
					FROM Услуги
					WHERE (Название = @name) And 
						  ([Длительность выполнения] = @duration) )
		INSERT INTO Услуги Values(@name, @duration)
	ELSE PRINT 'Данная запись существует'
GO

EXEC P2 'Подгонка', 22
EXEC P2 'Подгонка', 28
SELECT * FROM Услуги
DELETE FROM Услуги 
WHERE (Название = 'Подгонка') And ([Длительность выполнения] = 28)
GO
/*Задание 3.	Разработать хранимую процедуру, которая по заданному
названию услуги выводит код услуги, длительность
выполнения в сутках или неделях в зависимости от желания пользователя.
Например,
Услуга 1 (Укорачивание): длительность выполнения – 10 суток.
Предусмотреть вывод сообщения об ошибке при отсутствии
требуемой информации в таблицах базы данных. */

CREATE PROC P3 (@name varchar(30), @inDays bit)
AS
	IF EXISTS(SELECT *
			  FROM Услуги
			  WHERE Название = @name)
		SELECT ('Услуга '+ CAST(Код AS varchar) +
			' ('+Название+'): длительность выполнения – '
			+ CASE @inDays 
			WHEN 1 THEN CAST([Длительность выполнения]AS varchar)+'  суток'
			ELSE CAST([Длительность выполнения]/7 AS varchar)+'  недели'
			END) AS 'Информация об услугах'
		FROM Услуги
		WHERE Название = @name
	ELSE PRINT 'Информация не найдена'
GO
EXEC P3 'Подгонка', TRUE 
EXEC P3 'Подгонка', FALSE
EXEC P3 'Ремонт', TRUE

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
GO

ALTER TABLE Ателье
ADD Наценка int NULL

GO
ALTER PROC P5
AS
UPDATE Ателье
SET Наценка = 
	(SELECT Наценка
	FROM 
		(SELECT Ателье, CASE
				WHEN COUNT(Ателье) < 2 THEN 0
				WHEN COUNT(Ателье) > 5 THEN 40
				ELSE 25
			END AS Наценка
		FROM Стоимость
		GROUP BY Ателье) AS Наценки
	WHERE Ателье.Номер = Наценки.Ателье)
GO
EXEC P5

SELECT * FROM Ателье
SELECT * FROM Стоимость
GO