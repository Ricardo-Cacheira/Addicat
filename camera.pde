class Camera
{
  float x, y, multi;


  Camera(float multi)
  {
    this.multi = multi;
    x = width/2;
    y = height/2;
  }

  void update() {
    if (gm.scrollingSpeed() < 20)
      gm.increase_scrollingSpeed(gm.multi);

    x += gm.scrollingSpeed();
  }

  void adjustDisplay() {
    //pushMatrix();
    translate(width / 2 - x, height / 2 - y);
    //popMatrix();
  }
}