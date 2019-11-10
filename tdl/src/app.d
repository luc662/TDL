import std.stdio;
import mapa.coordenada;
import mapa.celda;
import mapa.mapa;
import jugador.jugador;
import std.container : DList;

int main() {
	Mapa mapa=new Mapa();
	Jugador jugador= new Jugador(mapa);
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
	return 0;
}