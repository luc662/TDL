module mapa.estadoCelda.celdaOcupada;
import mapa.estadoCelda.estadoCelda;
import jugador.ubicable.ubicable;
import mapa.estadoCelda.CeldaOcupadaException;
import mapa.estadoCelda.estadoCelda;
 public class CeldaOcupada :EstadoCelda{
	 private Ubicable ubicable;
	 
	 public this(Ubicable ubicable){
	 	this.ubicable=ubicable;
	 }
	 public EstadoCelda ubicar(Ubicable ubicable){
	 	throw new CeldaOcupadaException("celda ya ocupada");
	 }
	 public void imprimir(){
	 	ubicable.imprimir();
	 }
	 
 }