module jugador.direccion.direccionDerecha;
import mapa.celda;
import mapa.coordenada;
import std.stdio;
import jugador.direccion.direccion;
import jugador.direccion.direccionIzquierda;
 class DireccionDerecha :Direccion{
	 
	 public override Coordenada mover(Coordenada coordenadaPrevia){
	 	Coordenada retorno= coordenadaPrevia.copiar();
	 	retorno.sumarX(1);
	 	return retorno;
	 }
	 
	 public override Direccion rotar(DireccionIzquierda direccion){
	 	return this;
	 }
	 alias rotar=Direccion.rotar;
 }