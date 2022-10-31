.686P
.MODEL FLAT, STDCALL
.STACK 4096 

option casemap:none 
include c:\masm32\include\windows.inc ;�������� �������� �� ���� � ������ inc � lib
include c:\masm32\include\user32.inc
includelib c:\masm32\lib\user32.lib
include c:\masm32\include\kernel32.inc
includelib c:\masm32\lib\kernel32.lib

.DATA ;������� ������������������ ������ 
FileName DB "w_512.dat",0 ;����� ����� ��������� ������ ���� � �����
BadText db "File dont open!",0

.DATA? ;������� �� ������������������ ������
hFile HANDLE ?
hMemory DWORD ?
pMemory DWORD ?
memID DWORD ?
SizeR DWORD ?
dwBytesRead dd ?
HW DD ?
dwFileSize dd ?

;EXTERN MessageBoxA@16:NEAR ;��� �������������� ���� ������ ������

.CODE ;������� ����
START: ;����� ������ ���������

; ��������� ���� ��� ������ ����� API �������
invoke CreateFile, addr FileName, GENERIC_READ, 0, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL

mov hFile, eax ;���������� ������ �����
cmp hFile, INVALID_HANDLE_VALUE ;��������� �� ������ ����� �� ����������
jz ErrorMsg

invoke GetFileSize, hFile, NULL ;���������� ������ �����
mov dwFileSize, eax

INVOKE GlobalAlloc, GMEM_FIXED or GMEM_ZEROINIT, dwFileSize
mov hMemory, eax
invoke GlobalLock, hMemory
mov pMemory, eax ; ���������� ��������� �� ������

;������ ������ �� ����� �������� 4096 ����
INVOKE ReadFile, hFile, pMemory, 4096, addr dwBytesRead, NULL ;������ ������ ������ ���� �� ����� ������� �����
; ����� ����������� ���� ����� ���������� � dwBytesRead
or eax, eax ; ��������� �� ������ ������
jz ErrorMsg

mov bx, word ptr [pMemory];��� �� �������� ������????

mov eax, pMemory;������ ���������
mov bx, [eax];��� ������ ������ �����
mov bx, [eax+2];��� ������ ������ �����
mov ebx, [eax];��� ������ ��� integer � ������� ����� ������ ������
mov ebx, [eax+1];��� ������ ��� integer c� ������� ����� ������ ������
mov bx, [eax+512*2];��� ������ 512 �����
mov bl, [eax];��� ������ ������ ����
mov bh, [eax+1];��� ������ ������ ����

cycle: 
add al, 1
shl al, 1
add eax, al
mov bx, [eax]
add cx, bx
cmp al, 256
jnz cycle

xor cx, 0x10000
mov ax, 0
sub ax, cx

cycle2: 
add al, 1
shl al, 2
add eax, al
mov �bx, [eax]
add cx, bx
cmp al, 256
jnz cycle2

xor cx, 0x100000000
mov ax, 0
sub ax, cx

mov eax, pMemory;������ ���������
cycle3:
add bl, 1
shl bl, 1
add eax, bl
mov cx, [eax]
mov dx, [eax+1]
add dx, cx
mov [ebx], dx
cmp bl, 256
jnz cycle3

push eax
add eax,2048
mov memID,eax
pop eax

INVOKE ReadFile, hFile, memID, 2048, addr dwBytesRead, NULL ;������ ������ ������ ���� �� ������ ������� �����
; ����� ����������� ���� ����� ���������� � dwBytesRead
or eax, eax ; ��������� �� ������ ������
jz ErrorMsg

;mov bx, [eax+2048];������ ������
; ��� ���
mov eax,memID
mov cx, [eax];������ ����

invoke GlobalUnlock, pMemory
invoke GlobalFree, hMemory
INVOKE CloseHandle, hFile

jmp End_code

COMMENT * ; ��� ����������� ������������� �����������
PUSH OFFSET STR1
PUSH OFFSET STR2
PUSH HW
CALL MessageBoxA@16
*

ErrorMsg:
invoke MessageBox,NULL,addr BadText,addr BadText,MB_OK
invoke ExitProcess,0
End_code:
RET
END START