.686P
.MODEL FLAT, STDCALL
.STACK 4096;������ �����
option casemap : none
include c:\masm32\include\windows.inc                       ;�������� �������� �� ���� � ������ inc � lib
include c:\masm32\include\user32.inc
includelib c:\masm32\lib\user32.lib
include c:\masm32\include\kernel32.inc
includelib c:\masm32\lib\kernel32.lib

BSIZE equ 30

.DATA;������� ������������������ ������
FileName DB "C:\Users\��������\Desktop\labs5\����\w_512.dat", 0;����� ����� ��������� ������ ���� � �����
BadText db "File dont open!", 0

buf db BSIZE dup(?)
ifmt db "First bytes: %d", 0
msg dd 1234

.DATA?															;������� �� ������������������ ������
hFile HANDLE ?
hMemory DWORD ?
pMemory DWORD ?
memID DWORD ?
SizeR DWORD ?
dwBytesRead dd ?
HW DD ?
dwFileSize dd ?

stdout dd ?
cWritten dd ?
																;EXTERN MessageBoxA@16:NEAR;��� �������������� ���� ������ ������
.CODE															;������� ����
START :															;����� ������ ���������
invoke GetStdHandle, -11
mov stdout, eax
;��������� ���� ��� ������ ����� API �������
invoke CreateFile, addr FileName, GENERIC_READ, 0, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL
mov hFile, eax													;���������� ������ �����
cmp hFile, INVALID_HANDLE_VALUE									;��������� �� ������ ����� �� ����������
jz ErrorMsg
invoke GetFileSize, hFile, NULL									;���������� ������ �����
mov dwFileSize, eax
INVOKE GlobalAlloc, GMEM_FIXED or GMEM_ZEROINIT, dwFileSize
mov hMemory, eax
invoke GlobalLock, hMemory
mov pMemory, eax												;���������� ��������� �� ������
																;������ ������ �� ����� �������� 2048 ����
INVOKE ReadFile, hFile, pMemory, 2048, addr dwBytesRead, NULL   ;������ ������ ������ ���� �� ����� �������

																;����� ����������� ���� ����� ���������� � dwBytesRead
or eax, eax														;��������� �� ������ ������
jz ErrorMsg
mov bx, word ptr[pMemory]		;��� �� �������� ������ ? ? ? ?
mov eax, pMemory												;������ ���������
mov bx, [eax]													;��� ������ ������ �����
mov bx, [eax + 2]												;��� ������ ������ �����
mov ebx, [eax]													;��� ������ ��� integer � ������� ����� ������ ������
mov ebx, [eax + 1]												;��� ������ ��� integer c� ������� ����� ������ ������
mov bx, [eax + 512 * 2]											;��� ������ 512 �����
mov bl, [eax]													;��� ������ ������ ����
mov bh, [eax + 1]												;��� ������ ������ ����

invoke wsprintf, ADDR buf, ADDR ifmt, bl
invoke WriteConsoleA, stdout, ADDR buf, BSIZE, ADDR cWritten, 0

push eax
add eax, 2048
mov memID, eax
pop eax
INVOKE ReadFile, hFile, memID, 2048, addr dwBytesRead, NULL		;������ ������ ������ ���� �� ������ ������� �����
																;����� ����������� ���� ����� ���������� � dwBytesRead
or eax, eax														;��������� �� ������ ������
jz ErrorMsg
	;mov bx, [eax + 2048]										;������ ������
	; ��� ���
mov eax, memID
mov cx, [eax]													;������ ����
invoke GlobalUnlock, pMemory
invoke GlobalFree, hMemory
INVOKE CloseHandle, hFile
jmp End_code
COMMENT*				;��� ����������� ������������� �����������
PUSH OFFSET STR1
PUSH OFFSET STR2
PUSH HW
CALL MessageBoxA@16
*
ErrorMsg:
invoke MessageBox, NULL, addr BadText, addr BadText, MB_OK
invoke ExitProcess, 0
End_code :
	RET
END START