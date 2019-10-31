module mapa.coordenada;
import std.stdio;
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
		
	
}