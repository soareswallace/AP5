extern lerValor, lerDiferenca, imprimir, intTofloat, contador_eh_par
SECTION .data
	valorLido dq 0.0
	maxDiff dq 0.0
	fator dd 1 ;fator = 2n+1
	angulo dq 0.0
	iteracao dd 0 ; iteracao = n
	aux dd 0;
	sin dq 0.0
SECTION .text
global main
main:
	call lerDiferenca
	fstp qword[maxDiff]
	call lerValor ;chama a funcao ler valor, e o resultado vem para 
	fldz
	fadd st0, st1
	fsin ; calcula o seno de quem ta em st0
	fst qword[sin] ;como lerValor retornou float, ele fica em st0
	fxch st2
	fxch st1; top:x -> diff -> sin(x): bottom
	fst qword[angulo]
	xor ebx, ebx
	add ebx, 3 ;iteracao 1 comeca aqui, setamos isso para comecar 2n+1
	mov [fator], ebx ;ja passamos pela iteracao 0, ebx = 2n+1
	xor ecx, ecx
	add ecx, 1
	mov [iteracao], ecx

	calculo_do_fatorial:
		push ecx
		call contador_eh_par ;percebi o padrao. quando estamos na iteracao n impar
							;, o sinal eh negativo, se for par=positivo
		add esp, 4 ;como passamos um parametro, ajusta a pilha em 4bytes
		cmp eax, 1 ;como a funcao contador_eh_par retorno um int, ele eh salvo em eax
		je cont_par
		jmp cont_impar

		cont_par:
			fld dword[fator] ;coloca a itercao no topo
			fld qword[angulo]
			fmul st0, st0 ; faco x*x
			xor ecx, ecx
			mov ecx, [fator]
			dec ecx
			mov [aux], ecx
			fld dword[aux]
			fmulp st2, st0
			loop_par:
				fld dword[angulo]
				fmulp st1, st0
				dec ecx
				mov [aux], ecx
				fld dword[aux]
				fmulp st2, st0
				cmp ecx, 1
				je fim_contas_par
				jmp loop_par

			fim_contas_par:
				add ebx, 2
				mov [fator], ebx
				mov ecx, [iteracao]
				inc ecx
				mov [iteracao], ecx
				fdivrp st1, st0 ;ultimo valor no topo




;to burro, como faco para fazer 2n+1, sendo n minha iteracao atual
		cont_impar_first:
			fld dword[fator] ;coloca a itercao no topo
			fld qword[angulo]
			fmul st0, st0 ; faco x*x
			xor ecx, ecx
			mov ecx, [fator]
			dec ecx
			mov [aux], ecx
			fld dword[aux]
			fmulp st2, st0 ;comeco o fatorial

			loop_impar:
				fld qword[angulo]
				fmulp st1, st0
				dec ecx
				mov [aux], ecx
				fld dword[aux]
				fmulp st2, st0
				cmp ecx, 1
				je fim_contas_impar
				jmp loop_impar

		fim_contas_impar:
			add ebx, 2 ;ja reajusta 2n+1 para a prox iteracao
			mov [fator], ebx
			mov ecx, [iteracao] 
			inc ecx
			mov [iteracao], ecx;ja manda para memoria para checagem par/impar
			fdivrp st1, st0 ;st0/st1 ultimo valor no topo
			fld1 ;carrego 1 no topo
			fld1
			fadd st0, st1
			fsubp st1, st0 ;coloquei -1 no topo => st1-st0
			fmulp st1, st0
			faddp st1, st0 ;atual resultado da serie aqui

		comparar: ;ver se o erro eh aceitavel
			





	push dword[sin+4] ;push para salvar na pilha
	push dword[sin] ;
	call imprimir
	add esp, 4

	mov eax, 1
	mov ebx, 0
	int 80h
