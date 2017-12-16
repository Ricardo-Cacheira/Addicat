class Box extends Obstacle {

  Box(PVector pos, PVector size) 
  {
    super(pos, size);
  }

  void drawObs() {
    pushStyle();
    fill(#8e481f);
    rectMode(CORNER);
    rect(0, 0, size.x, size.y);
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
        cat.position.x = pos.x+size.x;
      } else {
        //left collision
        cat.position.x = pos.x- cat.size.x;
      }
    } else if (cat.position.y >= pos.y + size.y) {
      //bottom collision
      cat.position.y = pos.y + size.y;
      cat.velocity.y = 0;
    } else {
      //top collision
      cat.position.y = pos.y - cat.size.y;
      cat.velocity.y = 0;
    }
  }
}