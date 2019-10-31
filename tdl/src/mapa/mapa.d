module mapa.mapa;
import mapa.celda;
import mapa.colores.color;
import mapa.coordenada;
import mapa.colores.colorRojo;
import mapa.colores.colorVerde;
import std.stdio;
public class Mapa{
	private Celda[Coordenada] mapa;
	
	
	public this() {
        for(int i=0;i<20;i++){
	        for(int j=0;j<20;j++){
	        	Coordenada coord= new Coordenada(i,j);
	        	Celda celda= new Celda(coord);
	        	mapa[coord]= celda;
	        }	
        }
    }
	public void imprimir(){
		foreach (Coordenada coord,Celda  cell; mapa) {
			coord.imprimir();
			cell.imprimirColor();
			
		}
		writeln("tamanio:", mapa.length);
	}
	
}