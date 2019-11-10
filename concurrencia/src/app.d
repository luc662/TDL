import std.concurrency : receiveOnly, send,
    spawn, Tid, thisTid;
import core.atomic : atomicOp, atomicLoad;
import core.thread;
import std.stdio;

/*
Queue that can be used safely among
different threads. All access to an
instance is automatically locked thanks to
synchronized keyword.
*/
synchronized class SafeQueue(T)
{
    // Note: must be private in synchronized
    // classes otherwise D complains.
    private T[] elements;

    void push(T value) {
        elements ~= value;
    }

    /// Return T.init if queue empty
    T pop() {
        import std.array : empty;
        T value;
        if (elements.empty)
            return value;
        value = elements[0];
        elements = elements[1 .. $];
        return value;
    }
}

/*
Safely print messages independent of
number of concurrent threads.
Note that variadic parameters are used
for args! That is args might be 0 .. N
parameters.
*/
void safePrint(T...)(T args)
{
    // Just executed by one concurrently
    synchronized {
        import std.stdio : writeln;
        writeln(args);
    }
}

void threadProducer(shared(SafeQueue!int) queue,
    shared(int)* queueCounter,int productor)
{
    import std.range : iota;
    // Push values 1 to 11
    foreach (i; iota(1,11)) {
        queue.push(i);
        safePrint("Pushed ", i," producido por:",productor);
        atomicOp!"+="(*queueCounter, 1);
        Thread.sleep(2.seconds);
        
    }
    
}

void threadConsumer(Tid owner,
    shared(SafeQueue!int) queue,
    shared(int)* queueCounter,int consumidor)
{
    int popped = 0;
    while (popped != 10) {
        auto i = queue.pop();
        if (i == int.init)
            continue;
        ++popped;
        // safely fetch current value of
        // queueCounter using atomicLoad
        safePrint("Popped ", i,
            " (Consumer pushed ",
            atomicLoad(*queueCounter), ")", " consumido por:", consumidor);
        Thread.sleep(1.seconds);
    }

    // I'm done!
    owner.send(true);
}

void main()
{
    auto queue = new shared(SafeQueue!int);
    shared int counter = 0;
    spawn(&threadProducer, queue, &counter,1);
    spawn(&threadProducer, queue, &counter,2);
    auto consumer1 = spawn(&threadConsumer,
                    thisTid, queue, &counter,4);
    auto consumer2 = spawn(&threadConsumer,
                    thisTid, queue, &counter,6);
    auto stopped = receiveOnly!bool;
    assert(stopped);
}