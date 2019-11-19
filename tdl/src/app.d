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
	jugador.mover(mapa);
	mapa.imprimir();
	jugador.mover(mapa);
	mapa.imprimir();
	jugador.mover(mapa);
	mapa.imprimir();
	jugador.mover(mapa);
	mapa.imprimir();
	jugador.mover(mapa);
	mapa.imprimir();
	jugador.rotarAbajo();
	
	jugador.mover(mapa);
	mapa.imprimir();
	jugador.mover(mapa);
	mapa.imprimir();
	return 0;
}