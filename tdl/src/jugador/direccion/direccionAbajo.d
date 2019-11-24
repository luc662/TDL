module jugador.direccion.direccionAbajo;
import mapa.celda;
import mapa.coordenada;
import std.stdio;
import jugador.direccion.direccion;
import jugador.direccion.direccionIzquierda;
import jugador.direccion.direccionArriba;
import jugador.direccion.direccionDerecha;

import jugador.direccion.AvanzoFueraDeRangoException;

 class DireccionAbajo :Direccion{
	 
	 public override Coordenada mover(Coordenada coordenadaPrevia){
	 	Coordenada retorno= coordenadaPrevia.copiar();
	 	int coordY = retorno.obtenerY();
	 	
	 	if(coordY < 19){
		 	
		 	retorno.sumarY(1);
		 } else {
		 	
		 	throw new AvanzoFueraDeRangoException("trate de avanzar fuera de rango");
		 }
	 	
	 	return retorno;
	 }
	 
	 public override Direccion rotar(DireccionArriba direccion){
	 	return this;
	 }
	 alias rotar=Direccion.rotar;
 }