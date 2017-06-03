extern imprimir, intparserfloat, pegan ;Funcoes Externas
SECTION .data
	var dq 0.0
	n 	dq 4.0
SECTION .text
global main
main:
	call pegan ;Chama a funcao em C, que retorna um numero inteiro
	push eax ;retorno de funcao Inteiro eh guardado no EAX, por isso empilhamos a conversao
	fmul st0, st0 ; faco x*x
	call intparserfloat ;chama a funcao que ira converter de inteiro para float, o retorno vai para st0
	add esp, 4 ; como passamos 1 parametro, ajustamos pilha por 4, se fossem 2 - 8 e...
	fst qword[var] ;colocamos o resultado em float(st0) na variavel var
	push dword[var+4]
	push dword[var] ;empilha var para que possa ser impressa
	call imprimir ; funcao imprimir
	add esp, 4 ;reajustando a pilha voltando ao ESP antigo
	mov eax, 1
	mov ebx, 0
	int 80h
