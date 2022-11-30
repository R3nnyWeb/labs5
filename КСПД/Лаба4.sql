use ������
/*����������� AFTER-�������, ������� ��������� �������
���������� ��� ���� ������ �� ������� ������, ����� ������
� ������� 1. �������, ��� ������������ ���������������
����������� �������� ��������� ������� � �������.*/
CREATE TRIGGER T1 ON dbo.������
AFTER DELETE
AS
IF EXISTS (
	SELECT * 
	FROM deleted
	WHERE ����� = 1)
BEGIN
	ROLLBACK TRAN
	PRINT '������. ������ ������� ������ � ������� 1'
END
ELSE PRINT '�����'
GO


DELETE
FROM ������
WHERE ����� = 1
GO



/*����������� INSTEAD OF-������� ��� ���������������� � �.1.1 �������. �������� ���������� ������ INSTEAD OF � AFTER-���������. */
CREATE TRIGGER T2 ON ������
INSTEAD OF DELETE
AS
	DELETE
	FROM ���������
	WHERE (���������.������ IN (SELECT �����
								FROM deleted))
	and (���������.������ <> 1)
	
	DELETE
	FROM ������
	WHERE (������.����� IN (SELECT �����
							FROM deleted))
	and (������.����� <> 1)
GO

SELECT *
FROM ������
GO
SELECT *
FROM ���������
GO

/*����������� �������, ������� ��������� ��������
������������ ���������� ������ ������ �� ������� ��������.
�������, ��� ������������ ��������������� �����������
����������� ��������� ������� � �������.


ELSE */
ALTER TRIGGER T3 ON ������
INSTEAD OF UPDATE
AS
IF COLUMNS_UPDATED() & 4 > 0
BEGIN
	UPDATE ������
	SET ������.[������������ ����������] = inserted.[������������ ����������]
	FROM ������, inserted
	WHERE (inserted.[������������ ����������] < ������.[������������ ����������])
	AND (inserted.��� = ������.���)	
END
UPDATE ������
SET	������.�������� = inserted.��������
FROM ������, inserted
WHERE inserted.��� = ������.���
GO

UPDATE ������
SET	[������������ ����������] = [������������ ����������] + 10



DROP TABLE ���������
DROP TABLE ������
DROP TABLE ������

SELECT * 
FROM ������
GO

	
--2. �������� ��������� ��� �������������.
--2.1. ������� ������������� � ����������� � ��������� �����. 
--������������� ������ �������� ������� ����� ������, 
--�������� ������, ��� ������, �������� ������, ��������� ������.
CREATE VIEW ServicePrice
AS
SELECT ������.����� AS [����� ������], ������.�������� As [�������� ������], 
		������.��� AS [��� ������], ������.�������� As [�������� ������], 
		���������.���������  AS [��������� ������]
FROM ��������� Join ������ On ���������.������ = ������.�����
			   Join ������ On ���������.������ = ������.���
GO

INSERT ServicePrice
VALUES(1,  '������� ����', 10, '������', 999)
GO

SELECT * FROM ServicePrice
SELECT * FROM ���������
GO

DELETE FROM ��������� WHERE ��������� = 999
GO
--2.2. ����������� �������, ������� ��������� ������� ���������� 
--� ��������� ����� ����� �������������. �������, ��� 
--������������ ��������������� ����������� ������� ������ 
--����� ������ ����� �������������. ������������� ����� 
--��������� �� ������ � ������ ����� ���������� � 
--�������������� ������ ��� � �������������� ������

CREATE TRIGGER T4 ON ServicePrice
INSTEAD OF INSERT
AS
IF EXISTS (SELECT * 
			FROM inserted, ServicePrice
			WHERE (ServicePrice.[����� ������] = inserted.[����� ������]) AND 
				  (ServicePrice.[�������� ������] = inserted.[�������� ������]))
	IF EXISTS (SELECT * 
				FROM inserted, ServicePrice
				WHERE (ServicePrice.[��� ������] = inserted.[��� ������]) AND 
					  (ServicePrice.[�������� ������] = inserted.[�������� ������]))
		IF NOT EXISTS (SELECT * 
						FROM inserted, ServicePrice
						WHERE (ServicePrice.[����� ������] = inserted.[����� ������]) AND 
							  (ServicePrice.[�������� ������] = inserted.[�������� ������]) AND
							  (ServicePrice.[��� ������] = inserted.[��� ������]) AND 
							  (ServicePrice.[�������� ������] = inserted.[�������� ������]) AND
							  (ServicePrice.[��������� ������] = inserted.[��������� ������]))
		BEGIN
			INSERT INTO ���������
			SELECT [����� ������], [��� ������], [��������� ������] FROM inserted
			PRINT '������ ���������'
		END
		ELSE PRINT '������ ��� ����������'
	ELSE PRINT '������ �� ����������'
ELSE PRINT '������ �� ����������'
GO

CREATE TRIGGER EX2 ON ������
INSTEAD OF INSERT
AS
DECLARE @avg int
IF EXISTS (SELECT *
			FROM inserted 
			WHERE [������������ ����������] IS NULL)
	SELECT @avg = AVG([������������ ����������])
	FROM ������
ELSE SELECT @avg = [������������ ����������]
	 FROM inserted
INSERT INTO ������
SELECT ��������, @avg
FROM inserted
			
GO
INSERT INTO ������
VALUES('example', NULL)
INSERT INTO ������
VALUES('example2', 45)
SELECT * FROM ������