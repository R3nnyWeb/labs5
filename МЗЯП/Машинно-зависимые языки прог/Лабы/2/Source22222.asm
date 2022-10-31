.686P
.MODEL FLAT, STDCALL
.STACK 4096 

option casemap:none 
include c:\masm32\include\windows.inc ;обратите внимание на путь к файлам inc и lib
include c:\masm32\include\user32.inc
includelib c:\masm32\lib\user32.lib
include c:\masm32\include\kernel32.inc
includelib c:\masm32\lib\kernel32.lib

.DATA ;сегмент инициализированных данных 
FileName DB "w_512.dat",0 ;здесь лучше указывать полный путь к файлу
BadText db "File dont open!",0

.DATA? ;сегмент не инициализированных данных
hFile HANDLE ?
hMemory DWORD ?
pMemory DWORD ?
memID DWORD ?
SizeR DWORD ?
dwBytesRead dd ?
HW DD ?
dwFileSize dd ?

;EXTERN MessageBoxA@16:NEAR ;так комментируется одна строка строка

.CODE ;сегмент кода
START: ;точка старта программы

; открываем файл для чтения через API функцию
invoke CreateFile, addr FileName, GENERIC_READ, 0, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL

mov hFile, eax ;возвращаем хендел файла
cmp hFile, INVALID_HANDLE_VALUE ;проверяем на хендел файла на валидность
jz ErrorMsg

invoke GetFileSize, hFile, NULL ;определяем размер файла
mov dwFileSize, eax

INVOKE GlobalAlloc, GMEM_FIXED or GMEM_ZEROINIT, dwFileSize
mov hMemory, eax
invoke GlobalLock, hMemory
mov pMemory, eax ; Возвращаем указатель на память

;читаем данные из файла размером 4096 байт
INVOKE ReadFile, hFile, pMemory, 4096, addr dwBytesRead, NULL ;размер чтения должен быть не болше размера стека
; колво прочитанных байт будет возвращено в dwBytesRead
or eax, eax ; проверяем на ошибку чтения
jz ErrorMsg

mov bx, word ptr [pMemory];так не работает ПОЧЕМУ????

mov eax, pMemory;Грузим указатель
mov bx, [eax];так читаем первое слово
mov bx, [eax+2];так читаем второе слово
mov ebx, [eax];так читаем как integer с первого байта буфера памяти
mov ebx, [eax+1];так читаем как integer cо второго байта буфера памяти
mov bx, [eax+512*2];так читаем 512 слово
mov bl, [eax];так читаем первый байт
mov bh, [eax+1];так читаем второй байт

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
mov еbx, [eax]
add cx, bx
cmp al, 256
jnz cycle2

xor cx, 0x100000000
mov ax, 0
sub ax, cx

mov eax, pMemory;Грузим указатель
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

INVOKE ReadFile, hFile, memID, 2048, addr dwBytesRead, NULL ;размер чтения должен быть не больше размера стека
; колво прочитанных байт будет возвращено в dwBytesRead
or eax, eax ; проверяем на ошибку чтения
jz ErrorMsg

;mov bx, [eax+2048];ошибка чтения
; или так
mov eax,memID
mov cx, [eax];первый байт

invoke GlobalUnlock, pMemory
invoke GlobalFree, hMemory
INVOKE CloseHandle, hFile

jmp End_code

COMMENT * ; так оформляется многострочный комментарий
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