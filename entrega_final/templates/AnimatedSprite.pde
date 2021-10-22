//Clase en la que se animan todos los sprite
public class AnimatedSprite extends Sprite {
  PImage[] currentImages;
  PImage[] standNeutral;
  PImage[] moveLeft;
  PImage[] moveRight;
  int direction;
  int index;
  int frame;

  public AnimatedSprite(PImage img, float scale) {
    super(img, scale);
    direction = NEUTRAL_FACING;
    index = 0;
    frame = 0;
  }

  public void updateAnimation() {//definimos en que estado se cambiara de sprite
    frame++;
    if (frame % 5 == 0) {
      selectDirection();
      selectCurrentImages();
      advanceToNextImage();
    }
  }

  public void selectDirection() {
    if (change_x > 0){
      direction = RIGHT_FACING;
  }
    else if(change_x < 0){
      direction = LEFT_FACING;   
    }
    else{
    direction = NEUTRAL_FACING;
    }
  }
  public void selectCurrentImages() {
    if (direction == LEFT_FACING)
      currentImages = moveLeft;
  
 else if(direction == RIGHT_FACING){
      currentImages = moveRight;
 }
  else{
    currentImages = standNeutral;
    
  }
  }
  public void advanceToNextImage() {
    index++;
    if(index >= currentImages.length)
    index = 0;
   image = currentImages[index];
  }
}
