class Box extends Obstacle {

  PImage boxImg;

  Box(PVector pos, PVector size) 
  {
    super(pos, size);
    boxImg = loadImage("box.png");
  }

  void drawObs() {
    pushStyle();
    fill(#8e481f);
    imageMode(CORNER);
    image(boxImg, 0, 0);
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
      connected = true;
      pushed = false;
    }
  }
}