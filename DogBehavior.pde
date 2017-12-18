class Dog {

  PVector position= new PVector(c.x-(width/2)-600, player.position.y/1.277);
  PVector baloonPosition = new PVector(c.x-(width/2)+2, player.position.y/2);
  PImage dog = loadImage("dog.png");
  PImage baloon = loadImage("baloon.png");
  float frameDogOn, frameDogOff;
  boolean DogOn=false, baloonVisible=false;

  void display() {

    timer();


    println(player.position.x);
    println(player.position.y);


    if (DogOn==true) {

      baloonVisible=true;




      if (position.x<c.x - width/3) {
        position.x+=scrollingSpeed+3;
      } else {
        position.x+=scrollingSpeed;
      }
    } else if (DogOn==false) {

      position.x+=scrollingSpeed-2;
      if (position.x<c.x-(width/2)-300) {

        position.x=c.x-(width/2)-300;
      }
    }

    if (baloonPosition.x<=position.x+249) {
      baloonVisible=false;
    }

    imageMode(CORNER);
    image(dog, position.x, position.y);
    println(baloonVisible);
    if (baloonVisible==true) {
      baloonPosition.x=c.x-(width/2)+2;
      image(baloon, baloonPosition.x, baloonPosition.y);
    }
    dog.resize(249, 200);
    //baloon();
  }

  boolean isColliding(Cat cat)
  {

    return cat.position.x + cat.size.x > position.x
      && cat.position.x < position.x + 200
      && cat.position.y + cat.size.y > position.y
      && cat.position.y < position.y + 200;
  }

  void update() {
    pushMatrix();
    translate(position.x, position.y);
    popMatrix();
  }

  void baloon() {
    if (baloonVisible==true) {
      baloonPosition.x=c.x-(width/2)+2;
    } else if (baloonVisible==false) {
      baloonPosition.x=c.x-(width/2)-300;
    }
  }

  void timer() {

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
    }
  }
}