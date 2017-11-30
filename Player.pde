class Cat
{
  PImage image;
  PVector position, velocity;
  boolean faceRight, faceLeft;
  float jumpSpeed, walkSpeed, friction, scale = 4;
  //1 - Right, 2 - Left, 3 - Slide Right, 4 - Slide Left,
  int currentDir, newDir, newWidth, newHeight;

  Cat(String img, float jumpSpeed, float walkSpeed, PVector velocity, float fric)
  {
    this.image = loadImage(img);
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
    if (down == 1 && (position.y == ground - image.height/2 || connected))
      velocity.x = (velocity.x) * friction;
    else
      velocity.x = walkSpeed * (left + right);
    position.add(velocity);

    if (position.y >= ground - image.height/2) {
      position.y = ground - image.height/2;
      velocity.y = 0;
    }

    connected = false;
    obsManager.handleCollision();

    if ((position.y == ground - image.height/2 || connected) && up == -1) {
      velocity.y = -jumpSpeed;
    }
  }

  void updateImg()
  {
    if (faceRight)
    {
      image = loadImage("catr1.png");
      currentDir = 1;
    }
    if (down == 1 && faceRight)
    {
      image = loadImage("catrs.png");
      currentDir = 3;
    }
    if (down == 1 && faceLeft)
    {
      image = loadImage("catls.png");
      currentDir = 4;
    } else if (faceLeft)
    {
      image = loadImage("catl1.png");
      currentDir = 2;
    }

    newWidth = int(scale * image.width / 30);
    newHeight = int(scale * image.height / 30);
  }


  void display()
  {
    pushMatrix();

    translate(position.x, position.y);

    // com 1,1 a imagem tem de estar flipada com o outro metodo ele flipa a imagem por nós
    // ou seja temos de fazer um espelho n espelhado
    scale(1, 1);
    // We're using direction because a -1 scale flips the image in that direction.
    //scale(direction,1);

    if (velocity.x > 0)
    {
      faceLeft = false;
      faceRight = true;
    } else if (velocity.x < -scrollingSpeed)
    {
      faceRight = false;
      faceLeft = true;
    }
    imageMode(CENTER);
    if (faceRight)
    {
      newDir = 1;
    }
    if (down == 1 && faceRight)
    {
      newDir = 3;
    }
    if (down == 3 && faceLeft)
    {
      newDir = 4;
    } else if (faceLeft)
    {
      newDir = 2;
    }

    if (newDir != currentDir)
      updateImg();

    image.resize(newWidth, newHeight);
    ///fix slide jump
    image(image, 0, 0);
    
    println(image.height);

    popMatrix();
  }
}