module jugador.direccion.direccionAbajo;
import mapa.celda;
import mapa.coordenada;
import std.stdio;
import jugador.direccion.direccion;
import jugador.direccion.direccionIzquierda;
import jugador.direccion.direccionArriba;
import jugador.direccion.direccionDerecha;
 class DireccionAbajo :Direccion{
	 
	 public override Coordenada mover(Coordenada coordenadaPrevia){
	 	Coordenada retorno= coordenadaPrevia.copiar();
	 	retorno.sumarY(-1);
	 	return retorno;
	 }
	 
	 public override Direccion rotar(DireccionArriba direccion){
	 	return this;
	 }
	 alias rotar=Direccion.rotar;
 }