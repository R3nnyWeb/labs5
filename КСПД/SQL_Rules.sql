CREATE RULE Rus
AS
@x LIKE '[А-Яа-я]%'
GO
EXEC sp_bindrule 'Rus', 'Ателье.Название'
EXEC sp_bindrule 'Rus', 'Услуги.Название'
GO
EXEC sp_unbindrule 'Ателье.Название'
EXEC sp_unbindrule 'Услуги.Название'
GO
CREATE DEFAULT Price
AS 0
GO
EXEC sp_bindefault 'Price', 'Стоимость.Стоимость'
GO

CREATE VIEW ServicePrice
AS
SELECT Ателье.Название As [Название ателье], Услуги.Название As [Название услуги], Стоимость.Стоимость, Стоимость / 60 + '€' As [Стоимость в евро]
FROM Стоимость Join Ателье On Стоимость.Ателье = Ателье.Номер
			   Join Услуги On Стоимость.Услуга = Услуги.Код
GO
SELECT * FROM ServicePrice

SELECT [Название ателье], COUNT([Название услуги]) AS [Количество услуг]
FROM ServicePrice
GROUP BY [Название ателье]

CREATE VIEW FastServices
AS
SELECT *
FROM Услуги
WHERE [Длительность выполнения] < 25
GO

SELECT * FROM Услуги
SELECT * FROM FastServices

INSERT INTO FastServices VALUES ('Замена пуговиц', 3)
GO

UPDATE FastServices
SET [Длительность выполнения] = 2
WHERE Название = 'Замена пуговиц'
GO

DELETE FROM FastServices
WHERE Название = 'Замена пуговиц'