module foo;
import std.stdio;

class Foo {
	protected int a;
	protected int b;
	
	this(int a){
		this.a=a;
		b=2*a;
	}	 
	public void imprimir(){
		writeln("a es:",a ," b es:",b);
	}

 }





