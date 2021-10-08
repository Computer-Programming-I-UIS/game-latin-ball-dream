final static int normal = 0;
final static int derecha = 1;
final static int izquierda = 2;
final static float der_margen = 400;
final static float izq_margen = 32;
final static float ver_margen = 40;
final static float gravedad = 0.6;
final static float salto = 14;
final static float vel = 14;
final static float size_sprite = 32;
float view_x = 0;
float view_y = 0;

PImage[] personaje;
ArrayList<Sprite> plataforma;
Player player;
Fondo lv1;
void setup()
{
  size(800,511);
  imageMode(CENTER);
  personaje = new LeerArchivo(4,12,"").getHoja();
  player = new Player(personaje[0]);
  player.center.x = 65;
  player.center.y = 100;
  lv1 = new Fondo("mapa.csv","Tileset32.png",32);
}
void draw()
{
 background(178,245,245);
  jugar();
}
void jugar()
{
   scroll();
   lv1.mostrar();
   player.mostrar();
   
}
void scroll()
{
  float der_dimension = view_x + width - der_margen;
  if(player.getRight() > der_dimension)
  {
    if(view_x < 3700)
    view_x += player.getRight() - der_dimension;
  }
  float izq_dimension = view_x - izq_margen;
  if(player.getLeft() < izq_dimension)
  {
    if(view_x > 0)
    view_x -= izq_dimension - player.getLeft();
  }
  translate(view_x,view_y);
}
boolean tocado(Sprite s1, Sprite s2)
{
  boolean tocarX = s1.getRight() <= s2.getLeft() ||  s1.getLeft() >= s2.getRight();
  boolean tocarY = s1.getBottom() <= s2.getTop() ||  s1.getTop() >= s2.getBottom();
  if(tocarX || tocarY)
  return false;
  else
  {
    if(s2.num == 13 && ((Player)s1).estado == 0)
    return false;
    else
    {
      if(s2.num == 31 && ((Player)s1).estado == 1)
      {
       player.estado = 0; 
       player.cargarEstado();
      }
      return true;
    }
  }
}
ArrayList<Sprite> tocandoLista(Sprite s, ArrayList<Sprite> lista)
{
  ArrayList<Sprite> listaTocada = new ArrayList<Sprite>();
  for(Sprite p: lista)
  {
  if(tocado(s,p))
  listaTocada.add(p);
    }
    return listaTocada;
}
void resolverColision(Sprite s, ArrayList<Sprite> lista)
{
  s.cambio.y += gravedad;
  s.center.y += s.cambio.y;
  ArrayList<Sprite> colLista = tocandoLista(s,lista);
  if(colLista.size() > 0) 
  {
  Sprite colision = colLista.get(0);
  if(s.cambio.y > 0)
  s.setBottom(colision.getTop());
  else if(s.cambio.y < 0)
  s.setTop(colision.getBottom());
  s.cambio.y = 0;
  }
  s.center.x += s.cambio.x;
  colLista = tocandoLista(s,lista);
  if(colLista.size() > 0)
  {
    Sprite colision = colLista.get(0);
    if(s.cambio.x > 0)
    s.setRight(colision.getLeft());
    else if(s.cambio.x < 0)
    s.setLeft(colision.getRight());
    s.cambio.x = 0;
  }
}
boolean estaEnPlataforma(Sprite s, ArrayList<Sprite> pared)
{
  s.center.y +=5;
  ArrayList<Sprite> colLista = tocandoLista(s,pared);
  s.center.y -= 5;
  if(colLista.size() > 0)
  return true;
  else
  return false;
}
