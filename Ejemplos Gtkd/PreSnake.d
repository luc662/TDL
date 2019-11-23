import gtk.MainWindow;
import gtk.Main;
import cairo.Context;
import cairo.Surface;
import gtk.Widget;
import gtk.DrawingArea;
import glib.Timeout;


public class DW: DrawingArea{
	Timeout m_timeout;
	int x = 0;
	int y = 50;
	
	this(){
		addOnDraw(&drawCallback);
	}
	
	bool drawCallback(Scoped!Context cr, Widget widget){
		if (m_timeout is null)
			m_timeout = new Timeout(1000, &redraw,false);
		cr.setSourceRgb(0.3,0.4,0.5);
		cr.rectangle(x,y,20,20);
		cr.fill();
		if(x<500)
		x += 10;
		return true;	
	}
	
	bool redraw(){
		GtkAllocation area;
		getAllocation(area);
		queueDrawArea(area.x, area.y, area.width, area.height);
		return true;
	}
}

void main(string[] args){
	Main.init(args);
    MainWindow win = new MainWindow("Drawing Area");
    win.setDefaultSize(500, 500);
    
    DW dw = new DW();
    
	win.add(dw);
    win.showAll();
    Main.run();
}

//dmd PreSnake.d -L+gtkd.lib