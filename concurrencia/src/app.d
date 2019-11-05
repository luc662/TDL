 import std.stdio;
import std.conv;
import std.math;
import std.random;
import std.datetime;
import std.algorithm;
import std.array;
import std.string;
import std.format;
import std.typecons : No;
import std.typecons;
import std.range : chain;
import std.file;
import core.thread;
import std.parallelism;
import std.concurrency;
import std.range;
 
synchronized shared class Worker{
     private int id;
     private string mensaje;
      this(int id){
        this.id = id;
        mensaje="iniciado";
      }
      shared void work(){
        // Get thread id
        writeln("Thread ", id, " starts");
        Thread.sleep(id.seconds);
        mensaje="trabajando";
        writeln("Thread ", id, " ends");
        Thread.sleep(id.seconds);
        mensaje="finalizado";
      }
     shared  void print(){
      	writeln(mensaje);
      }
 }
 

  

void foo() {
    writeln("Hello");
    Fiber.yield();
    writeln("World");
    Fiber.yield();
    int valor=4;
    Fiber.yield();
}
// ...
void main(){
	auto f = new Fiber(&foo);
	f.call(); // Prints Hello
	f.call(); // Prints World	
	f.call(); // Prints World	
}
