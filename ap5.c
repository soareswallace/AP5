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

float intTofloat(int valor){
	float convertido;
	convertido = (float)valor;
	return convertido;
}
