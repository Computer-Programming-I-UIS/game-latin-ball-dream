plataforma base,piso1,piso2,piso3,piso4,piso5,pared,pared2,pared3,pared4,pared5;
void setup()
{
  size(1000,600);
  base = new plataforma(0,500,100,80);
  piso1 = new plataforma(240,400,300,20);
  piso2 = new plataforma(0,280,400,20);
  piso3 = new plataforma(170,100,360,20);
  piso4 = new plataforma(680,460,320,20);
  piso5 = new plataforma(540,260,300,20);
  pared = new plataforma(520,100,20,390);
  pared2 = new plataforma(0,0,20,280);
  pared3 = new plataforma(150,100,20,80);
  pared4 = new plataforma(980,0,20,460);
  pared5 = new plataforma(820,280,20,60);
}
void draw()
{
  background(121,139,250);
  fill(219,35,35);
  ellipse(mouseX,mouseY,80,80);
  println("X: "+mouseX+", Y: "+mouseY);
  fill(0);
  rect(0,580,1000,20);
  base.mostrar();
  piso1.mostrar();
  piso2.mostrar();
  piso3.mostrar();
  piso4.mostrar();
  piso5.mostrar();
  pared.mostrar();
  pared2.mostrar();
  pared3.mostrar();
  pared4.mostrar();
  pared5.mostrar();
}
