import gtk.MainWindow;
import gtk.Label;
import gtk.Main;

import gtk.VBox;
import gtk.MenuBar;
import gtk.MenuItem;
import gtk.Button;
import gdk.Event;
import gtk.Widget;

import cairo.Context;
import gtk.DrawingArea;
import glib.Timeout;
import gdk.Keysyms;

import std.stdio:writeln;
import std.functional:toDelegate;

import mapa.mapa;
import jugador.jugador;
import jugador.delivery;
import jugador.comida;
import std.container : DList;

class QuitButton : Button{
    this(in string text){
        super(text);
        modifyFont("Arial", 10);
        addOnButtonRelease(&quit);
    }
   
    private bool quit(Event event, Widget widget){
        Main.quit();
        return true;
    }
}

class IniciarSnakeButton : Button{
	private MainWindow menuSnake;
	
	this(MainWindow menuSnake){
		super("Iniciar Snake");
		modifyFont("Arial", 10);
		this.menuSnake = menuSnake;
		addOnButtonRelease(&iniciar);
	}
	
	bool iniciar(Event event, Widget widget){
		MainWindow ventanaSnake = new MainWindow("Snake v0.1.3");
		ventanaSnake.setDefaultSize(400, 400);
		Tablero tablero = new Tablero();
		
		auto teclas = toDelegate(tablero.obtenerControlador());
		ventanaSnake.addOnKeyPress(teclas);
		ventanaSnake.add(tablero);
		this.menuSnake.close();
		ventanaSnake.showAll();
		return true;
	}
}



void main(string[] args){
    Main.init(args);
    MainWindow ventanaMenu = new MainWindow("Snake Menu");
    ventanaMenu.setDefaultSize(400, 400);
  
    MenuBar menuBar = new MenuBar();
    MenuItem fileMenuItem = new MenuItem("Menu");
	menuBar.append(fileMenuItem);
 
    VBox vb = new VBox(false, 10);
    vb.packStart(menuBar, false, false, 0);
    
	Label mensajeBienvenida = new Label("Hola bienvenidos al projecto integrador!");
	vb.packStart(mensajeBienvenida,false,false,10);
	IniciarSnakeButton iniciarSnakeButton = new IniciarSnakeButton(ventanaMenu);
	vb.packStart(iniciarSnakeButton,false,false,10);
	QuitButton quitButton = new QuitButton("Salir");
	vb.packStart(quitButton,false,false,0);
	
    ventanaMenu.add(vb);
	ventanaMenu.showAll();
    Main.run();
}


public class Tablero: DrawingArea{
	
	Timeout m_timeout;
	Mapa mapa;
	Jugador jugador;
	Delivery delivery;
	
	this(){
		this.mapa= new Mapa();
		this.jugador = new Jugador(this.mapa);
		this.delivery = new Delivery(this.mapa);
		addOnDraw(&drawCallBack);
	}
	
	bool drawCallBack(Scoped!Context cr, Widget widget){
		cr.setSourceRgb(0.0,0.0,0.0);
		cr.paint();
		cr.setSourceRgb(12.0,12.0,12.0);
		//separador
		cr.setLineWidth(1);
			for(int i = 1;i<501;i+=20){
				cr.moveTo(1,i);
				cr.lineTo(500,i);
				cr.stroke();
			}
			for(int i = 1;i<501;i+=20){
				cr.moveTo(i,1);
				cr.lineTo(i,500);
				cr.stroke();
			}
		//fin separador
		if (m_timeout is null )
			m_timeout = new Timeout(400, &redraw,false);
			
		auto coordenadasAMostrar = this.jugador.mover(this.mapa,this.delivery);
		foreach(corrdenadaActual; coordenadasAMostrar){
			cr.setSourceRgb(12.3,12.4,12.5);
			cr.rectangle(corrdenadaActual.obtenerX()*20,corrdenadaActual.obtenerY()*20,20,20);
			
		}
		auto coordenadaDeComida = this.mapa.getDireccionComida();
		cr.setSourceRgb(12.3,12.4,12.5);
		cr.rectangle(coordenadaDeComida.obtenerX()*20,coordenadaDeComida.obtenerY()*20,20,20);
		cr.fill();
		return true;
	}
	
	bool redraw(){
		GtkAllocation area;
		getAllocation(area);
		queueDrawArea(area.x, area.y, area.width, area.height);
		return true;
	}
	
	private bool controladorDeTecla(GdkEventKey* ev, Widget widget){
	bool retorno = false;
    if(ev.keyval == 119){ //w
		this.jugador.rotarArriba();
        retorno = true; 
    }else if(ev.keyval == 97){ //a
		this.jugador.rotarIzquierda();
		retorno = true;
	}
	else if(ev.keyval == 115){ //S
		this.jugador.rotarAbajo();
		retorno = true;
	}
	else if(ev.keyval == 100){ //D
		this.jugador.rotarDerecha();
		retorno = true;
	}
	else
        retorno = false;
		
	return retorno;
	}
	
	public auto obtenerControlador(){
		return &controladorDeTecla;
	}
}




//dmd Snake.d -L+gtkd.lib mapa\mapa.d mapa\coordenadaInvalidaException.d mapa\celda.d mapa\coordenada.d  mapa\estadoCelda\celdaOcupada.d mapa\estadoCelda\celdaOcupadaException.d mapa\estadoCelda\celdaVacia.d mapa\estadoCelda\celdaVaciaException.d mapa\estadoCelda\estadoCelda.d mapa\colores\color.d mapa\colores\colorRojo.d mapa\colores\colorVerde.d jugador\jugador.d jugador\delivery.d jugador\comida.d jugador\direccion\direccion.d jugador\direccion\direccionAbajo.d jugador\direccion\direccionArriba.d jugador\direccion\direccionDerecha.d jugador\direccion\direccionIzquierda.d jugador\ubicable\cabeza.d jugador\ubicable\cuerpo.d jugador\ubicable\ubicable.d