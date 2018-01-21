class TrashBin extends SequenceObject {

  private PImage trashImg;

  TrashBin(PVector pos, PVector size, PImage trashImg) 
  {
    super(pos, size);
    this.trashImg = trashImg;
  }

  void drawObs() {
    pushStyle();
    fill(#878787);
    imageMode(CORNER);
    image(trashImg, 0, 0);
    popStyle();
  }

  void collide(Cat cat) {
    //println("Collide");

    float maxX = max(pos.x, cat.position.x);
    float maxY = max(pos.y, cat.position.y);
    float collisionWidth = min(cat.position.x + cat.size.x, pos.x + size.x) - maxX;
    float collisionHeight = min(cat.position.y + cat.size.y, pos.y + size.y) - maxY;

    if (collisionWidth < collisionHeight) {
      if (cat.position.x + cat.size.x >= pos.x + size.x) {
        //right collision
        cat.position.x = pos.x+size.x;
      } else {
        //left collision
        cat.position.x = pos.x- cat.size.x;
      }
    } else if (cat.position.y + cat.size.y >= pos.y + size.y) {
      //bottom collision
      cat.position.y = pos.y + size.y;
      cat.velocity.y = 0;
    } else {
      //top collision
      cat.position.y = pos.y - cat.size.y;
      cat.velocity.y = 0;
      gm.player.connected = true;
      gm.player.pushed = false;
    }
  }
}