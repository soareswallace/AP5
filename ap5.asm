extern lerValor, lerDiferenca, imprimir, intTofloat
SECTION .data
	valorLido dq 0.0
	seno dq 0.0
	maxDiff dq 0.0
	contador dd 0
SECTION .text
global main
main:
	call lerDiferenca
	fstp qword[maxDiff]
	call lerValor ;chama a funcao ler valor, e o resultado vem para 
	fsin ; calcula o seno de quem ta em st0
	fst qword[seno] ;como lerValor retornou float, ele fica em st0
	push dword[seno+4] ;push para salvar na pilha
	push dword[seno] ;
	call imprimir
	add esp, 4

	mov eax, 1
	mov ebx, 0
	int 80h
