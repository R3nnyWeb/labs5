
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

	





