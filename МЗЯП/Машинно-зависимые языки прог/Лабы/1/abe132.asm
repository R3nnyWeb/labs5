stacksg segment para stack 'stack' 
	db 12 dup ('stackseg') 
stacksg ends 
codesg segment para 'code'
begin proc far
 assume ss:stacksg,cs:codesg,ds:nothing
 push ds
 sub ax,ax
 push ax
 mov ax, 0123h
 add ax, 0025h 
 mov bx,ax 
 add bx,ax 
 mov cx,bx 
 sub cx,ax 
 sub ax,ax 
 nop 
 ret 
begin endp 
codesg ends
 end begin