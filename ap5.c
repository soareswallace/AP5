#include <stdio.h>
#include <stdlib.h>

float lerValor(){
	float seno = 0;
	printf("Digite o valor do seno que voce quer achar\n");
	scanf(" %f", &seno);
	return seno;
}
float lerDiferenca(){
	float diferenca = 0;
	printf("Digite o valor da maxima diferenca entre o fsin e a Serie de Taylo\n");
	scanf(" %f", &diferenca);
	return diferenca;
}

void imprimir(double valor){
	printf("O valor do seno e: %lf\n" , valor);
}

void debugger(double valor){
	printf("DEBUG: %lf\n" , valor);
}

void imprimir_resultado(double valor){
	printf("A diferenca eh: %lf\n" , valor);
}

float intTofloat(int valor){
	float convertido;
	convertido = (float)valor;
	return convertido;
}

int contador_eh_par(int contador){
	if(contador%2==0){
		printf("Numero eh par: %d\n", contador);
		return 1;
	}
	else{
		printf("Numero eh impar: %d\n", contador);
		return 0;
	}
}
