use ������
/*������� 1.1*/
/*����������� �������� ���������, ������� �� ���������
������ ������ ���������� �������� ������.*/
CREATE PROC P1 (@nubmer int = 1, @name nvarchar(30) OUTPUT)
AS
	SELECT @name = ��������
		FROM ������
		WHERE ����� = @nubmer
GO
DECLARE @name nvarchar(30)
EXEC P1 1, @name OUTPUT
PRINT @name
GO

/*������� 2	����������� �������� ���������, ������� ������������
������� ������� � ������� ������. �������� ���������
������ ���������� ������ ������ �� ������������ ��������
���������� �������: ����� ������������ ��������� ����� �
����������� ����������, �� � ��� ������ ���� ������
������������ ����������.*/

CREATE PROC P2 (@name varchar(30), @duration int)
AS
	IF NOT EXISTS (SELECT *
					FROM ������
					WHERE (�������� = @name) And 
						  ([������������ ����������] = @duration) )
		INSERT INTO ������ Values(@name, @duration)
	ELSE PRINT '������ ������ ����������'
GO

EXEC P2 '��������', 22
EXEC P2 '��������', 28
SELECT * FROM ������
DELETE FROM ������ 
WHERE (�������� = '��������') And ([������������ ����������] = 28)
GO
/*������� 3.	����������� �������� ���������, ������� �� ���������
�������� ������ ������� ��� ������, ������������
���������� � ������ ��� ������� � ����������� �� ������� ������������.
��������,
������ 1 (������������): ������������ ���������� � 10 �����.
������������� ����� ��������� �� ������ ��� ����������
��������� ���������� � �������� ���� ������. */

CREATE PROC P3 (@name varchar(30), @inDays bit)
AS
	IF EXISTS(SELECT *
			  FROM ������
			  WHERE �������� = @name)
		SELECT ('������ '+ CAST(��� AS varchar) +
			' ('+��������+'): ������������ ���������� � '
			+ CASE @inDays 
			WHEN 1 THEN CAST([������������ ����������]AS varchar)+'  �����'
			ELSE CAST([������������ ����������]/7 AS varchar)+'  ������'
			END) AS '���������� �� �������'
		FROM ������
		WHERE �������� = @name
	ELSE PRINT '���������� �� �������'
GO
EXEC P3 '��������', TRUE 
EXEC P3 '��������', FALSE
EXEC P3 '������', TRUE

GO
/*������� 1.4*/
/*����������� �������� ���������, ������� �������� ���������
�������� ������������� ������ �������� �������, ���������
� ��������� �������:
������������ ����������      ������ �� ������
(�����)				
    >30								50%
	10..30							20%
	<10								10%*/
CREATE PROC P4 (@serviceName nvarchar(30) = '������������')
AS
DECLARE @serviceNubmer int
DECLARE @discount float
DECLARE @duration float
SELECT @serviceNubmer = ���
	FROM ������
	WHERE �������� = @serviceName

SELECT @duration = [������������ ����������] 
	FROM ������
	WHERE ��� = @serviceNubmer

SELECT @discount = CASE
	WHEN @duration > 30 THEN (1-0.5)
	WHEN @duration BETWEEN 10 AND 30 THEN (1-0.2)
	WHEN @duration < 10 THEN (1-0.1)
END
UPDATE ���������
SET ��������� = ��������� * @discount
WHERE ������ = @serviceNubmer
GO

EXEC P4
GO

ALTER TABLE ������
ADD ������� int NULL

GO
ALTER PROC P5
AS
UPDATE ������
SET ������� = 
	(SELECT �������
	FROM 
		(SELECT ������, CASE
				WHEN COUNT(������) < 2 THEN 0
				WHEN COUNT(������) > 5 THEN 40
				ELSE 25
			END AS �������
		FROM ���������
		GROUP BY ������) AS �������
	WHERE ������.����� = �������.������)
GO
EXEC P5

SELECT * FROM ������
SELECT * FROM ���������
GO