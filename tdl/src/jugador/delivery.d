module jugador.delivery;

import std.random; 

//imports para la comida
import jugador.comida;
import jugador.ubicable.ubicable;

//imports para el mapa con coordenadas
import mapa.mapa;
import mapa.coordenada;
import mapa.coordenadaInvalidaException;


public class Delivery {
	
	private Comida comida;
		
	/*
		crea el objeto comida, que el jugador va a ir devorando,
		y lo ubica en algun casillero vacio.
		
	*/
	this(Mapa mapa){
		
		Coordenada destinoInicial = this.obtenerDestino(mapa);
		this.comida = new Comida(destinoInicial); 
		
		this.entregarComida(mapa);
	}
	
	/*
		le entrega la comida a una celda aleatoria que esta vacia.
		(( la idea es que se llame este metodo cada vez que el jugador 
			se come la comida, asi va quedando en lugares random))
	*/
	
	public void entregarComida(Mapa mapa){
		
		Coordenada destino = obtenerDestino(mapa);
		
		mapa.ubicar(destino, this.comida);	
	}
	
	
	/*
		Busca de manera Random un lugar vacio en el mapa, para que se pueda
		poner la comida ahi.
		
		IMPORTANTE!!! : si el mapa deja de ser de 20x20, hay que cambiar el rango de
						la funcion 'uniform' porque estan hardcodeados los valores.
	*/
	
	private Coordenada obtenerDestino(Mapa mapa){
		
		auto rng = Random(unpredictableSeed);
		
		size_t posX = uniform( 0 , 19 , rng );
		size_t posY = uniform( 0 , 19 , rng );
		
		//creo un par de coordenadas con posiciones aleatorias
		Coordenada nuevoDestino = new Coordenada(posX , posY);
		
		while( !mapa.estaVacia( nuevoDestino ) ){
			
			//si la celda con las coordenadas estaba ocupada, busco otra
			posX = uniform( 0 , 19 , rng );
			posY = uniform( 0 , 19 , rng );
				
			nuevoDestino.cambiarPosiciones(posX , posY);		
		}
		return nuevoDestino;
	}
	
	
}