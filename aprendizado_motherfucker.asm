extern imprimir
SECTION .data
	var dq 3.5
SECTION .text
global main
main:
	push dword [var+4]
	push dword [var]
	call imprimir
	add esp, 8