class Pill extends  SequenceObject {

  private PImage pillImg;
  private boolean collected;

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
    gm.player.lifeGiver=true;
    collected = true;
  }
}