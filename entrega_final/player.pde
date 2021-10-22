//Clase para el jugador donde se definira los movimientos y los estados para la animacion 
public class Player extends AnimatedSprite{
  int lives;
  boolean onPlatform, inPlace;
  PImage[] standLeft;
  PImage[] standRight;
  PImage[] jumpLeft;
  PImage[] jumpRight;
  public Player(PImage img, float scale){
    super(img, scale);
    lives = 3;
    direction = RIGHT_FACING;
    onPlatform = true;
    inPlace = true;
    standLeft = new PImage[1];
    standLeft[0] = loadImage("");
    standRight = new PImage[1];
    standRight[0] = loadImage("");
    moveLeft = new PImage[2];
    moveLeft[0] = loadImage("");
    moveLeft[1] = loadImage("");
    moveRight = new PImage[2];
    moveRight[0] = loadImage("");
    moveRight[1] = loadImage(""); 
    currentImages = standRight;
  }
  @Override
  public void updateAnimation(){
   onPlatform = isOnPlatforms(this, platforms);
   inPlace = change_x == 0 && change_y == 0;
   super.updateAnimation();
  }
  @Override
  public void selectDirection(){
    if(change_x > 0)
      direction = RIGHT_FACING;
    else if(change_x < 0)
      direction = LEFT_FACING;    
  }
  @Override
  public void selectCurrentImages(){
 if(direction == RIGHT_FACING){
   if(inPlace){
     currentImages = standRight;
   }
   else if(!onPlatform){
     currentImages = jumpRight;
   }
   else{
   currentImages = moveRight;
   }
 }
else if(direction == LEFT_FACING){
   if(inPlace){
     currentImages = standLeft;
   }
   else if(!onPlatform){
     currentImages = jumpLeft;
   }
   else{
   currentImages = moveLeft;
   }
   
   
 }
    
  }
}
