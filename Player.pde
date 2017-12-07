class Cat
{
  PImage imager, imagel, imagers, imagels;
  PVector position, velocity, size;
  boolean faceRight, faceLeft;
  float jumpSpeed, walkSpeed, friction, scale = 4;
  //1 - Right, 2 - Left, 3 - Slide Right, 4 - Slide Left,
  int currentDir, newDir, newWidth, newHeight;

  Cat(float jumpSpeed, float walkSpeed, PVector velocity, float fric)
  {
    this.imager = loadImage("catr1.png");
    this.imagel = loadImage("catl1.png");
    this.imagers = loadImage("catrs.png");
    this.imagels = loadImage("catls.png");
    this.size = new PVector(imager.width, imager.height);
    this.position = new PVector(400, height - 100);
    this.faceRight = true;
    currentDir = 0;
    //direction change sprite so it doesnt mirror it and stays consistent
    this.velocity = velocity;
    this.jumpSpeed = jumpSpeed;
    this.walkSpeed = walkSpeed;
    this.friction = fric;
  }


  void updatePlayer()
  {

    walkSpeed += multi;
    velocity.y += gravity;
    if (down == 1 && (position.y == ground - size.y || connected))
      velocity.x = (velocity.x) * friction;
    else
      if(faceLeft)
      velocity.x = (walkSpeed * (left + right))/2;
      else
      velocity.x = walkSpeed * (left + right);
    position.add(velocity);

    if (position.y >= ground - size.y) {
      position.y = ground - size.y;
      velocity.y = 0;
    }

    connected = false;
    obsManager.handleCollision();

    if ((position.y == ground - size.y || connected) && up == -1) {
      velocity.y = -jumpSpeed;
    }
  }

  void updateImg()
  {
    if (down == 1 && faceRight)
    {
      size = new PVector(imagers.width, imagers.height);
      image(imagers, 0, 0);
    } else if (faceRight)
    {
      size = new PVector(imager.width, imager.height);
      image(imager, 0, 0);
    }

    if (down == 1 && faceLeft)
    {
      size = new PVector(imagels.width, imagels.height);
      image(imagels, 0, 0);
    } else if (faceLeft)
    {
      size = new PVector(imagel.width, imagel.height);
      image(imagel, 0, 0);
    }
  }


  void display()
  {
    pushMatrix();

    translate(position.x, position.y);
    scale(1, 1);

    imageMode(CORNER);
    updateImg();

    popMatrix();
  }
}