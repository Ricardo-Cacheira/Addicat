class Cat
{
  PImage image, imager, imager2, imagers, imagers0, imagers1, imagers2, imagers3, imagers4, imagers5, imagers6, imagers7, imagers8;
  float right, up, down, previous_down, frameCounter= 0, runImg = 1, imgHeightDifference;
  PVector position, velocity, size;
  boolean faceRight, connected, pushed;
  float jumpSpeed, walkSpeed, friction;

  Cat(float jumpSpeed, float walkSpeed, PVector velocity, float fric, PImage imager, PImage imager2, PImage imagers)
  {
    this.imager = imager;
    this.imager2 = imager2;
    this.imagers = imagers;
    this.imagers1 = imagers1;
    this.imagers2 = imagers2;
    this.imagers3 = imagers3;
    this.imagers4 = imagers4;
    this.imagers5 = imagers5;
    this.imagers6 = imagers6;
    this.imagers7 = imagers7;
    this.imagers8 = imagers8;
    this.size = new PVector(imager.width, imager.height);
    this.imgHeightDifference = imager.height - imagers.height;
    this.position = new PVector(gm.c.x - width/3, height - 100);
    this.faceRight = true;
    this.down = 0;
    this.previous_down = 0;
    this.velocity = velocity;
    this.jumpSpeed = jumpSpeed;
    this.walkSpeed = walkSpeed;
    this.friction = fric;
    this.right = -3;
    this.connected = false;
    this.pushed = false;

    updateImg();
  }

  boolean outOfScreen()
  {
    return position.x + size.x < gm.c.x - width / 2;
  }

  void update()
  {
    updateImg();
    walkSpeed = gm.scrollingSpeed();
    velocity.y += gm.gravity();
    if (down == 1 && (position.y == gm.ground() - size.y || connected))
      //velocity.x = (velocity.x) * friction;
      velocity.x = walkSpeed + right;
    else
      velocity.x = walkSpeed + right;


    position.add(velocity);





    if (position.y >= gm.ground() - size.y) {
      position.y = gm.ground() - size.y;
      velocity.y = 0;
    }


    connected = false;
    pushed=false;
    gm.obsManager.handleCollision();

    if ((position.y == gm.ground() - size.y || connected) && up == -1) {
      jump();
    } else if (up == 1)
    {
      velocity.y += gm.gravity();
    }

    if (!pushed)
    {
      if (position.x < gm.c.x - width/3)
        position.x = gm.c.x - width/3;
      else if (position.x > gm.c.x - width/3 + 300)
        position.x = gm.c.x - width/3 + 300;
    }
  }

  void updateImg()
  {
    if (down == 1 && faceRight)
    {
      if (previous_down != 1)
        position.y = position.y + imgHeightDifference;

      size = new PVector(imagers.width, imagers.height);
      image = imagers;
      previous_down = 1;
    } else if (faceRight)
    {
      if (frameCounter <= 5)
        frameCounter++;
      else
        if (runImg == 1)
        {
          runImg = 2; 
          frameCounter = 0;
        } else if (runImg == 2)
        {
          runImg = 1;
          frameCounter = 0;
        }


      if (previous_down == 1)
        position.y = position.y - imgHeightDifference;

      if (runImg == 1)
      {
        size = new PVector(imager.width, imager.height);
        image = imager;
      } else
      {
        size = new PVector(imager2.width, imager2.height);
        image = imager2;
      }

      previous_down = 0;
    }
  }

  void jump()
  {
    velocity.y = -jumpSpeed;
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