CREATE RULE Rus
AS
@x LIKE '[А-Яа-я]'
GO
EXEC sp_bindrule 'Rus', 'Ателье.Название'
EXEC sp_bindrule 'Rus', 'Услуги.Название'
GO
CREATE DEFAULT Price
AS 0
GO
EXEC sp_bindefault 'Price', 'Стоимость.Стоимость'
GO
CREATE VIEW ServicePrice
AS
SELECT Ателье.Название As 'Название ателье', Услуги.Название As 'Название услуги', Стоимость.Стоимость, Стоимость * 5 + '€' As 'Стоимость в евро'
FROM Стоимость Join Ателье On Стоимость.Ателье = Ателье.Номер
					Join Услуги	On Стоимость.Услуга = Услуги.Код
GO