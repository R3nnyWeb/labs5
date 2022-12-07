.686P
.MODEL FLAT, stdcall
option casemap : none
RGBW equ 00CCCCCCh; ���� ���� ����
include win.inc
include console.inc

include C:/masm32/include/masm32.inc
includelib C:/masm32/lib/masm32.lib
.data
	HWND DD 0; ���������� �������� ����
	HINST DD 0; ���������� ����������
	TITL DB "���������", 0
	CLASSNAME DB 'CLASS32', 0
	Message MSG < ? >
	WC WNDCLASS < ? >

	CPBUT db '����������', 0
	CLSBTN db 'BUTTON', 0
	CLSEDT db 'EDIT', 0
	CAP db '���������', 0
	TEXTA db 20 dup(0); ����� � ����� ��������������
	TEXTB db 20 dup(0)
	num dd 0
	hBut DD ? ; ���������� ������
	hedt1 DD ? ; ���������� ���� 1
	hedt2 DD ? ; ���������� ���� 2
	hdc DD ? ; ���������� ��������� ����
	ps PAINTSTRUCT < ? >
	mess1 db '��������� ������� : ', 0; ������� � ����
	mess1_len equ $ - mess1 - 1
	mess2 db '=', 10 dup(' '), 0; ��������� ����� ���������
	sum_len equ $ - mess2 - 1

.code
START proc
; �������� ���������� ����������
	INVOKE GetModuleHandle, 0
	MOV HINST, EAX
; ��������� ��������� ���� �����
	MOV WC.style, CS_HREDRAW + CS_VREDRAW + CS_GLOBALCLASS
; ��������� ��������� ���������
	MOV WC.lpfnWndProc, OFFSET WNDPROC;��������� ��������� ���� ���� ������ ����
;������������ � ����(������ ��������� ����� �������� ����)
	MOV EAX, HINST
	MOV WC.hInstance, EAX
	INVOKE LoadIcon, 0, IDI_APPLICATION;������ ������
	MOV WC.hIcon, EAX
	INVOKE LoadCursor, 0, IDC_ARROW;������ ������
	MOV WC.hCursor, EAX
	INVOKE CreateSolidBrush, RGBW;������� ����� ��� ���������� ���� ����
	MOV WC.hbrBackground, EAX
	MOV DWORD PTR WC.lpszMenuName, 0
	MOV DWORD PTR WC.lpszClassName, OFFSET CLASSNAME

	INVOKE RegisterClass, OFFSET WC
; ������� ���� ������������������� ������
	INVOKE CreateWindowEx, 0,
	OFFSET CLASSNAME,
	OFFSET TITL,
	WS_CAPTION + WS_SYSMENU + WS_THICKFRAME + WS_GROUP + WS_TABSTOP,
	100, ; X � ���������� ������ �������� ����
	100, ; Y � ���������� ������ �������� ����
	400, ; DX - ������ ����
	450, ; DY � ������ ����
	0, 0, HINST, 0
	CMP EAX, 0; �������� �� ������
	JZ END_LOOP
	MOV HWND, EAX; ���������� ����
	INVOKE ShowWindow, HWND, SW_SHOWNORMAL; �������� ��������� ����
	INVOKE UpdateWindow, HWND;������������ ������� ����� ����

;------------------------------------------------------------------ -
; ���� ��������� ���������
MSG_LOOP :
	INVOKE GetMessage, OFFSET Message, 0, 0, 0
	CMP EAX, 0
	JE END_LOOP
	INVOKE TranslateMessage, OFFSET Message
	INVOKE DispatchMessageA, OFFSET Message
	JMP MSG_LOOP
END_LOOP :
	INVOKE ExitProcess, Message.wParam; ����� �� ���������
START endp

; --------------------------------------------------
; ��������� ����
	WNDPROC PROC hW : DWORD, Mes : DWORD, wParam : DWORD, lParam : DWORD
	CMP Mes, WM_DESTROY;����� ����������� ��� �������� ����
	JE WMDESTROY
	CMP Mes, WM_CREATE; ��� �������� ����
	JE WMCREATE
	CMP Mes, WM_COMMAND; ����� �������(���������)
	JE WMCOMMAND
	CMP Mes, WM_PAINT; ������� ����������� ����� ����
	JE WMPAINT
	JMP DEFWNDPROC


;------------------------------------------------------------------
WMCREATE:; �������� ����
	INVOKE CreateWindowExA, 0, ; ���� �������������� 1
	offset CLSEDT, ; ��� ������ ����
	offset TEXTA, ; ������� � ����
	WS_CHILD + WS_VISIBLE, ; ����� ����
	10, 50, ;x, y
	60, 20, ; �����, ������
	hW, ;���������� ����
	0, ;���������� ����
	HINST, ;���������� ����������
	0;lpParam
	mov hedt1, eax; ���������� �����������
	mov eax, 0
	INVOKE ShowWindow, hedt1, SW_SHOWNORMAL
	INVOKE CreateWindowExA, 0, ; ������
	offset CLSBTN, ; ��� ������ ����
	offset CPBUT, ; ������� �� ������
	WS_CHILD + WS_VISIBLE, ; ����� ���� ������
	10, 90, ;x, y
	100, 20, ; �����, ������
	hW, ;���������� ����
	0, ;���������� ����
	HINST, ;���������� ����������
	0;lpParam
	mov hBut, eax; ���������� �����������
	mov eax, 0
	INVOKE ShowWindow, hBut, SW_SHOWNORMAL
	MOV EAX, 0
	JMP FINISH
;------------------------------------------------------------------
WMCOMMAND:	; ��������� ������� ������
	mov eax, hBut
	cmp lParam, eax
	jne COM_END; ������� �� ������������� ������� ������
	INVOKE SendMessage, hedt1, WM_GETTEXT, 20, offset TEXTA
	INVOKE SendMessage, hedt2, WM_GETTEXT, 20, offset TEXTB
	INVOKE StrToFloat, offset TEXTA, offset num
	mov eax, num
	add num, eax
	;FINIT
	;fld num
	;fcos
	;fstp num
	mov eax, sum_len
	INVOKE TextOutA, hdc, 80, 50, offset mess2, eax; �������� ������ ���������� � ����
	INVOKE FloatToStr, qword ptr (num), offset mess2 + 1
	INVOKE LENSTR, offset mess2; ����������� ����� ����������
	push eax
	INVOKE TextOutA, hdc, 80, 50, offset mess2, eax; ����� ����������
	pop ecx; ������� ������
	inc ecx
	mov al, ' '
	mov edi, offset mess2 + 1
CLR: mov[edi], al
	inc edi
	loop CLR
	COM_END :
	MOV EAX, 0
	JMP FINISH
;------------------------------------------------------------------
WMPAINT:; ����������� ����
	INVOKE BeginPaint, hW, offset ps
	mov hdc, eax
	INVOKE SetBkColor, hdc, RGBW
	mov eax, mess1_len
	INVOKE TextOutA, hdc, 10, 20, offset mess1, eax
	INVOKE EndPaint, hdc, offset ps
	MOV EAX, 0
	JMP FINISH
;------------------------------------------------------------------
DEFWNDPROC:; ��������� ��������� �� ���������
	INVOKE DefWindowProc, 
	hW, Mes, wParam, lParam
	JMP FINISH
;------------------------------------------------------------------
WMDESTROY:; ����� �� ����� ��������� ���������
	INVOKE PostQuitMessage, 0
	MOV EAX, 0
FINISH: ret
	WNDPROC ENDP
END START