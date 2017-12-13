class Cat
{
  PImage image, imager, imagel, imagers, imagels;
  float left, right, up, down;
  PVector position, velocity, size;
  boolean faceRight;
  float jumpSpeed, walkSpeed, friction;
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
    
    updateImg();
  }
  
  void input()
  {
    
  }


  void update()
  {
    if (scrollingSpeed < 20)
      walkSpeed += multi;
    velocity.y += gravity;
    if (down == 1 && (position.y == ground - size.y || connected))
      velocity.x = (velocity.x) * friction;
    else
      if (!faceRight)
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
    updateImg();
  }

  void updateImg()
  {
    if(velocity.x >= 0)
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

    if (down == 1 && !faceRight)
    {
      size = new PVector(imagels.width, imagels.height);
      image = imagels;
    } else if (!faceRight)
    {
      size = new PVector(imagel.width, imagel.height);
      image = imagel;
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