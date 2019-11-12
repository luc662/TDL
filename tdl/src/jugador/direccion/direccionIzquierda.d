module jugador.direccion.direccionIzquierda;
import mapa.celda;
import mapa.coordenada;
import std.stdio;
import jugador.direccion.direccion;
import jugador.direccion.direccionDerecha;
 class DireccionIzquierda :Direccion{
	 
	 public override Coordenada mover(Coordenada coordenadaPrevia){
	 	Coordenada retorno= coordenadaPrevia.copiar();
	 	retorno.sumarX(-1);
	 	return retorno;
	 }
	 
	 public override Direccion rotar(DireccionDerecha direccion){
	 	return this;
	 }
	 alias rotar=Direccion.rotar;
 }