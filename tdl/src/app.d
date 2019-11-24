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
	
//----prueba para el jugador.mover que no necesita delivery-----
	while( jugador.estaVivo() ){
		
		jugador.mover(mapa);
		mapa.imprimir();
	}
	writeln( jugador.estaVivo() );

//--------estas pruebas eran para el snake-----


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