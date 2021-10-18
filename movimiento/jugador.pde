class Jugador {

  int x;
  int y;


  Jugador(int x, int y) {

    this.x= x;
    this.y= y;
  }

  void mover() {
    if (keyPressed && key == CODED) {

      switch(keyCode) {
      case LEFT:
        if (this.x > 50) {
          this.x -= 5;
        }
        break;
      case RIGHT:
        if (this.x < 580) {
          this.x += 5;
        }
        break;
      }
    }
  }


  void dibujar() {
    stroke(0, 244, 200);
    circle(this.x, this.y, 40);
  }
}
