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
	private bool turbo = false;
	
	this(MainWindow menuSnake, string nombreBoton){
		super(nombreBoton);
		modifyFont("Arial", 10);
		this.menuSnake = menuSnake;
		addOnButtonRelease(&iniciar);
	}
	
	this(MainWindow menuSnake, string nombreBoton, bool turbo){
		this.turbo = turbo;
		super(nombreBoton ~" en modo Turbo");
		modifyFont("Arial", 10);
		this.menuSnake = menuSnake;
		addOnButtonRelease(&iniciar);
		
	}
	
	bool iniciar(Event event, Widget widget){
		MainWindow ventanaSnake = new MainWindow("Snake v0.1.3");
		ventanaSnake.setDefaultSize(400, 400);
		Tablero tablero;
		if(this.turbo)
			tablero = new Tablero(ventanaSnake, turbo);
		else
			tablero = new Tablero(ventanaSnake);
		
		auto teclas = toDelegate(tablero.obtenerControlador());
		ventanaSnake.addOnKeyPress(teclas);
		ventanaSnake.add(tablero);
		this.menuSnake.close();
		ventanaSnake.showAll();
		return true;
	}
}


public VBox crearMenu(MainWindow ventanaMenu, string nombreBoton){
	MenuBar menuBar = new MenuBar();
    MenuItem fileMenuItem = new MenuItem("Menu");
	menuBar.append(fileMenuItem);
 
    VBox vb = new VBox(false, 10);
    vb.packStart(menuBar, false, false, 0);
    
	QuitButton quitButton = new QuitButton("Salir");
	vb.packEnd(quitButton,false,false,0);
	IniciarSnakeButton iniciarSnakeTurboButton = new IniciarSnakeButton(ventanaMenu, nombreBoton,true);
	vb.packEnd(iniciarSnakeTurboButton,false,false,10);
	IniciarSnakeButton iniciarSnakeButton = new IniciarSnakeButton(ventanaMenu, nombreBoton);
	vb.packEnd(iniciarSnakeButton,false,false,10);
	return vb;
}

void main(string[] args){
  
  try{
    Main.init(args);
    MainWindow ventanaMenu = new MainWindow("Tron Menu");
    ventanaMenu.setDefaultSize(400, 400);
  
    MenuBar menuBar = new MenuBar();
    MenuItem fileMenuItem = new MenuItem("Menu");
	menuBar.append(fileMenuItem);
 
    ventanaMenu.add(crearMenu(ventanaMenu, "Iniciar Tron"));
	ventanaMenu.showAll();
    Main.run();
	}
	catch (Exception e){
    writeln("Rompiste el programa, Salame.");
	}

}


public class Tablero: DrawingArea{
	
	Timeout m_timeout;
	Mapa mapa;
	Jugador jugador;
	Jugador jugadorDos;
	Delivery delivery;
	MainWindow ventanaActual;
	int velocidad = 120;
	
	this(MainWindow ventanaActual){
		this.mapa= new Mapa();
		this.jugador = new Jugador(this.mapa);
		this.jugadorDos = new Jugador(this.mapa, true);
		this.delivery = new Delivery(this.mapa);
		this.ventanaActual = ventanaActual;
		addOnDraw(&drawCallBack);
	}
	
	this(MainWindow ventanaActual, bool turbo){
		this.velocidad = 50;
		this(ventanaActual);
	}
	
	
	bool drawCallBack(Scoped!Context cr, Widget widget){
		
		bool retorno = false;
		if(this.jugador.estaVivo() &&  this.jugadorDos.estaVivo() ) {
		cr.setSourceRgb(0.0,0.0,0.0);
		cr.paint();
		
		if (m_timeout is null )
			m_timeout = new Timeout(this.velocidad, &redraw,false);
			
		auto coordenadasAMostrar = this.jugador.mover(this.mapa);
		foreach(corrdenadaActual; coordenadasAMostrar){
			cr.setSourceRgb(255,0,0);
			cr.rectangle(corrdenadaActual.obtenerX()*20,corrdenadaActual.obtenerY()*20,20,20);
			cr.fill();
		}
		coordenadasAMostrar = this.jugadorDos.mover(this.mapa);
		foreach(corrdenadaActual; coordenadasAMostrar){
			cr.setSourceRgb(0,0,255);
			cr.rectangle(corrdenadaActual.obtenerX()*20,corrdenadaActual.obtenerY()*20,20,20);
			cr.fill();
		}
		
		retorno = true;
		}
		else{
				this.ventanaActual.close();
				this.ventanaActual = new MainWindow("Game Over Menu");
				VBox cajaVertical = crearMenu(this.ventanaActual, "Voler a jugar");
				
				if(!this.jugador.estaVivo())
				cajaVertical.packStart(new Label("Jugador 1 Gana!"),false,false,10);
				else
				cajaVertical.packStart(new Label("Jugador 2 Gana!"),false,false,10);
				
				this.ventanaActual.add(cajaVertical);
				this.ventanaActual.setDefaultSize(400, 400);
				this.ventanaActual.showAll();
				retorno = true;
		}
		return retorno;
	}
	
	bool redraw(){
		GtkAllocation area;
		getAllocation(area);
		queueDrawArea(area.x, area.y, area.width, area.height);
		return true;
	}
	
	private bool controladorDeTecla(GdkEventKey* ev, Widget widget){
	bool retorno = false;
    if(ev.keyval == 119){ //W
		this.jugador.rotarArriba();
        retorno = true; 
    }else if(ev.keyval == 97){ //A
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
	else if(ev.keyval == 105){ //I
		this.jugadorDos.rotarArriba();
        retorno = true;
	}
	else if(ev.keyval == 106){ //J
		this.jugadorDos.rotarIzquierda();
		retorno = true;
	}
	else if(ev.keyval == 107){ //K
		this.jugadorDos.rotarAbajo();
		retorno = true;
	}
	else if(ev.keyval == 108){ //L
		this.jugadorDos.rotarDerecha();
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

		/*separador
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
			fin separador
		*/
		
		
//dmd Tron.d -L+gtkd.lib mapa\mapa.d mapa\coordenadaInvalidaException.d mapa\celda.d mapa\coordenada.d  mapa\estadoCelda\celdaOcupada.d mapa\estadoCelda\celdaOcupadaException.d mapa\estadoCelda\celdaVacia.d mapa\estadoCelda\celdaVaciaException.d mapa\estadoCelda\estadoCelda.d jugador/direccion/AvanzoFueraDeRangoException.d jugador\jugador.d jugador\delivery.d jugador\comida.d jugador\direccion\direccion.d jugador\direccion\direccionAbajo.d jugador\direccion\direccionArriba.d jugador\direccion\direccionDerecha.d jugador\direccion\direccionIzquierda.d jugador\ubicable\cabeza.d jugador\ubicable\cuerpo.d jugador\ubicable\ubicable.d