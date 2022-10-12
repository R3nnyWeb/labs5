CREATE RULE Rus
AS
@x LIKE '[�-��-�]%'
GO
EXEC sp_bindrule 'Rus', '������.��������'
EXEC sp_bindrule 'Rus', '������.��������'
GO
EXEC sp_unbindrule '������.��������'
EXEC sp_unbindrule '������.��������'
GO
CREATE DEFAULT Price
AS 0
GO
EXEC sp_bindefault 'Price', '���������.���������'
GO

CREATE VIEW ServicePrice
AS
SELECT ������.�������� As [�������� ������], ������.�������� As [�������� ������], ���������.���������, ��������� / 60 + '�' As [��������� � ����]
FROM ��������� Join ������ On ���������.������ = ������.�����
			   Join ������ On ���������.������ = ������.���
GO
SELECT * FROM ServicePrice

SELECT [�������� ������], COUNT([�������� ������]) AS [���������� �����]
FROM ServicePrice
GROUP BY [�������� ������]

CREATE VIEW FastServices
AS
SELECT *
FROM ������
WHERE [������������ ����������] < 25
GO

SELECT * FROM ������
SELECT * FROM FastServices

INSERT INTO FastServices VALUES ('������ �������', 3)
GO

UPDATE FastServices
SET [������������ ����������] = 2
WHERE �������� = '������ �������'
GO

DELETE FROM FastServices
WHERE �������� = '������ �������'