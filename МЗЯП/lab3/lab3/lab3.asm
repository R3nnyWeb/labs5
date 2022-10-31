.686P
.MODEL FLAT, STDCALL
.STACK 4096
option casemap : none
include c:\masm32\include\windows.inc
include c:\masm32\include\user32.inc
includelib c:\masm32\lib\user32.lib
include c:\masm32\include\kernel32.inc
includelib c:\masm32\lib\kernel32.lib
.DATA

FileName db "B:\w_512.dat", 0
BadText db "File dont open!", 0
EvenWordsC dd 0
OddWordsC dd 0
Ex4_counter dd 0

.DATA?
hFile HANDLE ?
hMemory DWORD ?
pMemory DWORD ?
dwBytesRead dd ?
dwFileSize dd ?
CRC16 dw ?
CR32 dd ?
ADDRCRC16 dd ?
ADDRCR32 dd ?
EvenWordsAcc dw 512 dup(? )
OddWordsAcc dw 512 dup(? )
Ex4_Arr dd 1024 dup(? )

.CODE
START : ;чтение из файла
	invoke CreateFile, addr FileName, GENERIC_READ, 0, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL
	mov hFile, eax
	cmp hFile, INVALID_HANDLE_VALUE
	jz ErrorMsg
	invoke GetFileSize, hFile, NULL
	mov dwFileSize, eax
	invoke GlobalAlloc, GMEM_FIXED or GMEM_ZEROINIT, dwFileSize
	mov hMemory, eax
	invoke GlobalLock, hMemory
	mov pMemory, eax
	invoke ReadFile, hFile, pMemory, 4096, addr dwBytesRead, NULL
	or eax, eax
	jz ErrorMsg
	mov eax, pMemory
ex1 :
	mov ecx, 256
cycle1 :
	mov ebx, 256
	sub ebx, ecx
	sal ebx, 1
	add eax, ebx
	add dx, [eax]
	sub eax, ebx
	dec ecx
	jz ex1_end
	jmp cycle1
ex1_end :
	xor dx, 10000h
	mov CRC16, dx
	mov ADDRCRC16, offset(CRC16)
ex2 :
	mov ecx, 256
	cycle2 :
	mov ebx, 256
	sub ebx, ecx
	sal ebx, 2
	add eax, ebx
	add edx, [eax]
	sub eax, ebx
	dec ecx
	jz ex2_end
	jmp cycle2
ex2_end :
	xor edx, 10000000h
	mov CR32, edx
	mov ADDRCR32, offset(CR32)
ex3 :
	mov ecx, 512
cycle3 :
	mov ebx, 512
	sub ebx, ecx
	sal ebx, 1
	add eax, ebx
	mov dx, [eax]
	sub eax, ebx
	mov bx, dx
	sar bx, 1
	jc c3
	mov ebx, EvenWordsC
	mov EvenWordsAcc[ebx * 2], dx
	inc EvenWordsC
	jmp c3End
c3 :
	mov ebx, OddWordsC
	mov OddWordsAcc[ebx * 2], dx
	inc OddWordsC
c3End :
	dec ecx
	jz ex3_end
	jmp cycle3
ex3_end :
ex4:
	mov ecx, 1024
cycle4 :
	mov ebx, 1024
	sub ebx, ecx
	sal ebx, 2
	add eax, ebx
	mov edx, [eax]
	sub eax, ebx
	mov ebx, edx
	sar ebx, 1
	jnc c4
	mov ebx, Ex4_counter
	mov Ex4_Arr[ebx * 2], edx
	inc Ex4_counter
c4 :
	dec ecx
	jz ex4_end
	jmp cycle4
ex4_end :
	mov ebx, Ex4_counter
ex5 :
	mov bx, [eax + 4094]
ex6 :
	mov bl, [eax]
	mov cx, [eax]
	shl bl, 1
	sar cx, 3
	invoke GlobalUnlock, pMemory
	invoke GlobalFree, hMemory
	invoke CloseHandle, hFile
	jmp End_code
ErrorMsg :
	invoke MessageBox, NULL, addr BadText, addr BadText, MB_OK
	invoke ExitProcess, 0
End_code :
	RET
END START