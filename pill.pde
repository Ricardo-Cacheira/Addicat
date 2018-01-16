class Pill extends Obstacle {

  PImage pillImg;
  boolean collected;

  Pill(PVector pos, PVector size, PImage pillImg) 
  {
    super(pos, size);
    this.pillImg = pillImg;
    collected = false;
  }

  void drawObs() {
    pushStyle();
    imageMode(CORNER);
    image(pillImg, 0, 0);
    popStyle();
  }

  void collide(Cat Cat) {
    gm.drugLevel.lifeGiver=true;
    collected = true;
  }
}