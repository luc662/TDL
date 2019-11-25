import std.stdio;
import core.thread;
void foo() {
    writeln("Hello");
    Thread.sleep(50.msecs);
    Fiber.yield();
    writeln("Hello");
    Thread.sleep(50.msecs);
    Fiber.yield();
    writeln("Hello");
    Thread.sleep(50.msecs);
    Fiber.yield();
    writeln("Hello");
    Thread.sleep(50.msecs);
    Fiber.yield();
    writeln("Hello");
    Thread.sleep(50.msecs);
    Fiber.yield();
    writeln("Hello");
    Thread.sleep(50.msecs);
    Fiber.yield();
    writeln("Hello");
    Thread.sleep(50.msecs);
    Fiber.yield();
    writeln("Hello");
    Thread.sleep(50.msecs);
    Fiber.yield();
    writeln("Hello");
    Thread.sleep(50.msecs);
    Fiber.yield();
    writeln("Hello");
    Thread.sleep(50.msecs);
    Fiber.yield();
    Thread.sleep(50.msecs);
    writeln("World");
}

void main() {
	auto f = new Fiber(&foo);
	while(f.state != Fiber.State.TERM){
		f.call(); 
		writeln("de nuevo en el main");
	}
	
	
	//f.call(); 

}