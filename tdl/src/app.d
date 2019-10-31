import std.stdio;
import mapa.coordenada;
import mapa.celda;
import mapa.mapa;
import mapa.colores.colorRojo;
void main() {
	writeln("Hello World.");
	Coordenada coordA= new Coordenada(1,1);
	Celda celda =new Celda(coordA);
	celda.imprimirColor();
	ColorRojo rojo= new ColorRojo();
	celda.pintar(rojo);
	celda.imprimirColor();
	Mapa mapa =new Mapa();
	mapa.imprimir();
}