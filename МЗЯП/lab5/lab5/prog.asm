.586
.MODEL FLAT, stdcall
RGBW equ 00CCCCCCh; цвет фона окна
include win.inc
include console.inc
.data
HWND DD 0; дескриптор главного окна
HINST DD 0; дескриптор приложения 
TITL DB "Программа", 0
CLASSNAME DB 'CLASS32', 0 
Message MSG < ? >
WC WNDCLASS < ? > 

CPBUT db 'Рассчитать', 0
CLSBTN db 'BUTTON', 0
CLSEDT db 'EDIT', 0
CAP db 'Сообщение', 0
TEXTA db 20 dup(0); текст в полях редактирования
TEXTB db 20 dup(0)
summa dd 0
hBut DD ? ; дескриптор кнопки
hedt1 DD ? ; дескриптор поля 1
hedt2 DD ? ; дескриптор поля 2
hdc DD ? ; дескриптор контекста окна
ps PAINTSTRUCT < ? >
mess1 db 'Посчитать сумму двух чисел: ', 0; надпись в окне
mess1_len equ $ - mess1 - 1
mess2 db '=', 10 dup(' '), 0; результат суммы строковый
sum_len equ $ - mess2 - 1
.code
START proc
; получить дескриптор приложения
INVOKE GetModuleHandle, 0
MOV HINST, EAX
;Далее необходимо
;заполнить структуру окна стиль
;указать процедуру обработки сообщений
;создать окно зарегистрированного класса
;А также вывести окно на экран
INVOKE ShowWindow, HWND, SW_SHOWNORMAL; показать созданное окно
INVOKE UpdateWindow, HWND;перерисовать видимую часть окна
;Но помимо окна потребуется еще создать цикл обработки сообщений системы и процедуру
;обработки событий для окна
;Все элементы в windows обмениваются сообщениями, поэтому требуется код для приема и
;диспетчеризации сообщений
;------------------------------------------------------------------ -
; цикл обработки сообщений
MSG_LOOP :
	INVOKE GetMessage, OFFSET Message, 0, 0, 0
	CMP EAX, 0
	JE END_LOOP
	INVOKE TranslateMessage, OFFSET Message
	INVOKE DispatchMessageA, OFFSET Message
	JMP MSG_LOOP
END_LOOP :
	INVOKE ExitProcess, Message.wParam; выход из программы
START endp
;Также требуется основной цикл оконного приложения который будет реагировать на полученные
;сообщения и вызывать требуемые процедуры обработки
; --------------------------------------------------
; процедура окна
	WNDPROC PROC hW : DWORD, Mes : DWORD, wParam : DWORD, lParam : DWORD
	CMP Mes, WM_DESTROY;будет выполняться при закрытии окна
	JE WMDESTROY
	CMP Mes, WM_CREATE; при создании окна
	JE WMCREATE
	CMP Mes, WM_COMMAND; общие команды(сообщения)
	JE WMCOMMAND
	CMP Mes, WM_PAINT; события перерисовки формы окна
	JE WMPAINT
	JMP DEFWNDPROC
;И собственно функции обработки данных событий
;------------------------------------------------------------------
WMCREATE:; создание окна
	INVOKE CreateWindowExA, 0, ; поле редактирования 1
	offset CLSEDT, ; имя класса окна
	offset TEXTA, ; надпись в поле
	WS_CHILD + WS_VISIBLE, ; стиль окна
	10, 50, ;x, y
	60, 20, ; длина, ширина
	hW, ;дескриптор окна
	0, ;дескриптор меню
	HINST, ;дескриптор приложения
	0;lpParam
	mov hedt1, eax; сохранение дескриптора
	mov eax, 0
	INVOKE ShowWindow, hedt1, SW_SHOWNORMAL
	INVOKE CreateWindowExA, 0, ; поле редактирования 2
	offset CLSEDT, ; имя класса окна
	offset TEXTB, ; надпись в поле
	WS_CHILD + WS_VISIBLE, ; стиль окна
	90, 50, ;x, y
	60, 20, ; длина, ширина
	hW, ;дескриптор окна
	0, ;дескриптор меню
	HINST, ;дескриптор приложения
	0;lpParam
mov hedt2, eax; сохранение дескриптора
mov eax, 0
INVOKE ShowWindow, hedt2, SW_SHOWNORMAL
INVOKE CreateWindowExA, 0, ; кнопка
offset CLSBTN, ; имя класса окна
offset CPBUT, ; надпись на кнопке
WS_CHILD + WS_VISIBLE, ; стиль окна кнопки
10, 90, ;x, y
100, 20, ; длина, ширина
hW, ;дескриптор окна
0, ;дескриптор меню
HINST, ;дескриптор приложения
0;lpParam
mov hBut, eax; сохранение дескриптора
mov eax, 0
INVOKE ShowWindow, hBut, SW_SHOWNORMAL
MOV EAX, 0
JMP FINISH
;------------------------------------------------------------------
WMCOMMAND:; обработка нажатия кнопки
mov eax, hBut
cmp lParam, eax
jne COM_END; команда не соответствует нажатию кнопки
INVOKE SendMessage, hedt1, WM_GETTEXT, 20, offset TEXTA
INVOKE SendMessage, hedt2, WM_GETTEXT, 20, offset TEXTB
INVOKE StrToInt, offset TEXTA
mov summa, eax
INVOKE StrToInt, offset TEXTB
add summa, eax
mov eax, sum_len
INVOKE TextOutA, ; стирание строки результата в окне
hdc, 180, 50, offset mess2, eax
INVOKE IntToStr, summa, offset mess2 + 1
INVOKE LENSTR, offset mess2; определение длины результата
push eax
INVOKE TextOutA, ; вывод результата
hdc, 180, 50, offset mess2, eax
pop ecx; очистка строки
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
WMPAINT:; перерисовка окна
INVOKE BeginPaint, hW, offset ps
mov hdc, eax
INVOKE SetBkColor, hdc, RGBW
mov eax, mess1_len
INVOKE TextOutA, hdc, 10, 20, offset mess1, eax
INVOKE EndPaint, hdc, offset ps
MOV EAX, 0
JMP FINISH
;------------------------------------------------------------------
DEFWNDPROC:; обработка сообщения по умолчанию
INVOKE DefWindowProc,
hW, Mes, wParam, lParam
JMP FINISH
;------------------------------------------------------------------
WMDESTROY:; выход из цикла обработки сообщений
INVOKE PostQuitMessage, 0
MOV EAX, 0
FINISH: ret
WNDPROC ENDP
END START