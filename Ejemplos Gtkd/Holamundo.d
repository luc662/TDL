import gtk.MainWindow;
import gtk.Label;
import gtk.Main;

void main(string[] args)
{
    Main.init(args);
    MainWindow win = new MainWindow("Hello World");
    win.setDefaultSize(600, 600);
    win.add(new Label("Hello World"));
    win.showAll();
    Main.run();
}

//dmd Holamundo.d -L+gtkd.lib