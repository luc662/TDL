import std.stdio;
import core.thread : Fiber;
void foo() {
    writeln("Hello");
    Fiber.yield();
    writeln("World");
}

void main() {
	auto f = new Fiber(&foo);
	f.call(); 
	writeln("de nuevo en el main");
	//f.call(); 

}