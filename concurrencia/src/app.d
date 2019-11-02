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

  
static void f(string msg)
{
	writeln(msg);
	Thread.sleep(3.seconds);
    writeln(msg); // "Hello World"
   
}
static void f2(string msg)
{
	Thread.sleep(4.seconds);
    writeln(msg); // "Hello World"

}

void main() { 
	auto foo1=spawn(&f2, "bye World");
	
    auto foo2=spawn(&f, "Hello World");
}