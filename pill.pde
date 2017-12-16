class Pill extends Obstacle {

  PImage pillImg;
  boolean collected;

  Pill(PVector pos, PVector size) 
  {
    super(pos, size);
    pillImg = loadImage("peacepill.png");
    collected = false;
  }

  void drawObs() {
    pushStyle();
    imageMode(CORNER);
    image(pillImg, 0, 0);
    popStyle();
  }

  void collide(Cat Cat) {
    drugLevel.lifeGiver=true;
    collected = true;
  }
}