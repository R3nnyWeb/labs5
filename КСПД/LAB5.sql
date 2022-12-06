use Ателье
GO
CREATE TABLE ВыполнениеУслуг
(Услуга int NOT NULL , Ателье int NOT NULL , ДатаВремя datetime NOT NULL)
GO
ALTER TABLE ВыполнениеУслуг
ADD CONSTRAINT PK_Ателье_ДатаВремя PRIMARY KEY (Ателье,ДатаВремя)
GO
ALTER TABLE  ВыполнениеУслуг
ADD CONSTRAINT  FK_Выполнение_Услуга FOREIGN KEY (Услуга) REFERENCES Услуги(Код)
GO
ALTER TABLE  ВыполнениеУслуг
ADD CONSTRAINT  FK_Выполнение_Ателье FOREIGN KEY (Ателье) REFERENCES Ателье(Номер)
GO
INSERT INTO ВыполнениеУслуг(Услуга, Ателье, ДатаВремя) VALUES
(2,1,CAST('2022-02-12 13:00' as datetime)),
(2,2,CAST('2022-05-01 08:00' as datetime)),
(2,3,CAST('2022-06-12 16:00' as datetime)),
(4,1,CAST('2022-19-05 12:00' as datetime)),
(4,2,CAST('2022-27-05 12:00' as datetime)),
(5,6,CAST('2022-29-11 9:00' as datetime)),
(6,6,CAST('2022-02-12 12:00' as datetime)),
(7,5,CAST('2022-01-09 11:00' as datetime)),
(1,5,CAST('2022-22-04 19:00' as datetime)),
(1,7,CAST('2022-11-11 12:00' as datetime)),
(4,8,CAST('2022-12-10 17:00' as datetime)),
(1,10,CAST('2022-01-12 13:00' as datetime)),
(2,10,CAST('2022-02-12 08:00' as datetime)),
(3,10,CAST('2022-03-12 16:00' as datetime)),
(4,10,CAST('2022-04-12 12:00' as datetime)),
(5,10,CAST('2022-05-12 12:00' as datetime)),
(6,10,CAST('2022-06-12 9:00' as datetime)),
(7,10,CAST('2022-01-12 22:00' as datetime)),
(8,10,CAST('2022-02-12 15:00' as datetime)),
(9,10,CAST('2022-03-12 19:01' as datetime)),
(10,10,CAST('2022-04-12 12:02' as datetime))
GO


/*1.1. Разработать функцию, возвращающую список услуг, которые
не предоставлялись за последние 3 месяца.
*/
GO
CREATE FUNCTION getServicesNotLastThreeMonth()
RETURNS TABLE
AS
    RETURN (SELECT *
           FROM Услуги
           WHERE Код  IN (SELECT DISTINCT Услуга
                             FROM ВыполнениеУслуг
                             WHERE DATEDIFF(MONTH , ДатаВремя,GETDATE() ) < 3))
GO
SELECT * FROM getServicesNotLastThreeMonth();

/*1.3. Разработать функцию, возвращающую список ателье, которые
предоставляли все услуги за последние 3 месяца.
*/
CREATE FUNCTION getAtelByAllServices()
RETURNS  TABLE
AS
    RETURN (SELECT Название
           FROM Ателье
           WHERE NOT EXISTS (SELECT *
                            FROM Услуги
                            WHERE Код NOT IN (SELECT Услуга
                                             FROM ВыполнениеУслуг
                                             WHERE Ателье.Номер = ВыполнениеУслуг.Ателье
                                             AND DATEDIFF(MONTH , ДатаВремя,GETDATE() ) < 3)))
GO
SELECT * FROM getAtelByAllServices()


/* 1.4. Разработать функцию, которая возвращает список услуг ателье
с заданным названием.
 */
GO
CREATE FUNCTION getServices(@Ателье varchar(30))
RETURNS  TABLE
AS
    RETURN (SELECT Название
           FROM Услуги
           WHERE Код IN (SELECT Услуга
                         FROM Стоимость
                         WHERE Ателье IN (SELECT Номер
                                          FROM Ателье
                                          WHERE Ателье.Название = @Ателье)))
GO
SELECT *
FROM getServices(N'Золушка')

GO
/*1.5. Разработать функцию, которая вычисляет количество
предоставленных услуг для каждого ателье и отклонение его
от среднего количества.
*/
CREATE FUNCTION getStatistics()
RETURNS @tmpTable TABLE (
    Название varchar(30), КоличествоУслуг int, ОтколонениеОтСреднего real
              )
AS BEGIN
    DECLARE @avg float

    SELECT @avg =  AVG(count.КоличествоУслуг)
    FROM (SELECT COUNT(ВыполнениеУслуг.Услуга) * 1.0 as [КоличествоУслуг]
            FROM  ВыполнениеУслуг
            GROUP BY Ателье) as count

    INSERT INTO @tmpTable
    SELECT Ателье.Название,
        COUNT(ВыполнениеУслуг.Услуга)  as [КоличествоУслуг],
        ROUND(@avg - COUNT(ВыполнениеУслуг.Услуга) * 1.0 , 3) as ОтколонениеОтСреднего
        FROM Ателье JOIN ВыполнениеУслуг on Ателье.Номер = ВыполнениеУслуг.Ателье
        GROUP BY Ателье.Название
     RETURN ;
END

SELECT * FROM getStatistics()