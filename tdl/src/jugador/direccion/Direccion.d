module jugador.direccion.direccion;
import mapa.celda;
import mapa.coordenada;
import jugador.direccion.direccionIzquierda;
import jugador.direccion.direccionDerecha;
import jugador.direccion.direccionArriba;
import jugador.direccion.direccionAbajo;
import std.stdio;
abstract class Direccion{
	 
	 public Coordenada mover(Coordenada coordenadaPrevia);
	 
	 public Direccion rotar(Direccion direccion){
	 	return direccion;
	 }
	 public Direccion rotar(DireccionDerecha direccion){
	 	return direccion;
	 }
	 public Direccion rotar(DireccionIzquierda direccion){
	 	return direccion;
	 }
	 public Direccion rotar(DireccionAbajo direccion){
	 	return direccion;
	 }
	 public Direccion rotar(DireccionArriba direccion){
	 	return direccion;
	 }
 }