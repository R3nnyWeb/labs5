
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

	





