class Platform extends Obstacle {  

  Platform(PVector pos, PVector size) 
  {
    super(pos, size);
    connected = false;
  }

  void drawObs() {
    pushStyle();    
    fill(#841F27);
    rectMode(CORNER);
    rect(0, 0, size.x, size.y);
    popStyle();
  }

  void collide(Cat cat) {
    println("Collide");

    float maxX = max(pos.x, cat.position.x);
    float maxY = max(pos.y, cat.position.y);
    float collisionWidth = min(cat.position.x + cat.size.x, pos.x + size.x) - maxX;
    float collisionHeight = min(cat.position.y + cat.size.y, pos.y + size.y) - maxY;

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
    } else if (cat.position.y + cat.size.y >= pos.y + size.y) {
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