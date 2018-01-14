class Spike extends Obstacle {


  PImage spike = loadImage("spike.png");

  Spike(PVector pos, PVector size) 
  {
    super(pos, size);
  }

  void drawObs() {
    pushStyle();
    fill(#FF1C1C);
    imageMode(CORNER);
    image(spike, 0, 0);
    popStyle();
  }

  void collide(Cat cat) {
    println("Collide");

    float maxX = max(pos.x, gm.player.position.x);
    float maxY = max(pos.y, gm.player.position.y);
    float collisionWidth = min(gm.player.position.x + gm.player.size.x, pos.x + size.x) - maxX;
    float collisionHeight = min(gm.player.position.y + gm.player.size.y, pos.y + size.y) - maxY;

    if (collisionWidth < collisionHeight) {
      if (cat.position.x + cat.size.x >= pos.x + size.x) {
        //right collision
        gm.drugLevel.lifeTaker = true;
        gm.player.jump();
        cat.position.x = pos.x+size.x;
      } else {
        //left collision
        gm.drugLevel.lifeTaker = true;
        gm.player.jump();
        cat.position.x = pos.x- cat.size.x;
      }
    } else if (cat.position.y > pos.y + size.y) {
      //bottom collision
      gm.drugLevel.lifeTaker = true;
      gm.player.jump();
      //cat.position.y = pos.y + size.y;
      //cat.velocity.y = 0;
    } else {
      //top collision
      gm.drugLevel.lifeTaker = true;
      gm.player.jump();
      //cat.position.y = pos.y - cat.size.y;
      //cat.velocity.y = 0;
      gm.player.connected = true;
    }
  }
}