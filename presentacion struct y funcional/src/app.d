import std.stdio;
int global = 10;
struct Foo{
	 int a;
	 int b;
}
public void imprimir(Foo foo) pure{
	//debug es necesario para hacer writeln pure
	foo.b=28;
	debug writeln("a es:",foo.a ," b es:",foo.b);
}

void main() {
	Foo foo;
	foo.a=6;
	foo.b=26;
	
	imprimir(foo);
	
}






/*
//structed
import std.stdio;

struct Foo {
	int a;
	int b;
}	 
public void imprimir(Foo foo) pure{
	//debug es necesario para hacer writeln pure
	debug writeln("a es:",foo.a ," b es:",foo.b);
}

void main() {
	Foo foo;
	foo.a=6;
	foo.b=26;
	imprimir(foo);
}
*/