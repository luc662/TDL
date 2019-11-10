module jugador.ubicable.cuerpo;
import mapa.celda;
import std.stdio;
import mapa.coordenada;
import jugador.ubicable.ubicable;
 public class Cuerpo: Ubicable{
	 
	 this(Coordenada coordenada){
	 	super(coordenada);
	 }
	 
	 public override void imprimir(){
	 	write('O');
	 }
 }