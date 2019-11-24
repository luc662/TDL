module mapa.celda;


import mapa.coordenada;

import mapa.estadoCelda.estadoCelda;
import mapa.estadoCelda.celdaVacia;
import jugador.ubicable.ubicable;

public class Celda{
	private Coordenada coordenada;
	private EstadoCelda estado;
	public this(Coordenada coordenda) {
        this.coordenada=coordenada;
        
        estado= new CeldaVacia();
    }
	
	public void ubicar(Ubicable elemento){
		estado= estado.ubicar(elemento);
	}
	public void vaciar(){
		estado =new CeldaVacia();
	}
	public void imprimir(){
		estado.imprimir();
	}
	
	
	//devuelve 'true' si la celda esta en estado 'vacio'
	public bool estaVacia(){
		
		return estado.esVacio();
	}
	
	public bool tieneComida(){
		
		return estado.tieneComida();
	}
}