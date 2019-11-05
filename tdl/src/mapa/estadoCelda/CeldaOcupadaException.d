module mapa.estadoCelda.CeldaOcupadaException;
import std.exception;

public class CeldaOcupadaException : Exception{
	this(string msg, string file = __FILE__, size_t line = __LINE__) {
        super(msg, file, line);
    }

}