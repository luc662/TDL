module mapa.CoordenadaInvalidaExeption;
import std.exception;

public class CoordenadaInvalidaExeption : Exception{
	this(string msg, string file = __FILE__, size_t line = __LINE__) {
        super(msg, file, line);
    }

}
