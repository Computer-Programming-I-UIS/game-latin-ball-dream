class plataforma 

{
  int posX, posY,ancho,alto;
  plataforma(int x, int y,int ancho, int alto)
  {
    this.posX = x;
    this.posY = y;
    this.ancho = ancho;
    this.alto = alto;
    
  }
  void mostrar()
  { 
rect(posX,posY,ancho,alto);
  }
}
