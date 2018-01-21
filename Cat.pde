class Cat
{
  private PImage image, imager, imager2, imagers;
  private float right, previous_down, frameCounter= 0, flashCounter = 0, runImg = 1, imgHeightDifference;
  private PVector position, velocity, size;
  private boolean faceRight, connected, pushed, up, down;
  private float jumpSpeed, walkSpeed, friction;

  private float level;
  private boolean lifeTaker, lifeGiver;
  private boolean ov;
  private float num;


  Cat(float jumpSpeed, float walkSpeed, PVector velocity, float fric, PImage imager, PImage imager2, PImage imagers)
  {
    this.imager = imager;
    this.imager2 = imager2;
    this.imagers = imagers;
    this.size = new PVector(imager.width, imager.height);
    this.imgHeightDifference = imager.height - imagers.height;
    this.position = new PVector(gm.c.x - width/3, height - 100);
    this.faceRight = true;
    this.down = false;
    this.up = false;
    this.previous_down = 0;
    this.velocity = velocity;
    this.jumpSpeed = jumpSpeed;
    this.walkSpeed = walkSpeed;
    this.friction = fric;
    this.right = -3;
    this.connected = false;
    this.pushed = false;

    level = 250;
    lifeTaker=false;
    lifeGiver = false;
    ov = false;
    num = 0.2;

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
    if (down && (position.y == gm.ground() - size.y || connected))
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

    if ((position.y == gm.ground() - size.y || connected) && up) {
      jump();
    } else if (!up)
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
    //flash();

    if (down && faceRight)
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

  void displayBar(HUD hud, Cat player) {

    if (level!=0 && !lifeTaker && !lifeGiver) {
      if (!gm.junkieMode)
        level=level-num;
      hud.DrugMeter(player);
    } else if (level!=0 && lifeTaker && !lifeGiver) {
      if (!gm.junkieMode)
        level=level-5;
      hud.DrugMeter(player);
      lifeTaker=false;
    } else if (level!=0 && !lifeTaker && lifeGiver) {      
      if (!gm.junkieMode)
        level=level+50;
      if (gm.high && !gm.junkieMode)
        ov = true;

      if (level > 500)
      {
        level = 500;
      }
      hud.DrugMeter(player);
      lifeTaker=false;
      lifeGiver = false;
    }

    if (level<=0) {
      level=0;
      level=level+0;
    }
    //println(lifeTaker);
  }

  boolean outOfBar()
  {
    return level == 0;
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

  void flash()
  {
    gm.flash = true;

    if (flashCounter <= 5)
      flashCounter++;
    else
    {
      if (gm.flash)
      {
        tint(255); 
        flashCounter = 0;
      } else
        flashCounter = 0;
    }
  }
}