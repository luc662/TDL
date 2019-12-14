
// dmd sumaAsm.d -betterC -c -m32mscoff 

/*	el m32mscoff es para que el codigo objeto
	que se compila sea para windows de 32 bits,
	asique depende de la plataforma, el flag
	puede no ser necesario.
*/
extern (C) {

int sumarEnAsm(int a , int b){

	import core.stdc.stdio : printf;
	int rta;

	scope(exit) printf("saliendo\n");


	asm{
		mov	EAX , a[EBP]	;
		add EAX	, b[EBP]	;
		mov	rta , EAX		;
	}

	return rta;

}

}




























/*
extern (C) {

	int sumarEnAsm(int a , int b){

		import core.stdc.stdio : printf ;

		scope(exit) printf("sumando en D\n");
		int rta;
		asm{

			mov	EAX , a[EBP]	;
			add EAX	, b[EBP]	;
			mov	rta , EAX		;
		}
		return rta;
}

}
*/


























