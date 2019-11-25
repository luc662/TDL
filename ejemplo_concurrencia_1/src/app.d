import std.stdio;
import std.concurrency;
import core.thread;

void f(string msg){
    writeln(msg);
    writeln("thread id: ", thisTid);
    Thread.sleep(5.seconds);
    writeln("fin de thread");
}

void main() {
	auto tid = spawn(&f, "Hello World");
	auto tid2 = spawn(&f, "Hello World");
}





