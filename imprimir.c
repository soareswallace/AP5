#include <stdio.h>
#include <stdlib.h>

void imprimir(double valor){
	printf("O valor eh: %lf\n" , valor);
}
//essa funcao pode ser util na prova porque ela testa
//cuidado para nao por um inteiro na fpu. nao pode

float intparserfloat(int valor){
	float convertido;
	convertido = (float)valor;
	return convertido;
}

int pegan(){
	printf("Insira o numero que sera convertido para float\n");
	int num = 0;
	scanf(" %d", &num);
	return num;
}