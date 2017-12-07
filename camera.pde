class Camera
{
  float x;
  float y;


  Camera()
  {
    x = width/2;
    y = height/2;
  }

  void update() {
    if(scrollingSpeed < 20)
    scrollingSpeed += multi;
    
    x += scrollingSpeed;
  }

  void adjustDisplay() {
    //pushMatrix();
    translate(width / 2 - x, height / 2 - y);
    //popMatrix();
  }
}