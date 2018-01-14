abstract class Obstacle
{
  PVector pos;
  PVector size;
  boolean collision;


  Obstacle(PVector pos, PVector size)
  {
    this.pos = pos.copy();
    this.size = size.copy();
  }

  void update()
  {
  }


  void display()
  {
    pushMatrix();
    translate(pos.x, pos.y);

    drawObs();

    popMatrix();
  }

  abstract void drawObs();
  abstract void collide(Cat cat);

  boolean isDead()
  {
    return pos.x + size.x < gm.c.x - width / 2 - 200;
  }

  boolean isColliding(Cat cat)
  {
    return cat.position.x + cat.size.x > pos.x
      && cat.position.x < pos.x + size.x
      && cat.position.y + cat.size.y > pos.y
      && cat.position.y < pos.y + size.y;
  }
}