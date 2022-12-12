use Ателье
GO
--1. Создать представление с информацией о стоимости услуг. 
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
SELECT * FROM ServicePrice 
GO

--Разработать триггер, который позволяет вносить информацию о стоимости услуг через представление. 
--Считать, что пользователю предоставляется возможность вставки множества записей в таблицу. 
--Предусмотреть вывод сообщения об ошибке в случае ввода информации о несуществующем ателье или о несуществующей услуге.
CREATE TRIGGER T1 ON ServicePrice
INSTEAD OF INSERT
AS
DECLARE @Номер_ателье int,
	@Название_ателье varchar(30),
	@Код_услуги int,
	@Название_услуги varchar(30),
	@Стоимость_услуги smallmoney
DECLARE curs CURSOR scroll
FOR
	SELECT [Номер ателье], [Название ателье], [Код услуги], 
			[Название услуги], [Стоимость услуги]
	FROM inserted
OPEN curs
FETCH FIRST FROM curs
INTO @Номер_ателье, @Название_ателье, @Код_услуги, @Название_услуги, @Стоимость_услуги
WHILE @@FETCH_STATUS = 0
BEGIN
	IF EXISTS (SELECT * 
				FROM ServicePrice
				WHERE ([Номер ателье] = @Номер_ателье) AND 
					  ([Название ателье] = @Название_ателье))
		IF EXISTS (SELECT * 
					FROM ServicePrice
					WHERE ([Код услуги] = @Код_услуги) AND 
						  ([Название услуги] = @Название_услуги))
			IF NOT EXISTS (SELECT * 
							FROM ServicePrice
							WHERE ([Номер ателье] = @Номер_ателье) AND 
								  ([Название ателье] = @Название_ателье) AND
								  ([Код услуги] = @Код_услуги) AND 
								  ([Название услуги] = @Название_услуги) AND
								  ([Стоимость услуги] = @Стоимость_услуги))
			BEGIN
				INSERT Стоимость
				VALUES (@Номер_ателье, @Код_услуги, @Стоимость_услуги)
				PRINT 'Запись добавлена'
			END
			ELSE PRINT 'Запись уже существует'
		ELSE PRINT 'Услуга не существует'
	ELSE PRINT 'Ателье не существует'
	FETCH NEXT FROM curs
	INTO @Номер_ателье, @Название_ателье, @Код_услуги, @Название_услуги, @Стоимость_услуги
END
ClOSE curs
DEALLOCATE curs
GO

INSERT ServicePrice
VALUES(1, 'Золотое руно', 9, 'Пошив', 999),
	  (1, 'Золотое руно', 10, 'Штопка', 999)
GO
INSERT ServicePrice
VALUES(1, 'Золотое руно', 9, 'Пошив', 999),
	  (19, 'Золотое руно', 10, 'Штопка', 999),
	  (1, 'Золотое руно', 10, 'Перекрой', 999)
GO

SELECT * FROM ServicePrice
SELECT * FROM Стоимость
GO

DELETE FROM Стоимость WHERE Стоимость = 999
GO

CREATE OR ALTER PROC P1
AS
DECLARE @Название_ателье varchar(30),
	@Код_услуги int,
	@Название_услуги varchar(30),
	@Стоимость_услуги smallmoney,
	@Средняя_стоимость int,
	@Минимальная_стоимость int,
	@Максимальная_стоимость int
DECLARE curs CURSOR scroll
FOR
	SELECT Код, Название
	FROM Услуги
OPEN curs
FETCH FIRST FROM curs
INTO @Код_услуги, @Название_услуги
WHILE @@FETCH_STATUS = 0
BEGIN
	PRINT 'Услуга: ' + @Название_услуги
	DECLARE innerCurs CURSOR scroll
	FOR	
		SELECT Название, Стоимость
		FROM Стоимость JOIN Ателье ON Стоимость.Ателье = Ателье.Номер
		WHERE Услуга = @Код_услуги
	OPEN innerCurs
	FETCH FIRST FROM innerCurs
	INTO @Название_ателье, @Стоимость_услуги
	WHILE @@FETCH_STATUS = 0
	BEGIN
		PRINT 'Ателье: ' + @Название_ателье + '	' + CAST(@Стоимость_услуги AS varchar) + ' руб.'
		FETCH NEXT FROM innerCurs
		INTO @Название_ателье, @Стоимость_услуги
	END
	ClOSE innerCurs
	DEALLOCATE innerCurs
		SELECT @Средняя_стоимость = AVG(Стоимость), @Минимальная_стоимость = MIN(Стоимость), @Максимальная_стоимость = MAX(Стоимость)
		FROM Стоимость
		WHERE Услуга = @Код_услуги
	PRINT 'Средняя стоимость услуги: '+ CAST(@Средняя_стоимость AS varchar) + ' руб.'
	PRINT 'Минимальная стоимость услуги: '+ CAST(@Минимальная_стоимость AS varchar) + ' руб.'
	PRINT 'Максимальная стоимость услуги: '+ CAST(@Максимальная_стоимость AS varchar) + ' руб.
	'
	FETCH NEXT FROM curs
	INTO @Код_услуги, @Название_услуги
END
ClOSE curs
DEALLOCATE curs
GO
EXEC P1