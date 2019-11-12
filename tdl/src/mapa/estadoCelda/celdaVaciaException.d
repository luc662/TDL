module mapa.estadoCelda.CeldaVaciaException;
import std.exception;

public class CeldaVaciaException : Exception{
	this(string msg, string file = __FILE__, size_t line = __LINE__) {
        super(msg, file, line);
    }

}