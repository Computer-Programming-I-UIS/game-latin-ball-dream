/*class Animacion extends Sprite
{
  PImage[] actual, quieto, moverIzq, moverDer;
  int dir, index, frame;
  Animacion(PImage img)
  {
    super(img,0);
    dir = normal;
    index = 0;
    frame = 0; 
}
void actualizar () 
{
  frame++;
  if(frame % 8 == 0)
  {
    seleccionarDireccion();
    seleccionarImagenActual();
    avanzaImagen();
}
}
void seleccionarDireccion()
{
  if(cambio.x > 0)
  dir = derecha;
  else if(cambio.x < 0)
  dir = izquierda;
  else 
  dir = normal;
}
void seleccionarImagenActual()
{
  if(dir == izquierda)
  actual = moverIzq;
  else if(dir == derecha)
  actual = moverDer;
  else actual = quieto;
}
void avanzaImagen()
{
  index++;
  if(index >= actual.length)
  index = 0;
  img = actual[index];
}
}*/
