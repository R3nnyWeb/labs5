USE master
CREATE DATABASE ������
ON 
   (NAME = '������',
   FILENAME = 'B:\DB\������.mdf',
   SIZE = 1,
   MAXSIZE = 10,
   FILEGROWTH = 1)
   LOG ON
   (NAME = '������_log',
  FILENAME = 'B:\DB\������_log.mdf',
   SIZE = 1,
   MAXSIZE = 5,
   FILEGROWTH = 1)
   GO

USE ������
CREATE TABLE ������
(����� int IDENTITY(1,1) not null,
�������� varchar(30) not null,
����� varchar(30) not null,
������� int null check( ������� like '[1-9][0-9][0-9][0-9][0-9][0-9]') 
)
GO 
ALTER TABLE ������
ADD CONSTRAINT PK_������ primary key (�����)
GO

USE ������
CREATE TABLE ������
(��� int IDENTITY(1,1) not null,
�������� varchar(30) not null,
[������������ ����������] int null check([������������ ����������] > 0)
)
GO 
ALTER TABLE ������ 
ADD CONSTRAINT PK_������ primary key (���)
GO

USE ������
CREATE TABLE ���������
(������ int not null,
������ int  not null,
��������� smallmoney not null check (��������� > 0)
)
GO

ALTER TABLE ���������
ADD CONSTRAINT PK_��������� primary key (������, ������)
GO

ALTER TABLE ���������
ADD CONSTRAINT FK_���������_������ foreign
key (������) references ������(�����)
GO

ALTER TABLE ���������
ADD CONSTRAINT FK_���������_������ foreign
key (������) references ������(���)
GO

DBCC CHECKIDENT('������',RESEED,1)
GO
INSERT INTO ������ VALUES
	('������� ����', '�����, 28/32', 250085),
	('�������', '������, 2�', 445791),
	('�����', '����� ������, 11', 289622),
	('�������', '��������, 35', 445044),
	('������', '������������, 40', NULL),
	('�������', '���������, 1�', 324088),
	('������', '������, 15', 456077),
	('�������-�', '��������, 27', 557890),
	('����', '������, 13', 296057),
	('�����', '��������, 25', 411840)

GO


DBCC CHECKIDENT('������',RESEED,1)
GO
INSERT INTO ������ VALUES
('������������',10),
('��������', 22),
('�������������', 29),
('��������', 30),
('��������� ������', 21),
('������ ���������', 15),
('������ ���������', 8),
('�������', NULL),
('�����', 35),
('������', 17)
GO


INSERT INTO ��������� VALUES
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

--USE ������
SELECT * 
FROM dbo.������
GO
SELECT * 
FROM dbo.������
GO
select * from dbo.���������
go