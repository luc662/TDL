module jugador.comida;

import std.stdio : write;

import jugador.ubicable.ubicable;
import mapa.coordenada;
import mapa.celda;


public class Comida : Ubicable {
	
	this (Coordenada coordenada){
		
		super (coordenada);
	}
	
	override public void imprimir(){
		
		write("F");
	}
	
	override public bool esComida(){
		
		return true;
	}
}