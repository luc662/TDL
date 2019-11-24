import std.stdio;
import mapa.coordenada;
import mapa.mapa;
import jugador.jugador;
import std.container : DList;
import jugador.delivery;
int main() {
	Mapa mapa=new Mapa();
	Jugador jugador= new Jugador(mapa);
	Delivery delivery = new Delivery(mapa);
	
	mapa.imprimir();
	
	jugador.mover(mapa, delivery);
	mapa.imprimir();	
	jugador.mover(mapa, delivery);
	mapa.imprimir();
		
	jugador.rotarAbajo();
	jugador.mover(mapa, delivery);
	mapa.imprimir();
	
	jugador.rotarIzquierda();
	jugador.mover(mapa, delivery);
	mapa.imprimir();
	
	jugador.rotarArriba();
	jugador.mover(mapa, delivery);
	writeln(jugador.estaVivo());	
	mapa.imprimir();
	
	jugador.mover(mapa, delivery);
	mapa.imprimir();
	
	writeln(jugador.estaVivo());
//	while( jugador.estaVivo() ){
//		
//		jugador.mover(mapa , delivery);
//		mapa.imprimir();
//	}
//	jugador.mover(mapa , delivery);
//	mapa.imprimir();
//	jugador.mover(mapa , delivery);
//	mapa.imprimir();
//	jugador.mover(mapa , delivery);
//	mapa.imprimir();
//	jugador.mover(mapa , delivery);
//	mapa.imprimir();
//	jugador.rotarAbajo();
//	
//	jugador.mover(mapa , delivery);
//	mapa.imprimir();
//	jugador.mover(mapa , delivery);
//	mapa.imprimir();
	return 0;
}