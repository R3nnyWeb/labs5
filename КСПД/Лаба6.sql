use ������
GO
--1. ������� ������������� � ����������� � ��������� �����. 
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
SELECT * FROM ServicePrice 
GO

--����������� �������, ������� ��������� ������� ���������� � ��������� ����� ����� �������������. 
--�������, ��� ������������ ��������������� ����������� ������� ��������� ������� � �������. 
--������������� ����� ��������� �� ������ � ������ ����� ���������� � �������������� ������ ��� � �������������� ������.
CREATE TRIGGER T1 ON ServicePrice
INSTEAD OF INSERT
AS
DECLARE @�����_������ int,
	@��������_������ varchar(30),
	@���_������ int,
	@��������_������ varchar(30),
	@���������_������ smallmoney
DECLARE curs CURSOR scroll
FOR
	SELECT [����� ������], [�������� ������], [��� ������], 
			[�������� ������], [��������� ������]
	FROM inserted
OPEN curs
FETCH FIRST FROM curs
INTO @�����_������, @��������_������, @���_������, @��������_������, @���������_������
WHILE @@FETCH_STATUS = 0
BEGIN
	IF EXISTS (SELECT * 
				FROM ServicePrice
				WHERE ([����� ������] = @�����_������) AND 
					  ([�������� ������] = @��������_������))
		IF EXISTS (SELECT * 
					FROM ServicePrice
					WHERE ([��� ������] = @���_������) AND 
						  ([�������� ������] = @��������_������))
			IF NOT EXISTS (SELECT * 
							FROM ServicePrice
							WHERE ([����� ������] = @�����_������) AND 
								  ([�������� ������] = @��������_������) AND
								  ([��� ������] = @���_������) AND 
								  ([�������� ������] = @��������_������) AND
								  ([��������� ������] = @���������_������))
			BEGIN
				INSERT ���������
				VALUES (@�����_������, @���_������, @���������_������)
				PRINT '������ ���������'
			END
			ELSE PRINT '������ ��� ����������'
		ELSE PRINT '������ �� ����������'
	ELSE PRINT '������ �� ����������'
	FETCH NEXT FROM curs
	INTO @�����_������, @��������_������, @���_������, @��������_������, @���������_������
END
ClOSE curs
DEALLOCATE curs
GO

INSERT ServicePrice
VALUES(1, '������� ����', 9, '�����', 999),
	  (1, '������� ����', 10, '������', 999)
GO
INSERT ServicePrice
VALUES(1, '������� ����', 9, '�����', 999),
	  (19, '������� ����', 10, '������', 999),
	  (1, '������� ����', 10, '��������', 999)
GO

SELECT * FROM ServicePrice
SELECT * FROM ���������
GO

DELETE FROM ��������� WHERE ��������� = 999
GO

CREATE OR ALTER PROC P1
AS
DECLARE @��������_������ varchar(30),
	@���_������ int,
	@��������_������ varchar(30),
	@���������_������ smallmoney,
	@�������_��������� int,
	@�����������_��������� int,
	@������������_��������� int
DECLARE curs CURSOR scroll
FOR
	SELECT ���, ��������
	FROM ������
OPEN curs
FETCH FIRST FROM curs
INTO @���_������, @��������_������
WHILE @@FETCH_STATUS = 0
BEGIN
	PRINT '������: ' + @��������_������
	DECLARE innerCurs CURSOR scroll
	FOR	
		SELECT ��������, ���������
		FROM ��������� JOIN ������ ON ���������.������ = ������.�����
		WHERE ������ = @���_������
	OPEN innerCurs
	FETCH FIRST FROM innerCurs
	INTO @��������_������, @���������_������
	WHILE @@FETCH_STATUS = 0
	BEGIN
		PRINT '������: ' + @��������_������ + '	' + CAST(@���������_������ AS varchar) + ' ���.'
		FETCH NEXT FROM innerCurs
		INTO @��������_������, @���������_������
	END
	ClOSE innerCurs
	DEALLOCATE innerCurs
		SELECT @�������_��������� = AVG(���������), @�����������_��������� = MIN(���������), @������������_��������� = MAX(���������)
		FROM ���������
		WHERE ������ = @���_������
	PRINT '������� ��������� ������: '+ CAST(@�������_��������� AS varchar) + ' ���.'
	PRINT '����������� ��������� ������: '+ CAST(@�����������_��������� AS varchar) + ' ���.'
	PRINT '������������ ��������� ������: '+ CAST(@������������_��������� AS varchar) + ' ���.
	'
	FETCH NEXT FROM curs
	INTO @���_������, @��������_������
END
ClOSE curs
DEALLOCATE curs
GO
EXEC P1