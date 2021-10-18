
Jugador jugador;


void setup() {
  size(630, 365);
  bola();


}

void draw() {
  background(0);

  jugador.dibujar();
  jugador.mover();
  

  }
 
void bola(){
  
  jugador= new Jugador(600,300);
}
