module mapa.colores.colorRojo;
import mapa.celda;
import mapa.colores.color;
import std.stdio;
 public class ColorRojo : Color{
	 
	 public void pintar(Celda celda){
	 	celda.pintar(this);
	 }
	 public void imprimir(){
	 	 writeln("rojo");
	 }
 }