module mapa.celda;
import mapa.colores.color;
import mapa.coordenada;
import mapa.colores.colorRojo;
import mapa.colores.colorVerde;
public class Celda{
	private Coordenada coordenada;
	private Color color;//solo para testear algo
	
	public this(Coordenada coordenda) {
        this.coordenada=coordenada;
        color= new ColorVerde();
    }
	
	public void pintar(Color color){
		this.color=color;
	}
	public void imprimirColor(){
		color.imprimir();
	}
}