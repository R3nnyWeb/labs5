.686P
.MODEL FLAT, STDCALL
.STACK 4096
.DATA
myByte   BYTE  13
myByte2  BYTE  ?
myWord   Word  25
myWord2  Word  ?
myDWord  dword 123
myDWord2 dword ?
myString DB "abc", 0
myString2 DB ?
myFloat  real4 3.14
myFloat2 real4 ?
.CODE
START:
mov al, myByte
mov myByte2, al
mov ax, myWord
mov myWord2, ax
mov eax, myDWord
mov myDWord2, eax
mov ebx, myString
mov myString2, ebx
RET
END START