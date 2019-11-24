module jugador.direccion.direccionIzquierda;
import mapa.celda;
import mapa.coordenada;
import std.stdio;
import jugador.direccion.direccion;
import jugador.direccion.direccionDerecha;

import jugador.direccion.AvanzoFueraDeRangoException;

 class DireccionIzquierda :Direccion{
	 
	 public override Coordenada mover(Coordenada coordenadaPrevia){
	 	Coordenada retorno= coordenadaPrevia.copiar();
	 	int coordX = retorno.obtenerX();
	 	
	 	if(coordX > 0){
		 	
		 	retorno.sumarX(-1);
		 } else {
	
		 	throw new AvanzoFueraDeRangoException("trate de avanzar fuera de rango");
		 } 

	 	return retorno;
	 }
	 
	 public override Direccion rotar(DireccionDerecha direccion){
	 	return this;
	 }
	 alias rotar=Direccion.rotar;
 }