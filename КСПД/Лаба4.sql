use Ателье
/*Разработать AFTER-триггер, который позволяет удалять
информацию обо всех ателье из таблицы Ателье, кроме ателье
с номером 1. Считать, что пользователю предоставляется
возможность удаления множества записей в таблице.*/
CREATE TRIGGER T1 ON dbo.Ателье
AFTER DELETE
AS
IF EXISTS (
	SELECT * 
	FROM deleted
	WHERE Номер = 1)
BEGIN
	ROLLBACK TRAN
	PRINT 'Ошибка. Нельзя удалить ателье с номером 1'
END
ELSE PRINT 'Успех'
GO


DELETE
FROM Ателье
WHERE Номер = 1
GO



/*Разработать INSTEAD OF-триггер для рассматриваемого в п.1.1 задания. Сравнить результаты работы INSTEAD OF и AFTER-триггеров. */
CREATE TRIGGER T2 ON Ателье
INSTEAD OF DELETE
AS
	DELETE
	FROM Стоимость
	WHERE (Стоимость.Ателье IN (SELECT Номер
								FROM deleted))
	and (Стоимость.Ателье <> 1)
	
	DELETE
	FROM Ателье
	WHERE (Ателье.Номер IN (SELECT Номер
							FROM deleted))
	and (Ателье.Номер <> 1)
GO

SELECT *
FROM Ателье
GO
SELECT *
FROM Стоимость
GO

/*Разработать триггер, который позволяет изменять
длительность выполнения услуги только на меньшее значение.
Считать, что пользователю предоставляется возможность
модификации множества записей в таблице.


ELSE */
ALTER TRIGGER T3 ON Услуги
INSTEAD OF UPDATE
AS
IF COLUMNS_UPDATED() & 4 > 0
BEGIN
	UPDATE Услуги
	SET Услуги.[Длительность выполнения] = inserted.[Длительность выполнения]
	FROM Услуги, inserted
	WHERE (inserted.[Длительность выполнения] < Услуги.[Длительность выполнения])
	AND (inserted.Код = Услуги.Код)	
END
UPDATE Услуги
SET	Услуги.Название = inserted.Название
FROM Услуги, inserted
WHERE inserted.Код = Услуги.Код
GO

UPDATE Услуги
SET	[Длительность выполнения] = [Длительность выполнения] + 10



DROP TABLE Стоимость
DROP TABLE Услуги
DROP TABLE Ателье

SELECT * 
FROM Услуги
GO

	
--2. Создание триггеров для представлений.
--2.1. Создать представление с информацией о стоимости услуг. 
--Представление должно включать столбцы Номер ателье, 
--Название ателье, Код услуги, Название услуги, Стоимость услуги.
CREATE VIEW ServicePrice
AS
SELECT Ателье.Номер AS [Номер ателье], Ателье.Название As [Название ателье], 
		Услуги.Код AS [Код услуги], Услуги.Название As [Название услуги], 
		Стоимость.Стоимость  AS [Стоимость услуги]
FROM Стоимость Join Ателье On Стоимость.Ателье = Ателье.Номер
			   Join Услуги On Стоимость.Услуга = Услуги.Код
GO

INSERT ServicePrice
VALUES(1,  'Золотое руно', 10, 'Штопка', 999)
GO

SELECT * FROM ServicePrice
SELECT * FROM Стоимость
GO

DELETE FROM Стоимость WHERE Стоимость = 999
GO
--2.2. Разработать триггер, который позволяет вносить информацию 
--о стоимости услуг через представление. Считать, что 
--пользователю предоставляется возможность вставки только 
--одной записи через представление. Предусмотреть вывод 
--сообщения об ошибке в случае ввода информации о 
--несуществующем ателье или о несуществующей услуге

CREATE TRIGGER T4 ON ServicePrice
INSTEAD OF INSERT
AS
IF EXISTS (SELECT * 
			FROM inserted, ServicePrice
			WHERE (ServicePrice.[Номер ателье] = inserted.[Номер ателье]) AND 
				  (ServicePrice.[Название ателье] = inserted.[Название ателье]))
	IF EXISTS (SELECT * 
				FROM inserted, ServicePrice
				WHERE (ServicePrice.[Код услуги] = inserted.[Код услуги]) AND 
					  (ServicePrice.[Название услуги] = inserted.[Название услуги]))
		IF NOT EXISTS (SELECT * 
						FROM inserted, ServicePrice
						WHERE (ServicePrice.[Номер ателье] = inserted.[Номер ателье]) AND 
							  (ServicePrice.[Название ателье] = inserted.[Название ателье]) AND
							  (ServicePrice.[Код услуги] = inserted.[Код услуги]) AND 
							  (ServicePrice.[Название услуги] = inserted.[Название услуги]) AND
							  (ServicePrice.[Стоимость услуги] = inserted.[Стоимость услуги]))
		BEGIN
			INSERT INTO Стоимость
			SELECT [Номер ателье], [Код услуги], [Стоимость услуги] FROM inserted
			PRINT 'Запись добавлена'
		END
		ELSE PRINT 'Запись уже существует'
	ELSE PRINT 'Услуга не существует'
ELSE PRINT 'Ателье не существует'
GO

CREATE TRIGGER EX2 ON Услуги
INSTEAD OF INSERT
AS
DECLARE @avg int
IF EXISTS (SELECT *
			FROM inserted 
			WHERE [Длительность выполнения] IS NULL)
	SELECT @avg = AVG([Длительность выполнения])
	FROM Услуги
ELSE SELECT @avg = [Длительность выполнения]
	 FROM inserted
INSERT INTO Услуги
SELECT Название, @avg
FROM inserted
			
GO
INSERT INTO Услуги
VALUES('example', NULL)
INSERT INTO Услуги
VALUES('example2', 45)
SELECT * FROM Услуги