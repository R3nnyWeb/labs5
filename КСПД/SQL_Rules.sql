CREATE RULE Rus
AS
@x LIKE '[�-��-�]'
GO
EXEC sp_bindrule 'Rus', '������.��������'
EXEC sp_bindrule 'Rus', '������.��������'
GO
CREATE DEFAULT Price
AS 0
GO
EXEC sp_bindefault 'Price', '���������.���������'
GO
CREATE VIEW ServicePrice
AS
SELECT ������.�������� As '�������� ������', ������.�������� As '�������� ������', ���������.���������, ��������� * 5 + '�' As '��������� � ����'
FROM ��������� Join ������ On ���������.������ = ������.�����
					Join ������	On ���������.������ = ������.���
GO