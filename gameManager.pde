class GameManager {
  Cat player;
  Camera c;
  ObstacleManager obsManager;
  ObstacleGenerator obsGenerator;
  DrugLevel drugLevel;
  Background bg;
  Dog dog;
  HUD hud;
  float lastMil, startMillis;
  float scrollingSpeed;
  float multi;
  float gravity = .5; // half a pixel per frame gravity.
  float ground;// Y coordinate of ground for collisions
  boolean gamePause, high, junkieMode;
  PVector mousePos, bPos;
  int buttonRadius;
  PImage play, menuBackground, GOdog, GOov, GOsober;

  GameManager()
  {
    gamePause = true;
    play = loadImage("play.png");
    menuBackground = loadImage("menu_background.png");
    menuBackground.resize(width, height);
    GOdog = loadImage("GOdog.png");
    GOov = loadImage("GOov.png");
    GOsober = loadImage("GOsober.png");
    mousePos = new PVector(mouseX, mouseY);
    bPos = new PVector(width/2, height/2);
    buttonRadius = 100;
  }

  PVector get_mousePos()
  {
    return mousePos;
  }

  float get_scrollingSpeed()
  {
    return scrollingSpeed;
  }

  void increase_scrollingSpeed(float multi)
  {
    scrollingSpeed += multi;
  }
  void increase_walkSpeed(float multi)
  {
    player.walkSpeed += multi;
  }

  float get_gravity()
  {
    return gravity;
  }

  float get_ground()
  {
    return ground;
  }

  PVector get_bPos()
  {
    return bPos;
  }

  int get_buttonRadius()
  {
    return buttonRadius;
  }

  void play() {
    high = false;
    bg = new Background();
    drugLevel=new DrugLevel();
    scrollingSpeed = 10;
    //direction change sprite so it doesnt mirror it and stays consistent
    PVector vel = new PVector(0, 0);
    //Cat(float jumpSpeed, float walkSpeed, PVector velocity, float fric)
    player = new Cat(20, scrollingSpeed, vel, 0.99);
    c = new Camera(0.0001);
    hud = new HUD();
    ground =  height - 30;
    gravity = .9;
    lastMil = millis();
    startMillis = millis();
    obsGenerator = new ObstacleGenerator(int(lastMil));
    obsManager = new ObstacleManager();    
    dog = new Dog();
    junkieMode = false;
    gamePause = false;
  }

  void gameOverScreen() {
    pushStyle();
    imageMode(CENTER);
    if (player.outOfScreen() || dog.isColliding(player))
      image(GOdog, width/2, height/2);
    else if (drugLevel.outOfBar())
      image(GOsober, width/2, height/2);
    else if (drugLevel.ov)
      image(GOov, width/2, height/2);
    popStyle();
  }

  void restart()
  {
    high = false;
    lastMil = millis();
    obsManager.restart();
    multi  = 0.0001;
    scrollingSpeed = 10;
    drugLevel=new DrugLevel();
    PVector vel = new PVector(0, 0);
    player = new Cat(20, scrollingSpeed, vel, 0.99);
    c = new Camera(0.0001);
    startMillis = millis();
    dog = new Dog();
    junkieMode = false;
  }

  void displayMenu()
  {
    pushStyle();
    imageMode(CENTER);
    image(menuBackground, width/2, height/2);
    image(play, width/2, height/2);
    popStyle();
  }

  boolean gameOver()
  {
    return player.outOfScreen() || drugLevel.outOfBar() || dog.isColliding(player) || drugLevel.ov;
  }

  void update()
  {
    bg.update();

    obsManager.update();
    dog.update();
    player.update();
    c.update();
  }

  void display()
  {
    bg.display();
    drugLevel.display();
    c.adjustDisplay();
    obsManager.display();
    dog.display();
    player.display();
    hud.fps();
    hud.score();
  }
}