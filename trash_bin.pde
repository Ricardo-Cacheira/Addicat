class TrashBin extends Obstacle {

  TrashBin(PVector pos, PVector size) 
  {
    super(pos, size);
  }

  void drawObs() {
    pushStyle();
    fill(#878787);
    rectMode(CORNER);
    rect(0, 0, size.x, size.y, 40);
    popStyle();
  }

  void collide(Cat cat) {
    float maxX = max(pos.x, player.position.x);
    float maxY = max(pos.y, player.position.y);
    float collisionWidth = min(player.position.x + player.size.x, pos.x + size.x) - maxX;
    float collisionHeight = min(player.position.y + player.size.y, pos.y + size.y) - maxY;

    if (collisionWidth < collisionHeight) {
      if (cat.position.x + cat.size.x >= pos.x + size.x) {
        //right collision
        println("Right Collide");
        cat.position.x = pos.x+size.x;
      } else {
        //left collision
        println("Left Collide");
        cat.position.x = pos.x- cat.size.x;
      }
    } else if (cat.position.y > pos.y + size.y) {
      println("Bottom Collide");
      //bottom collision
      cat.position.y = pos.y + size.y;
      cat.velocity.y = 0;
    } else {
      println("Top Collide");
      //top collision
      cat.position.y = pos.y - cat.size.y;
      cat.velocity.y = 0;
      connected = true;
    }
  }
}