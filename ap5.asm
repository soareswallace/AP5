extern lerValor, lerDiferenca, imprimir, intTofloat, contador_eh_par
SECTION .data
	valorLido dq 0.0
	sin dq 0.0
	maxDiff dq 0.0
	contador dd 1
	factorial dq 0.0
SECTION .text
global main
main:
	call lerDiferenca
;	fstp qword[maxDiff]
	call lerValor ;chama a funcao ler valor, e o resultado vem para 
;	fsin ; calcula o seno de quem ta em st0
;	fst qword[sin] ;como lerValor retornou float, ele fica em st0
	mov ebx, [contador] ;ja passamos pela iteracao 0
	add ebx, 1 ;iteracao 1 comeca aqui

	calculo_do_fatorial:
		push ebx
		call contador_eh_par ;percebi o padrao. quando estamos na iteracao n impar
							;, o sinal eh negativo, se for par=positivo
		add esp, 4 ;como passamos um parametro, ajusta a pilha em 4bytes
		cmp eax, 1 ;como a funcao contador_eh_par retorno um int, ele eh salvo em eax
		je cont_par
		jmp cont_impar

		cont_par:


;to burro, como faco para fazer 2n+1, sendo n minha iteracao atual
		cont_impar:
			





	push dword[sin+4] ;push para salvar na pilha
	push dword[sin] ;
	call imprimir
	add esp, 4

	mov eax, 1
	mov ebx, 0
	int 80h
