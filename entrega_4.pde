
import ddf.minim.*;
Minim minim;//Se declara la clase minim
AudioPlayer audioinicio;
PImage inicio, menuopciones, niveles, creditos, controles, personajes, fondonivel;
//boolean confirmar;
PFont pixelFont;
boolean presionartecla= true;
int titulopress = 0;
char escena= 'N';
Boton music, salir, volver;

//musica
AudioPlayer iniciomenu;
AudioPlayer sonidonivel;
AudioPlayer alelegirenelmenu;
AudioPlayer intromenu;
AudioSample presionarboton;

/*final static int normal = 0;
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
 */
void setup()
{
  size(630, 365);
  inicio = loadImage("inicio.png");
  menuopciones = loadImage("menuopciones.png");
  fondonivel= loadImage("fondonivel.png");
  niveles= loadImage("niveles.png");
  creditos = loadImage("creditos.png");
  controles = loadImage("controles.png");
  personajes = loadImage("personajes.png");
  pixelFont = createFont("monogram_extended.ttf", 45);
  
    //Musica
  minim = new Minim(this);
  iniciomenu = minim.loadFile("iniciomenu.mp3");
  iniciomenu.setGain(-20);  //Bajar el volumen
  intromenu= minim.loadFile("intromenu.mp3");
  intromenu.setGain(-25);
  sonidonivel = minim.loadFile("sonidonivel.mp3"); 
  sonidonivel.setGain(-20);
  alelegirenelmenu = minim.loadFile("alelegirenelmenu.mp3");
  presionarboton= minim.loadSample("presionarboton.mp3");
 
  

  /*size(800,511);
   imageMode(CENTER);
   personaje = new LeerArchivo(4,12,"").getHoja();
   player = new Player(personaje[0]);
   player.center.x = 65;
   player.center.y = 100;
   lv1 = new Fondo("mapa.csv","Tileset32.png",32);*/
  desplazamiento();
}
void draw() {


  switch(escena) {
  case 'N':
    image(inicio, 0, 0);
    
      if(!iniciomenu.isPlaying()){
        iniciomenu.loop();  //Inicia reproduciendose en loop
      }
    
    //Texto Presione cualquier tecla para continuar
    if (frameCount%30 == 0)  presionartecla = !presionartecla;  //Parpadea el texto cada 30 frames
    if (presionartecla && titulopress == 0) {  //Si no se ha presionado una tecla
      textFont(pixelFont);
      fill(#FF0000);
      textSize(25);
      textAlign(CENTER, CENTER);
      text("Presione una tecla para continuar", width/2, height/2);
    }

    if (keyPressed==true) {
      escena = 'A';
    }


    break;

  case 'A':
    menuopciones.resize(630, 365);
    image(menuopciones, 0, 0);
    if(!iniciomenu.isPlaying()){
       iniciomenu.loop();  //Inicia reproduciendose en loop
    }
  
    salir.fin();
    music.musica();
    
      if (mousePressed) {
      if (mouseX >528 && mouseX<581 && mouseY> 0 && mouseY <27) {
    
        iniciomenu.pause();
     
      }
      }
      if (mousePressed) {
      if (mouseX >581 && mouseX<630 && mouseY>0 && mouseY <27) {
      
      iniciomenu.isPlaying();
       }
      }
    
    if (mousePressed) {
      if (mouseX >207 && mouseX<391 && mouseY> 170 && mouseY <202) {
        escena ='B';//Se ejecuta el juego
        iniciomenu.pause();
        if(!sonidonivel.isPlaying()){
          sonidonivel.loop();  //Inicia reproduciendose en loop
       }
      }
    }
    if (mousePressed) {
      if (mouseX >207 && mouseX<390 && mouseY> 211 && mouseY <239) {
        escena ='C';//Se envia a niveles
        iniciomenu.pause();
        if(!intromenu.isPlaying()){
        intromenu.loop();  //Inicia reproduciendose en loop
       }
      }
    }
    if (mousePressed) {
      if (mouseX >206 && mouseX<390 && mouseY> 247 && mouseY <274) {
        escena ='D';
        iniciomenu.pause();
        if(!intromenu.isPlaying()){
        intromenu.loop();  //Inicia reproduciendose en loop
       }
      }
    }
    if (mousePressed) {
      if (mouseX >205 && mouseX<388 && mouseY> 283 && mouseY <312) {
        escena ='E';
        iniciomenu.pause();
        if(!intromenu.isPlaying()){
        intromenu.loop();  //Inicia reproduciendose en loop
       }
      }
      
    }
    if (mousePressed) {
      if (mouseX >205 && mouseX<388 && mouseY>318 && mouseY <347) {
        escena ='F';
        iniciomenu.pause();
        if(!intromenu.isPlaying()){
        intromenu.loop();  //Inicia reproduciendose en loop
       }
      }
    }
    if (salir.toque()==true)exit();
   



    break;

  case'B':
    jugar();
    break;

  case 'C':
    level();

    break;

  case 'D':
    personajes();
    break;

  case 'E':
    creditos();
    break;

  case 'F':
    controles();
    break;
  }

  /*background(178,245,245);
   jugar();*/
}

void desplazamiento() {

  music= new Boton(455, 0, 177, 27);
  salir= new Boton(0, 0, 98, 19);
  volver=new Boton(110, 0, 98, 18);
}
/*void jugar()
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
 }*/
void level() {
  image(niveles, 0, 0);
  salir.fin();
  if (salir.toque()==true)exit();
  salir.toque();
  volver.regresar();
  if (volver.toque()==true){
    escena='A';
    intromenu.pause();
    intromenu.rewind();
  }

}
void jugar() {
  image(fondonivel, 0, 0);
  salir.fin();
  if (salir.toque()==true)exit();
  salir.toque();
  volver.regresar();
  if (volver.toque()==true){
    escena='A';
    sonidonivel.pause();
    sonidonivel.rewind();
  }
 
}
void personajes() {
  image(personajes, 0, 0);
  salir.fin();
  if (salir.toque()==true)exit();
  salir.toque();
  volver.regresar();
  if (volver.toque()==true){
    escena='A';
    intromenu.pause();
    intromenu.rewind();
  }
 
}
void creditos() {
  image(creditos, 0, 0);
  salir.fin();
  if (salir.toque()==true)exit();
  salir.toque();
  volver.regresar();
  if (volver.toque()==true){
    escena='A';
    intromenu.pause();
    intromenu.rewind();
  }
 
}
void controles() {
  image(controles, 0, 0);
  salir.fin();
  if (salir.toque()==true)exit();
  salir.toque();
  volver.regresar();
  if (volver.toque()==true){
    escena='A';
    intromenu.pause();
    intromenu.rewind();
  }
 
}
