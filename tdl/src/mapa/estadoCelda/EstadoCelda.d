module mapa.estadoCelda.estadoCelda;
import mapa.celda;
import std.stdio;

import jugador.ubicable.ubicable;
 public interface EstadoCelda{
	 
	 public EstadoCelda ubicar(Ubicable ubicable);
	 
 }