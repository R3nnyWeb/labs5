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

