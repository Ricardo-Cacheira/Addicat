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

    float maxX = max(pos.x, cat.position.x - cat.image.width / 2);
    float maxY = max(pos.y, cat.position.y - cat.image.height / 2);
    float collisionWidth = min(cat.position.x + cat.image.width / 2, pos.x + size.x) - maxX;
    float collisionHeight = min(cat.position.y + cat.image.height / 2, pos.y + size.y) - maxY;

    if (collisionWidth < collisionHeight) {
      if (cat.position.x + cat.image.width/2 >= pos.x + size.x) {
        //right collision
        println("Right Collide");
        drugLevel.lifeTaker=true;
        cat.position.x = pos.x+size.x+60;
      } else {
        //left collision
        println("Left Collide");
        drugLevel.lifeTaker=true;
        cat.position.x = pos.x-60;
      }
    } else if (cat.position.y > pos.y + size.y / 2) {
      println("Bottom Collide");
      //bottom collision
      cat.position.y = pos.y + size.y + cat.image.height/2;
      cat.velocity.y = 0;
      drugLevel.lifeTaker=true;
    } else {
      println("Top Collide");
      //top collision
      cat.position.y = pos.y - cat.image.height/2;
      cat.velocity.y = 0;
      connected = true;
    }
  }
}