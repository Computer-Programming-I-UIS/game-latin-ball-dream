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

final static float MOVE_SPEED = 4;
final static float SPRITE_SCALE = 50.0/128;
final static float SPRITE_SIZE = 50;
final static float GRAVITY = .6;
final static float JUMP_SPEED = 14; 

final static int NEUTRAL_FACING = 0;
final static int RIGHT_FACING = 1;
final static int LEFT_FACING = 2;

final static float RIGHT_MARGIN = 400;
final static float LEFT_MARGIN = 60;
final static float VERTICAL_MARGIN = 40;




Sprite p;
ArrayList<Sprite> coins; 
int score;
PImage tile,snow, crate, red_brick, brown_brick, gold;
ArrayList<Sprite> platforms;

float view_x = 0;
float view_y = 0;

void setup()
{
  size(630, 365);
  
    
  imageMode(CENTER);
  p = new Sprite("player.png", 0.3);
  p.change_x = 0;
  p.change_y = 0;
  platforms = new ArrayList<Sprite>();
  coins = new ArrayList<Sprite>();
  gold = loadImage("gold1.png");
  red_brick = loadImage("red_brick.png");
  brown_brick = loadImage("brown_brick.png");
  crate = loadImage("crate.png");
  snow = loadImage("snow.png");
  tile = loadImage("tile.png");
  createPlatforms("map.csv");
  
  
  imageMode(CORNER);
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
  iniciomenu.setGain(-10);  //Bajar el volumen
  intromenu= minim.loadFile("intromenu.mp3");
  intromenu.setGain(-10);
  sonidonivel = minim.loadFile("sonidonivel.mp3"); 
  sonidonivel.setGain(-10);
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
 
    image(menuopciones, 0, 0);
    
    
      if(!iniciomenu.isPlaying()){
        iniciomenu.loop();  //Inicia reproduciendose en loop
      }
      
    salir.fin();
    music.musica();
    
      if (mousePressed) {
      if (mouseX >528 && mouseX<581 && mouseY> 0 && mouseY <27) {
    
        
      iniciomenu.unmute();
      sonidonivel.unmute();
      intromenu.unmute();
        
        
     
      }
      }
      if (mousePressed) {
      if (mouseX >581 && mouseX<630 && mouseY>0 && mouseY <27) {
      
        iniciomenu.mute();
        sonidonivel.mute();
        intromenu.mute();
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

 
}

void desplazamiento() {

  music= new Boton(455, 0, 177, 27);
  salir= new Boton(0, 0, 98, 19);
  volver=new Boton(110, 0, 98, 18);
}

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
  
     if (mousePressed) {
      if (mouseX >91 && mouseX<149 && mouseY> 173 && mouseY <232) {
        
        jugar();
     
        }
  
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

      scroll();
      p.display();
     
  
  textSize(32);
  fill(255, 0, 0);
  text("Coins:" + score, 50, 50);
  resolvePlatformCollisions(p, platforms);
  for(Sprite s: platforms)
    s.display();
} 

  void scroll(){
    float right_boundary = view_x + width - RIGHT_MARGIN;
    if(p.getRight() > right_boundary){
      view_x += p.getRight() - right_boundary;
    }
    float left_boundary = view_x + LEFT_MARGIN;
    if(p.getLeft() < left_boundary){
      view_x -= left_boundary - p.getLeft();
    }
    float bottom_boundary = view_y + height - VERTICAL_MARGIN;
    if(p.getBottom() > bottom_boundary){
      view_y += p.getBottom() - bottom_boundary;
    }
float top_boundary = view_y + VERTICAL_MARGIN;
    if(p.getTop() < top_boundary){
      view_y -= top_boundary - p.getTop();
    }

  translate(-view_x, -view_y);
  }

public boolean isOnPlatforms(Sprite s, ArrayList<Sprite> walls){
  s.center_y += 5;
  ArrayList<Sprite> col_list = checkCollisionList(s, walls);
  s.center_y -= 5;
  if(col_list.size() > 0){
     return true;
  }
  else
  return false;
}

public void resolvePlatformCollisions(Sprite s, ArrayList<Sprite> walls){
  
  s.change_y += GRAVITY;
  s.center_y += s.change_y;
  ArrayList<Sprite> col_list = checkCollisionList(s, walls);
  if(col_list.size() > 0){
  Sprite collided = col_list.get(0);
  if(s.change_y > 0){
    s.setBottom(collided.getTop());
  }
  else if(s.change_y < 0){
   s.setTop(collided.getBottom());
  }
  s.change_y = 0;
  }
  
  s.center_x += s.change_x;
  col_list = checkCollisionList(s, walls);
  if(col_list.size() > 0){
  Sprite collided = col_list.get(0);
  if(s.change_x > 0){
    s.setRight(collided.getLeft());
  }
  else if(s.change_x < 0){
   s.setLeft(collided.getRight());
  }
  }
}

boolean checkCollision(Sprite s1, Sprite s2){
boolean noXOverlap = s1.getRight() <= s2.getLeft() || s1.getLeft() >=  s2.getRight();
boolean noYOverlap = s1.getBottom() <= s2.getTop() || s1.getTop() >=  s2.getBottom();

if(noXOverlap || noYOverlap){
  return false;
}
else{ 
  return true;

}
}

public ArrayList<Sprite> checkCollisionList(Sprite s, ArrayList<Sprite> list){
ArrayList<Sprite> collision_list = new ArrayList<Sprite>();
for(Sprite p: list){
  if(checkCollision(s, p))
  collision_list.add(p);
}
return collision_list;
}

void createPlatforms(String filename){
  String[] lines = loadStrings(filename);
  for(int row = 0; row < lines.length; row++){
    String[] values = split(lines[row], ",");
    for(int col = 0; col < values.length; col++){
      if(values[col].equals("1")){
        Sprite s = new Sprite(red_brick, SPRITE_SCALE);
        s.center_x = SPRITE_SIZE/2 + col * SPRITE_SIZE;
        s.center_y = SPRITE_SIZE/2 + row * SPRITE_SIZE;
        platforms.add(s);
      }
      else if(values[col].equals("2")){
        Sprite s = new Sprite(snow, SPRITE_SCALE);
        s.center_x = SPRITE_SIZE/2 + col * SPRITE_SIZE;
        s.center_y = SPRITE_SIZE/2 + row * SPRITE_SIZE;
        platforms.add(s);
      }
      else if(values[col].equals("3")){
        Sprite s = new Sprite(brown_brick, SPRITE_SCALE);
        s.center_x = SPRITE_SIZE/2 + col * SPRITE_SIZE;
        s.center_y = SPRITE_SIZE/2 + row * SPRITE_SIZE;
        platforms.add(s);
      }
      else if(values[col].equals("4")){
        Sprite s = new Sprite(crate, SPRITE_SCALE);
        s.center_x = SPRITE_SIZE/2 + col * SPRITE_SIZE;
        s.center_y = SPRITE_SIZE/2 + row * SPRITE_SIZE;
        platforms.add(s);
      }
       else if(values[col].equals("5")){
        Coin c = new Coin(gold, SPRITE_SCALE);
        c.center_x = SPRITE_SIZE/2 + col * SPRITE_SIZE;
        c.center_y = SPRITE_SIZE/2 + row * SPRITE_SIZE;
        coins.add(c);
      }
    }
  }
}




void keyPressed(){
  if(keyCode == RIGHT){
    p.change_x = MOVE_SPEED;
  }
  else if(keyCode == LEFT){
    p.change_x = -MOVE_SPEED;
  }
  else if(keyCode == UP){
    p.change_y = -JUMP_SPEED;
  }
  
  else if(key == RIGHT && isOnPlatforms(p, platforms)){
    p.change_y = -JUMP_SPEED;
  }
}


void keyReleased(){
  if(keyCode == RIGHT){
    p.change_x = 0;
  }
  else if(keyCode == LEFT){
    p.change_x = 0;
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
