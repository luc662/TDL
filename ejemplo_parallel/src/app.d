import std.stdio;
import core.thread;
import std.parallelism;
import std.concurrency;


class Worker{
      int id;
      this(int id){
        this.id = id;
      }
      void work(){
       
        writeln(id, " : ", thisTid);
        writeln("Thread ", id, " empieza");
        Thread.sleep(1.seconds);
        writeln("Thread ", id, " termina");
      }
}

void main() {
	auto workers = [new Worker(0), new Worker(1),
    new Worker(2)];
	foreach(w; parallel(workers)){
      w.work();
	}
}