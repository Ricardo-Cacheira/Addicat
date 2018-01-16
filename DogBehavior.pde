class Dog {

  PVector position;
  PVector baloonPosition;
  PImage dog;
  PImage baloon;
  float frameDogOn, frameDogOff;
  //boolean DogOn=false, baloonVisible=false;
  boolean baloonVisible;

  Dog(PImage Dog, PImage baloon)
  {
    position= new PVector(gm.c.x-(width/2)-600 /*< - mudar valor*/, gm.player.position.y/1.277);
    baloonPosition = new PVector(gm.c.x-(width/2)+2, gm.player.position.y/2);
    this.dog = Dog;
    this.baloon = baloon;
    baloonVisible=false;
  }

  void display() {

    /* timer();
     
     if (DogOn==true) {
     
     baloonVisible=true;
     
     if (baloonPosition.x<=position.x+249) {
     baloonVisible=false;
     }
     
     baloon();
     
     if (position.x<gm.c.x - width/3) {
     position.x+=gm.get_scrollingSpeed()+3;
     } else {
     position.x+=gm.get_scrollingSpeed();
     }
     } else if (DogOn==false) {
     
     position.x+=gm.get_scrollingSpeed()-2;
     if (position.x<gm.c.x-(width/2)-300) {
     
     position.x=gm.c.x-(width/2)-300;
     }
     }
     */

    imageMode(CORNER);
    image(dog, position.x, position.y);

    dog.resize(249, 200);
  }

  boolean isColliding(Cat cat)
  {
    return cat.position.x + cat.size.x > position.x
      && cat.position.x < position.x + 200
      && cat.position.y + cat.size.y > position.y
      && cat.position.y < position.y + 200
      && !gm.junkieMode;
  }

  void update(Cat player) {
    pushMatrix();
    position.x+= player.velocity.x+1.5; //novo codigo
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