class Dog {

  private PVector position;
  private PVector baloonPosition;
  private int Img = 0;
  private PImage dog;
  private PImage dog0;
  private PImage dog1;
  private PImage dog2;
  private PImage dog3;
  private PImage baloon;
  private int frameCounter = 0;
  private float frameDogOn, frameDogOff;
  //boolean DogOn=false, baloonVisible=false;
  private boolean baloonVisible;

  Dog(PImage dog0, PImage dog1, PImage dog2, PImage dog3, PImage baloon)
  {
    position= new PVector(gm.c.x-(width/2)-700 /*< - mudar valor*/, gm.player.position.y/1.277);
    baloonPosition = new PVector(gm.c.x-(width/2)+2, gm.player.position.y/2);
    this.dog = dog0;
    this.dog0 = dog0;
    this.dog1 = dog1;
    this.dog2 = dog2;
    this.dog3 = dog3;
    this.baloon = baloon;
    baloonVisible=false;
  }

  void display() {
    dog.resize(249, 200);

    imageMode(CORNER);
    image(dog, position.x, position.y);
  }

  boolean isColliding(Cat cat)
  {
    return cat.position.x + cat.size.x > position.x
      && cat.position.x < position.x + 200
      && cat.position.y + cat.size.y > position.y
      && cat.position.y < position.y + 200
      && !gm.junkieMode;
  }

  void update() {
    if (frameCounter <= 5)
      frameCounter++;
    else
      if (Img == 0)
      {
        Img = 1; 
        frameCounter = 0;
      } else if (Img == 1)
      {
        Img = 2;
        frameCounter = 0;
      } else if (Img == 2)
      {
        Img = 3;
        frameCounter = 0;
      } else if (Img == 3)
      {
        Img = 0;
        frameCounter = 0;
      }

    if (Img == 0)
    {
      dog = dog0;
    } else if (Img == 1)
    {
      dog = dog1;
    } else if (Img == 2)
    {
      dog = dog2;
    } else if (Img == 3)
    {
      dog = dog3;
    }




    pushMatrix();
    position.x+= gm.scrollingSpeed()+0.5; //novo codigo
    translate(position.x, position.y);
    popMatrix();
  }

  void baloon() {
    if (baloonVisible==true) {
      baloonPosition.x=gm.c.x-(width/2)+2;
    } else if (baloonVisible==false) {
      baloonPosition.x=gm.c.x-(width/2)-300;
    }

    image(baloon, baloonPosition.x, baloonPosition.y);
  }

  /*void timer() {
   
   frameDogOn++;
   
   if (DogOn==true) {
   if (frameDogOn>500) {
   frameDogOff=random(500, 1000);
   DogOn=false;
   
   frameDogOn=0;
   }
   } else if (frameDogOn>frameDogOff) {
   frameDogOn=0;
   DogOn=true;
   baloonVisible= true;
   }
   }*/
}