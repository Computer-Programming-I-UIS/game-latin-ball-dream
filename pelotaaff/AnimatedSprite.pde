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

  public void updateAnimation() {
    frame++;
    if (frame % 5 == 0) {
      selectDirection();
      selectCurrentImages();
    }
  }

  public void selectDirection() {
    if (change_x > 0)
      direction = RIGHT_FACING;
  }


  public void selectCurrentImages() {
    if (direction == RIGHT_FACING)
      currentImages = moveRight;
  }

  public void advanceToNextImage() {
  }
}
