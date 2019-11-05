module jugador.jugador;
import std.container : DList;
import mapa.celda;
import mapa.mapa;
import std.stdio;
import jugador.direccion.direccion;
import jugador.direccion.direccionDerecha;
import jugador.direccion.direccionIzquierda;
import jugador.direccion.direccionArriba;
import jugador.direccion.direccionAbajo;
import jugador.ubicable.cabeza;
import mapa.coordenada;
 public class Jugador{
	 private int tamanio;
	 private Cabeza cabeza;
	 private DList!Coordenada cuerpo;
	 private Direccion direccion;
	 
	 this(Mapa mapa){
	 	tamanio=5;
	 	cabeza=new Cabeza(new Coordenada(3,3));
	 	direccion=new DireccionDerecha();
	 	cabeza.ubicar(mapa);
	 }
	 
	 
 }