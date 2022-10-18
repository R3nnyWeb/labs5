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
WITH CHECK OPTION
GO

SELECT * FROM ������
SELECT * FROM FastServices

INSERT INTO FastServices VALUES ('������ �������', 30)
GO
INSERT INTO FastServices VALUES ('������ �������', 3)
GO

UPDATE FastServices
SET [������������ ����������] = 42
WHERE �������� = '������ �������'
GO
UPDATE FastServices
SET [������������ ����������] = 2
WHERE �������� = '������ �������'
GO

DELETE FROM FastServices
WHERE �������� = '������ �������'
GO
-----------------------------------------------------------

CREATE RULE Tel
AS
@x LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
GO
EXEC sp_bindrule 'Tel', '������.�������'
GO
EXEC sp_unbindrule '������.�������'
GO
DROP RULE Tel
GO
------------

DECLARE @avgCost int
SELECT @avgCost = AVG(���������.���������) FROM ���������
PRINT @avgCost
GO

CREATE DEFAULT COST
AS (SELECT AVG(���������.���������) FROM ���������)
GO

-----------

CREATE VIEW MostUsedServices
AS
SELECT ������.*, ������.*
FROM ��������� Join ������ On ���������.������ = ������.�����
			   Join ������ On ���������.������ = ������.���
WHERE ������.��� IN (
					SELECT ������
					FROM ���������
					GROUP BY ������
					HAVING (count(������) >= all(select count(������)
													from ���������
													group by ������)))




