module jugador.ubicable.cabeza;
import mapa.celda;
import std.stdio;
import mapa.coordenada;
import jugador.ubicable.ubicable;
 public class Cabeza: Ubicable{
	 
	 this(Coordenada coordenada){
	 	super(coordenada);
	 }
	 
	 public override void imprimir(){
	 	write('C');
	 }
 }