import std.stdio;
import foo;
import bar;

void main() {
	Foo foo=new Foo(5);
	
	foo.imprimir();
	
	Foo bar=new Bar(5);
	bar.imprimir();
}