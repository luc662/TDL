module jugador.jugador;
import std.container : DList;
import mapa.celda;
import mapa.mapa;
import std.stdio;
import jugador.direccion.direccion;
import jugador.direccion.direccionDerecha;
import jugador.direccion.direccionIzquierda;
import jugador.direccion.direccionArriba;
import jugador.direccion.direccionAbajo;
import jugador.ubicable.cabeza;
import jugador.ubicable.cuerpo;
import jugador.delivery;
import std.range;
import mapa.coordenada;
import std.algorithm;
 public class Jugador{
	 private int tamanio;
	 private Cabeza cabeza;
	 private DList!Cuerpo cuerpo;
	 private Direccion direccion;
	 private Direccion direccionPrevia;
	 this(Mapa mapa){
	 	tamanio=5;
	 	cabeza=new Cabeza(new Coordenada(3,3));
	 	direccion=new DireccionDerecha();
	 	direccionPrevia= new DireccionDerecha();
	 	cabeza.ubicar(mapa);
	 }
	 public DList!Coordenada mover(Mapa mapa, Delivery delivery){
	 	DList!Coordenada retorno;
	 	Coordenada posCabezaVieja=cabeza.getPosicion();
	 	Coordenada nuevaPosCabeza=direccion.mover(cabeza.getPosicion());
	 	retorno.insertBack(nuevaPosCabeza);

//---- esta parte es la que funcionari como el "comer"----	 	
	 	if( mapa.tieneComidaEn(nuevaPosCabeza) ){
	 		this.tamanio++;
	 		mapa.vaciar(nuevaPosCabeza);
	 		delivery.entregarComida(mapa);
	 	}
//-------------------------------------------------------- 	
	 	
	 	//retorno.insertBack(cabeza.getPosicion());
	 	if(contarCuerpo()>=tamanio){
	 		Cuerpo ultimo =cuerpo.back();
	 		//retorno.insertBack(ultimo.getPosicion());
	 		ultimo.vaciar(mapa);
	 		cuerpo.removeBack();
	 	}

	 	Cuerpo nuevoCuerpo=new Cuerpo(posCabezaVieja);
	 	
	 	cabeza.mover(mapa,nuevaPosCabeza);
	 	nuevoCuerpo.ubicar(mapa);
	 	
	 	cuerpo.insertFront(nuevoCuerpo);
		foreach (Cuerpo c; cuerpo) {
		    retorno.insertBack(c.getPosicion());
		} 
		direccionPrevia = direccion;
		
	 	return retorno;
	 }
	 //la lista por defecto no tiene un contar, ni un lenght de estos
	 private int contarCuerpo(){
	 	int i=0;
	 	foreach (Cuerpo c; cuerpo) {
		    i++;
		}
	 	return i;
	 }
	 public void rotarIzquierda(){
	 	auto aux_direccion = new DireccionIzquierda();
	 	direccion=direccionPrevia.rotar(aux_direccion);
	 }
	 public void rotarDerecha(){
	 	auto aux_direccion = new DireccionDerecha();
	 	direccion=direccionPrevia.rotar(aux_direccion);
	 }
	public void rotarArriba(){
	 	auto aux_direccion = new DireccionArriba();
	 	direccion=direccionPrevia.rotar(aux_direccion);
	 }
	 public void rotarAbajo(){
	 	auto aux_direccion = new DireccionAbajo();
	 	direccion=direccionPrevia.rotar(aux_direccion);
	 }	
	public void printsize(){
		writeln("longitud del cuerpo:", contarCuerpo());
	}
 }
