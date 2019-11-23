module mapa.mapa;
import mapa.celda;
import mapa.coordenada;
import jugador.ubicable.ubicable;
import std.stdio;

public class Mapa{
	
	private Celda[Coordenada] mapa;
	private Coordenada direccionComida;
	
	public this() {
        for(int i=0;i<20;i++){
	        for(int j=0;j<20;j++){
	        	Coordenada coord= new Coordenada(i,j);
	        	Celda celda= new Celda(coord);
	        	mapa[coord]= celda;
	        }	
        }
        //como todavia no se puso la comida, inicializo en 0,0
        this.direccionComida = new Coordenada(0,0);
    }

	public void ubicar(Coordenada posicion, Ubicable elemento){
		Celda aux=mapa[posicion];
		aux.ubicar(elemento);
	}
	public void vaciar(Coordenada posicion){
		Celda aux=mapa[posicion];
		aux.vaciar();
	}
	public void imprimir(){
		for(int i=0;i<20;i++){
	        for(int j=0;j<20;j++){
	        	Coordenada coord= new Coordenada(j,i);
	        	
	        	auto aux=mapa[coord];
	        	aux.imprimir();
	        }
	        writeln("");	
        }	
	}
	
	/*
		se usa para colocar la comida en el mapa, ademas de ubicarla guarda
		las coordenadas en el atributo direccionComida, asi ya le queda para
		cuando haya que buscar la comida
	*/
	public void ubicarComida(Coordenada posicion, Ubicable elemento){
		
		this.ubicar(posicion, elemento);
		
		this.direccionComida = posicion;	
	}
	
	
	// devuelve 'true' si la celda correspondiente a la posicionBuscada
	// esta vacia
	public bool estaVacia(Coordenada posicionBuscada){
		
		auto celdaBuscada = this.mapa[posicionBuscada];
		
		return celdaBuscada.estaVacia(); 
	}
	
	//devuelve 'true' si la celda correspondiente a las coordenadas
	//buscadas tiene comida
	public bool tieneComidaEn(Coordenada posicionBuscada){
		
		Celda celdaBuscada = this.mapa[posicionBuscada];
		
		return celdaBuscada.tieneComida();
	}
	
	//PRE:haber llamado al metodo 'ubicarComida' por lo menos una vez
	//POST:devuelve las coordenadas de la celda que tiene la comida
	public Coordenada getDireccionComida(){
		
		return this.direccionComida;
	}
}