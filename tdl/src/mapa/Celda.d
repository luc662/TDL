module mapa.celda;
import mapa.colores.color;
import mapa.coordenada;
import mapa.colores.colorRojo;
import mapa.colores.colorVerde;
import mapa.estadoCelda.estadoCelda;
import mapa.estadoCelda.celdaVacia;
import jugador.ubicable.ubicable;

public class Celda{
	private Coordenada coordenada;
	private Color color;//solo para testear algo
	private EstadoCelda estado;
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
	public void ubicar(Ubicable elemento){
		estado= estado.ubicar(elemento);
	}
	public void vaciar(){
		estado =new CeldaVacia();
	}
}