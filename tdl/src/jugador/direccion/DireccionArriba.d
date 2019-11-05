module jugador.direccion.direccionArriba;
import mapa.celda;
import mapa.coordenada;
import std.stdio;
import jugador.direccion.direccion;
import jugador.direccion.direccionIzquierda;
import jugador.direccion.direccionAbajo;
import jugador.direccion.direccionDerecha;
class DireccionArriba : Direccion{
	 
	 public override Coordenada mover(Coordenada coordenadaPrevia){
	 	Coordenada retorno= coordenadaPrevia.copiar();
	 	retorno.sumarY(-1);
	 	return retorno;
	 }
	 
	  public override Direccion rotar(DireccionAbajo direccion){
	 	return this;
	 }
	  alias rotar=Direccion.rotar;

 }