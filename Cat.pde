class Cat
{
  PImage image, imager, imager2, imagers;
  float right, up, down, frameCounter= 0, runImg = 1;
  PVector position, velocity, size;
  boolean faceRight, connected, pushed;
  float jumpSpeed, walkSpeed, friction;

  Cat(float jumpSpeed, float walkSpeed, PVector velocity, float fric)
  {
    this.imager = loadImage("catr1.png");
    this.imager2 = loadImage("catr2.png");
    this.imagers = loadImage("catrs.png");
    this.size = new PVector(imager.width, imager.height);
    this.position = new PVector(400, height - 100);
    this.faceRight = true;
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
    if (gm.get_scrollingSpeed() < 20)
      gm.increase_walkSpeed(gm.c.multi);
    velocity.y += gm.get_gravity();
    if (down == 1 && (position.y == gm.get_ground() - size.y || connected))
      //velocity.x = (velocity.x) * friction;
      velocity.x = walkSpeed + right;
    else
      velocity.x = walkSpeed + right;


    position.add(velocity);





    if (position.y >= gm.get_ground() - size.y) {
      position.y = gm.get_ground() - size.y;
      velocity.y = 0;
    }


    connected = false;
    pushed=false;
    gm.obsManager.handleCollision();

    if ((position.y == gm.get_ground() - size.y || connected) && up == -1) {
      jump();
    } else if (up == 1)
    {
      velocity.y += gm.get_gravity();
    }

    if (!pushed)
    {
      if (position.x < gm.c.x - width/3)
        position.x = gm.c.x - width/3;
      else if (position.x > gm.c.x - width/3 + 300)
        position.x = gm.c.x - width/3 + 300;
    }

    updateImg();
  }

  void updateImg()
  {
    if (down == 1 && faceRight)
    {
      size = new PVector(imagers.width, imagers.height);
      image = imagers;
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


      if (runImg == 1)
      {
        size = new PVector(imager.width, imager.height);
        image = imager;
      } else
      {
        size = new PVector(imager2.width, imager2.height);
        image = imager2;
      }
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