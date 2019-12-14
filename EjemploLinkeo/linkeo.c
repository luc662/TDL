#include <stdio.h>


int sumarEnAsm(int a , int b);



int main(){

	int numero1 = 10;

	int numero2 = 87;

	printf("vamos a sumar Los numeros\n");

	int suma = sumarEnAsm(numero1, numero2);

	printf("La suma dio: %d\n",suma );

	return 0;
}






// gcc linkeo.c sumaAsm.obj -o linkeado