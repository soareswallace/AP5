extern lerValor, imprimir, intTofloat
SECTION .data
	valorLido dq 0.0
	seno dq 0.0
SECTION .text
global main
main:
	call lerValor ;chama a funcao ler valor, e o resultado vem para 
	fsin ; calcula o seno de quem ta em st0
	fst qword[valorLido] ;como lerValor retornou float, ele fica em st0
	push dword[valorLido+4] ;push para salvar na pilha
	push dword[valorLido]
	call imprimir
	add esp, 4

	mov eax, 1
	mov ebx, 0
	int 80h
