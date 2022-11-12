.686P
.MODEL FLAT, STDCALL
.STACK 4096
option casemap:none
include c:/masm32/include/windows.inc
include c:/masm32/include/user32.inc
includelib c:/masm32/lib/user32.lib
include c:/masm32/include/kernel32.inc
includelib c:/masm32/lib/kernel32.lib
.DATA

;Файл
FileName db "B:\base.dat",0
BadText db "File dont open!",0

;Структура
workers struc
id dw 0h
fio db 30 dup (' ')
gender db 'm'
age db 18h
standing db 1
salary dd 1000
birthdate db 8 dup(' ')
workers ends
ex4_Text db 30 dup(' ')

.DATA?
hFile HANDLE ?
dwBytesRead dd ?
workers_array workers 10 dup(<?>)
ex1_Mcount dd ?
ex1_Wcount dd ?
ex2_count dw ?
ex3_divisible dd ?
ex3_divider dd ?
ex3_result dd ?
.CODE
START:
invoke CreateFile, addr FileName, GENERIC_READ, 0, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL
mov hFile, eax
cmp hFile, INVALID_HANDLE_VALUE
jz ErrorMsg
invoke ReadFile, hFile, offset workers_array, 470, addr dwBytesRead, NULL
or eax, eax
jz ErrorMsg
ex1:
mov eax, 0
mov ex1_Mcount, 0
mov ex1_Wcount, 0
cykle2:
imul ebx, eax, 47
mov cl, workers_array[ebx].gender
cmp cl, 'm'
jz m
inc ex1_Wcount
jmp mend
m:
inc ex1_Mcount
mend:
inc eax
cmp eax, 10
jnz cykle2
ex2:
mov ebx,0
mov eax, 0
mov ex2_count, 0
mov ecx, 0
c2:
imul edx, eax, 47
mov cl, workers_array[edx].age
add ebx, ecx
inc eax
cmp eax, 10
jnz c2
mov eax, ebx
mov ebx, 10
mov edx, 0
div bx
mov ex2_count, ax
ex3:
mov eax, 0
mov ex3_divisible, 0
mov ex3_divider, 0
mov ex3_result, 0
c3:
imul ebx, eax, 47
mov ecx, workers_array[ebx].salary
add ex3_divisible, ecx
inc eax
cmp eax, 10
jnz c3
mov eax, 10
mov ex3_divider, eax
fild ex3_divider
fild ex3_divisible
fdiv st, st(1)
fstp ex3_result
ex4:
lea eax, workers_array[6*47].fio
lea edx, ex4_Text
mov ebx, 30
c4:
mov cl, byte ptr[eax]
mov byte ptr[edx], cl
inc eax
inc edx
dec ebx
jnz c4
invoke MessageBox, NULL, addr ex4_Text, addr ex4_Text, MB_OK
invoke ExitProcess, 0
invoke CloseHandle, hFile
jmp End_code
ErrorMsg:
invoke MessageBox, NULL, addr BadText, addr BadText, MB_OK
invoke ExitProcess, 0
End_code:
RET
END START
