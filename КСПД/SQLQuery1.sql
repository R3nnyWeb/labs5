USE master
CREATE DATABASE Ателье
ON 
   (NAME = 'Ателье',
   FILENAME = 'B:\DB\Ателье.mdf',
   SIZE = 1,
   MAXSIZE = 10,
   FILEGROWTH = 1)
   LOG ON
   (NAME = 'Ателье_log',
  FILENAME = 'B:\DB\Ателье_log.mdf',
   SIZE = 1,
   MAXSIZE = 5,
   FILEGROWTH = 1)
   GO

USE Ателье
CREATE TABLE Ателье
(Номер int IDENTITY(1,1) not null,
Название varchar(30) not null,
Адрес varchar(30) not null,
Телефон int null check( Телефон like '[1-9][0-9][0-9][0-9][0-9][0-9]') 
)
GO 
ALTER TABLE Ателье
ADD CONSTRAINT PK_Ателье primary key (Номер)
GO

USE Ателье
CREATE TABLE Услуги
(Код int IDENTITY(1,1) not null,
Название varchar(30) not null,
[Длительность выполнения] int null check([Длительность выполнения] > 0)
)
GO 
ALTER TABLE Услуги 
ADD CONSTRAINT PK_Услуги primary key (Код)
GO

USE Ателье
CREATE TABLE Стоимость
(Ателье int not null,
Услуга int  not null,
Стоимость smallmoney not null check (Стоимость > 0)
)
GO

ALTER TABLE Стоимость
ADD CONSTRAINT PK_Стоимость primary key (Ателье, Услуга)
GO

ALTER TABLE Стоимость
ADD CONSTRAINT FK_Стоимость_Ателье foreign
key (Ателье) references Ателье(Номер)
GO

ALTER TABLE Стоимость
ADD CONSTRAINT FK_Стоимость_Услуги foreign
key (Услуга) references Услуги(Код)
GO

DBCC CHECKIDENT('Ателье',RESEED,1)
GO
INSERT INTO Ателье VALUES
	('Золотое Руно', 'Новая, 28/32', 250085),
	('Золушка', 'Разина, 2А', 445791),
	('Имидж', 'Карла Маркса, 11', 289622),
	('Канесса', 'Энгельса, 35', 445044),
	('Карина', 'Дзержинского, 40', NULL),
	('Кутюрье', 'Халтурина, 1Б', 324088),
	('Макошь', 'Фрунзе, 15', 456077),
	('Миранда-А', 'Крупской, 27', 557890),
	('Мода', 'ЛенКом, 13', 296057),
	('Образ', 'Урицкого, 25', 411840)

GO


DBCC CHECKIDENT('Услуги',RESEED,1)
GO
INSERT INTO Услуги VALUES
('Укорачивание',10),
('Подгонка', 22),
('Корректировка', 29),
('Перекрой', 30),
('Изменение фасона', 21),
('Замена подкладки', 15),
('Замена фурнитуры', 8),
('Вышивка', NULL),
('Пошив', 35),
('Штопка', 17)
GO


INSERT INTO Стоимость VALUES
(1,1,400),
(1,2,850),
(1,3,700),
(1,4,1000),
(2,1,600),
(2,10,200),
(4,6,500),
(4,7,60),
(5,9,3800),
(5,10,200),
(6,2,780),
(7,4,670),
(7,5,900),
(7,6,540),
(8,7,100),
(8,9,4200),
(9,5,1100),
(9,9,7800),
(10,1,500),
(10,9,400)

go

--USE Ателье
SELECT * 
FROM dbo.Ателье
GO
SELECT * 
FROM dbo.Услуги
GO
select * from dbo.Стоимость
go