module jugador.direccion.direccionDerecha;
import mapa.celda;
import mapa.coordenada;
import std.stdio;
import jugador.direccion.direccion;
import jugador.direccion.direccionIzquierda;

import jugador.direccion.AvanzoFueraDeRangoException;

 class DireccionDerecha :Direccion{
	 
	 public override Coordenada mover(Coordenada coordenadaPrevia){
	 	Coordenada retorno= coordenadaPrevia.copiar();
	 	int coordX = retorno.obtenerX();
	 	
	 	if(coordX < 19){
		 	
		 	retorno.sumarX(1);
		 } else {
		 	
		 	throw new AvanzoFueraDeRangoException("trate de avanzar fuera de rango");
		 } 
		 
	 	return retorno;
	 }
	 
	 public override Direccion rotar(DireccionIzquierda direccion){
	 	return this;
	 }
	 alias rotar=Direccion.rotar;
 }