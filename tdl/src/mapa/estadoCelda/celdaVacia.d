module mapa.estadoCelda.celdaVacia;
import mapa.estadoCelda.estadoCelda;
import mapa.celda;
import std.stdio;
import mapa.estadoCelda.celdaOcupada;
import jugador.ubicable.ubicable;
 public class CeldaVacia : EstadoCelda{
	 
	 public EstadoCelda ubicar(Ubicable ubicable){
	 	return new CeldaOcupada(ubicable);
	 }
	 public void imprimir(){
	 	write("_");
	 }
 }