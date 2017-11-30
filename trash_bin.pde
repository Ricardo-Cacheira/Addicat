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
    float maxX = max(pos.x, player.position.x - player.image.width / 2);
    float maxY = max(pos.y, player.position.y - player.image.height / 2);
    float collisionWidth = min(player.position.x + player.image.width / 2, pos.x + size.x) - maxX;
    float collisionHeight = min(player.position.y + player.image.height / 2, pos.y + size.y) - maxY;

    if (collisionWidth < collisionHeight) 
      if (player.position.x + player.image.width/2 >= pos.x + size.x) {
        //right collision
        drugLevel.lifeTaker=true;
        player.position.x = pos.x+size.x+60;
      } else {
        //left collision
        drugLevel.lifeTaker=true;
        player.position.x = pos.x-60;
      } else if (player.position.y - player.image.height/2 >= pos.y + size.y) {
      //top collision
      player.position.y = pos.y - player.image.height/2;
      player.velocity.y = 0;
      drugLevel.lifeTaker=true;
    } 
  }
}