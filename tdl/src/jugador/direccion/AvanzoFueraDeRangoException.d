module jugador.direccion.AvanzoFueraDeRangoException;

import std.exception;

public class AvanzoFueraDeRangoException : Exception{
	this(string msg, string file = __FILE__, size_t line = __LINE__) {
        super(msg, file, line);
    }

}