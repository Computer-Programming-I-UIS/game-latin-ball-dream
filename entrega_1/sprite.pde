class Sprite
{ 
  PImage img;
  PVector center, cambio, tamario;
  int tipo, num;
  Sprite(PImage archivo, float x, float y)
  {
    img = archivo ;
    tamario = new PVector(img.width, img.height);
    center = new PVector(x,y);
    cambio = new PVector(0,0);
    tipo = 0;
    num = 0;
  }
  Sprite(PImage archivo, int pared) 
  {
    img = archivo ;
    tamario = new PVector(img.width, img.height);
    center = new PVector(0,0);
    cambio = new PVector(0,0);
    tipo = 0;
    num = pared;
  }
  Sprite(float x, float y)
   {
    img = new PImage();
    tamario = new PVector(0,0);
    center = new PVector(x,y);
    cambio = new PVector(0,0);
    tipo = 0;
   
  }
  void mostrar()
  {
  image(img,center.x,center.y);
  }
 void mover()
{
  center.x += cambio.x;
  center.y += cambio.y;
}
void setLeft(float left)
{
  center.x = left + tamario.x/2;
}
float getLeft()
{
  return center.x - tamario.x/2;
}
void setRight(float right)
{
  center.x = right - tamario.x/2;
}
float getRight()
{
  return center.x + tamario.x/2;
}
void setTop(float top)
{
  center.y = top + tamario.y/2;
}
float getTop()
{ 
  return center.y - tamario.y/2;
}
void setBottom(float bottom)
{
  center.y = bottom - tamario.y/2;
}
float getBottom()
{
  return center.y + tamario.y/2;
}
}
