module mapa.colores.colorVerde;
import mapa.celda;
import mapa.colores.color;
import std.stdio;
 public class ColorVerde : Color{
	 
	 public void pintar(Celda celda){
	 	celda.pintar(this);
	 }
	 	 public void imprimir(){
	 	 writeln("verde");
	 }
 }