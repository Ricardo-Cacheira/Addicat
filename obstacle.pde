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
    return pos.x + size.x < c.x - width / 2 - 200;
  }

  boolean isColliding(Cat cat)
  {
    return cat.position.x + (cat.image.width/2) > pos.x
      && cat.position.x  - (cat.image.width/2)< pos.x + (size.x)
      && cat.position.y + (cat.image.height/2) > pos.y
      && cat.position.y - (cat.image.height/2) < pos.y + (size.y);
  }
}