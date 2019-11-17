module mapa.coordenadaInvalidaException;
import std.exception;

public class CoordenadaInvalidaException : Exception{
	this(string msg, string file = __FILE__, size_t line = __LINE__) {
        super(msg, file, line);
    }

}
