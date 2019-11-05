module jugador.ubicable.ubicable;
import mapa.celda;
import mapa.mapa;
import mapa.coordenada;
import std.stdio;
 public abstract class Ubicable{
	 private Coordenada posicion;
	 this(Coordenada coordenada){
	 	posicion=coordenada;
	 }
	 public void ubicar(Mapa mapa){
	 	mapa.ubicar(posicion, this);
	 	
	 }
	 public void imprimir();
	 public void mover(Mapa mapa, Coordenada coordenada){
	 	//TODO
	 }
 }