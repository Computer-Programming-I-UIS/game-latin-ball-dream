class Boton {
  int x, y, alto, ancho;
  Boton(int x, int y, int ancho, int alto) {
    this.x=x;
    this.y=y;
    this.alto=alto;
    this.ancho=ancho;
  }
  void fin() {
    PImage salir;                              
    salir= loadImage("salir.png");
    image(salir, this.x, this.y);
  }
  void regresar() {
    PImage volver;
    volver = loadImage("volver.png");
    image(volver, this.x, this.y);
  }

  void musica() {
    PImage music;
    music = loadImage("music.png");
    image(music, this.x, this.y);
  }


  boolean toque() {
    boolean confirmar = false;
    if (mousePressed) {
      if (mouseX >this.x && mouseX<this.x+this.ancho && mouseY> this.y && mouseY <this.y+this.alto) {
        confirmar=true;
      }
    }
    return confirmar;
  }
}
