class Cat
{
  PImage image, imager, imagers;
  float right, up, down;
  PVector position, velocity, size;
  boolean faceRight;
  float jumpSpeed, walkSpeed, friction;

  Cat(float jumpSpeed, float walkSpeed, PVector velocity, float fric)
  {
    this.imager = loadImage("catr1.png");
    this.imagers = loadImage("catrs.png");
    this.size = new PVector(imager.width, imager.height);
    this.position = new PVector(400, height - 100);
    this.faceRight = true;
    this.velocity = velocity;
    this.jumpSpeed = jumpSpeed;
    this.walkSpeed = walkSpeed;
    this.friction = fric;
    this.right = -3;

    updateImg();
  }

  boolean outOfScreen()
  {
    return position.x + size.x < c.x - width / 2;
  }

  void update()
  {
    if (scrollingSpeed < 20)
      walkSpeed += multi;
    velocity.y += gravity;
    if (down == 1 && (position.y == ground - size.y || connected))
      //velocity.x = (velocity.x) * friction;
      velocity.x = walkSpeed + right;
    else
      velocity.x = walkSpeed + right;


    position.add(velocity);





    if (position.y >= ground - size.y) {
      position.y = ground - size.y;
      velocity.y = 0;
    }


    connected = false;
    pushed=false;
    obsManager.handleCollision();

    if ((position.y == ground - size.y || connected) && up == -1) {
      velocity.y = -jumpSpeed;
    } else if (up == 1)
    {
      velocity.y += gravity;
    }

    if (!pushed)
    {
      if (position.x < c.x - width/3)
        position.x = c.x - width/3;
      else if (position.x > c.x - width/3 + 300)
        position.x = c.x - width/3 + 300;
    }

    updateImg();
  }

  void updateImg()
  {
    if (velocity.x >= 0)
      faceRight = true;
    else
      faceRight = false;

    if (down == 1 && faceRight)
    {
      size = new PVector(imagers.width, imagers.height);
      image = imagers;
    } else if (faceRight)
    {
      size = new PVector(imager.width, imager.height);
      image = imager;
    }
  }


  void display()
  {
    pushMatrix();

    translate(position.x, position.y);
    scale(1, 1);

    imageMode(CORNER);
    image(image, 0, 0);

    popMatrix();
  }
}