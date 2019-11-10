module jugador.ubicable.ubicable;
import mapa.celda;
import mapa.mapa;
import mapa.coordenada;
import std.stdio;
 public abstract class Ubicable{
	 protected Coordenada posicion;
	 this(Coordenada coordenada){
	 	posicion=coordenada;
	 }
	 public void ubicar(Mapa mapa){
	 	mapa.ubicar(posicion, this);
	 	
	 }
	 public void vaciar(Mapa mapa){
	 	mapa.vaciar(posicion);
	 	
	 }
	 public void imprimir();
	 
	 public void mover(Mapa mapa, Coordenada coordenada){
	 	mapa.ubicar(coordenada, this);
	 	mapa.vaciar(posicion);
	 	posicion=coordenada;
	 }
	 public Coordenada getPosicion(){
	 	return posicion;
	 }

 }