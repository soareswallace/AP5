extern lerValor, lerDiferenca, imprimir, intTofloat, contador_eh_par, imprimir_resultado, debugger
SECTION .data
	valorLido dq 0.0
	maxDiff dq 0.0
	fator dq 3.0 ;fator = 2n+1
	fatorial dq 3.0
	angulo dq 0.0
	iteracao dd 0.0 ; iteracao = n
	aux dq 0.0;
	sin dq 0.0
	debug dq 0.0
	test_variable dq 0.0
SECTION .text
global main
main:
	call lerDiferenca
	fst qword[maxDiff]
	call lerValor ;chama a funcao ler valor, e o resultado vem para 
	fldz
	fadd st0, st1
	fsin ; calcula o seno de quem ta em st0
	fst qword[sin] ;como lerValor retornou float, ele fica em st0
	fxch st2
	fxch st1; top:x -> diff -> sin(x): bottom
	fst qword[angulo]
	xor ecx, ecx



	calculo_do_fatorial:
		inc ecx
		mov [iteracao], ecx
		push ecx
		call contador_eh_par ;percebi o padrao. quando estamos na iteracao n impar
							;, o sinal eh negativo, se for par=positivo
		add esp, 4 ;como passamos um parametro, ajusta a pilha em 4bytes
		cmp eax, 1 ;como a funcao contador_eh_par retorno um int, ele eh salvo em eax
		je cont_par_first
		jmp cont_impar_first

		cont_par_first:
			fld qword[fatorial] ;coloca a itercao no topo
			fld qword[angulo]
			fmul st0, st0 ; faco x*x
			fld1
			fld qword[fatorial]
			fsubrp st1, st0
			fst qword[fator]
			
			loop_par:
				fmulp st2, st0
				fld qword[angulo]
				fmulp st1, st0
				fld1
				fld qword[fator]
				fsubrp st1, st0
				fst qword[fator]
				fld1				
				fcomip st0, st1

				jz fim_contas_par
				jmp loop_par

		fim_contas_par:

			fmulp st2, st0
			fdivrp st1, st0 ;st0/st1 ultimo valor no topo
			fld qword[fatorial]
			fld1
			fld1
			faddp st1, st0
			faddp st1, st0
			fstp qword[fatorial]
			faddp st1, st0 ;atual resultado da serie aqui
			fldz
			fadd st0, st1
			fsub st0, st3;guarda a diferenca no topo
			fstp qword[test_variable]
			
			jmp comparar

		cont_impar_first:

			fld qword[fatorial] ;coloca a itercao no topo
			fld qword[angulo]
			fmul st0, st0 ; faco x*x
			fld1
			fld qword[fatorial]
			fsubrp st1, st0
			fst qword[fator]			

			loop_impar:
				fmulp st2, st0
				fld qword[angulo]
				fmulp st1, st0
				fld1
				fld qword[fator]
				fsubrp st1, st0
				fst qword[fator]
				fld1				
				fcomip st0, st1

				jz fim_contas_impar
				jmp loop_impar

		fim_contas_impar:
			fmulp st2, st0
			fdivrp st1, st0 ;st0/st1 ultimo valor no topo
			fld qword[fatorial]
			fld1
			fld1
			faddp st1, st0
			faddp st1, st0
			fstp qword[fatorial]
			fld1 ;carrego 1 no topo
			fld1
			fadd st0, st1
			fsubp st1, st0 ;coloquei -1 no topo => st1-st0
			fmulp st1, st0
			faddp st1, st0 ;atual resultado da serie aqui
			fldz
			fadd st0, st1
			fsubr st0, st3;guarda a diferenca no topo
			fstp qword[test_variable]
			
			jmp comparar

		comparar: ;ver se o erro eh aceitavel
			fld qword[test_variable]
			fldz
			fcomip st0, st1
			jl inverter_sinal
			jmp verificar_diferenca

			inverter_sinal:
				fld1
				fld1
				fadd st0, st1
				fsubp st1, st0
				fmulp st1, st0


			verificar_diferenca:

				fst qword[debug]
				push dword[debug+4]
				push dword[debug]
				call debugger
				add esp, 4
				;jmp fim

				mov ecx, [iteracao]
				fcomip st0, st2
				jle fim
				jmp calculo_do_fatorial

	fim:
	push dword[test_variable+4]
	push dword[test_variable]
	call imprimir_resultado
	add esp, 4

	mov eax, 1
	mov ebx, 0
	int 80h