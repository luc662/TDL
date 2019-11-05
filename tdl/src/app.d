import std.stdio;
import mapa.coordenada;
import mapa.celda;
import mapa.mapa;
import std.container : DList;

void main() {
	writeln("Hello World.");
	auto lista =DList!Coordenada();
	Coordenada coordA= new Coordenada(1,1);
	lista.insertFront(coordA);
	lista.front.imprimir();
}