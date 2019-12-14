/*	selective import: solo importo la funcion writeln, en vez de importar
	la biblioteca std entera.
	renamed import: le cambio el nombre a las funciones que importo
	en este caso "writeln" pasa a llamarse "escribir"
*/
import std.stdio : escribir = writeln ;

void main() {

	int nro1 = 80_000;		//puedo poner los '_' para agregar legibilidad

	int nro2 = 1_500;

	escribir("numero 1 :", nro1);
	escribir("numero 2 : ", nro2);


	auto suma = nro1.sumarEnAsm(nro2);  //llamo una funcion "suelta" como si fuese member function

	escribir("el resultado es: ", suma);	
}


int sumarEnAsm(int a , int b){

	int rta;

	scope(exit) escribir("saliendo");

	scope(success){
		escribir("esta todo OK");
		escribir();
	}

	scope(failure) escribir("salio todo mal");
	
	asm{
		mov	EAX , a[EBP]	;
		add EAX	, b[EBP]	;
		mov	rta , EAX		;
	}

	return rta;

}
//  UFCS
// scope Guards
// selective y renamed imports


/*
		mov	EAX , a[EBP]	;
		add EAX	, b[EBP]	;
		mov	rta , EAX		;
*/