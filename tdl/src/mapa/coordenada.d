module mapa.coordenada;
import std.stdio;
import mapa.coordenadaInvalidaException;
public class Coordenada{
	private size_t ejeX;
	private size_t ejeY;
	
	public this(size_t posicionX, size_t PosicionY) {
        ejeX = posicionX;
        ejeY = PosicionY;
    }
	override bool opEquals( Object o){
		  Coordenada coordenada = cast(Coordenada) o;
        return coordenada && ejeX == coordenada.ejeX && ejeY == coordenada.ejeY;
	}
	override size_t toHash(){
		//Cantor pairing function:
		return (ejeX + ejeY) * (ejeX + ejeY + 1) / 2 + ejeX;// where a, b >= 0
	}
	public void imprimir(){
		writeln('[',this.ejeX,',',this.ejeY,']');
	}
	public void sumarX(int valor){
		if( ejeX+valor<0){
			throw new CoordenadaInvalidaException("las coordenadas son siempre positivas");
		}
		ejeX+=valor;
	}
		public void sumarY(int valor){
		if( ejeY+valor<0){
			throw new CoordenadaInvalidaException("las coordenadas son siempre positivas");
		}
		ejeY+=valor;
	}
		public Coordenada copiar(){
			return new Coordenada(ejeX,ejeY);
		}
		
		public int obtenerX(){
			return cast(int)this.ejeX;
		}
		public int obtenerY(){
			return cast(int)this.ejeY;
		}
}
