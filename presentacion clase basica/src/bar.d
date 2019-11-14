module bar;
import std.stdio;
import foo;

class Bar : Foo {
	
	
	this(int a){
		super(2*a);
	}	 
	public override void imprimir(){
		writeln("A es:",a ," B es:",b);
	}

 }