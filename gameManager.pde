class GameManager {

  PVector mousePos, bPos;
  int buttonRadius;
  PImage play, menuBackground;

  PVector get_mousePos()
  {
    return mousePos;
  }
  
  PVector get_bPos()
  {
    return bPos;
  }
  
  int get_buttonRadius()
  {
    return buttonRadius;
  }

  void initialize()
  {
    gamePause = true;
    play = loadImage("play.png");
    menuBackground = loadImage("menu_background.png");
    menuBackground.resize(width, height);
    mousePos = new PVector(mouseX, mouseY);
    bPos = new PVector(width/2, height/2);
    buttonRadius = 100;
  }

  void play() {
    drugLevel=new DrugLevel();
    multi  = 0.0001;
    scrollingSpeed = 10;
    fps_pos = new PVector(10, 20);
    //direction change sprite so it doesnt mirror it and stays consistent
    PVector vel = new PVector(0, 0);
    //Cat(float jumpSpeed, float walkSpeed, PVector velocity, float fric)
    player = new Cat(17, scrollingSpeed, vel, 0.99);
    c = new Camera();
    ground =  height - 30;
    gravity = .7;
    p = new PVector(0, 0);
    obsManager = new ObstacleManager(p);
    lastMil = millis();
    gameEnd = false;
    junkieMode = false;
    pushed = false;
    gamePause = false;
  }

  void gameOver() {

    background(0);
    textSize(100);
    fill(#FF0000);
    text("You're Sober\nGame Over", 200, height/2-100);
    gameEnd = true;
  }

  void restart()
  {
    lastMil = millis();
    obsManager.restart();
    multi  = 0.0001;
    scrollingSpeed = 10;
    drugLevel=new DrugLevel();
    fps_pos = new PVector(10, 20);
    PVector vel = new PVector(0, 0);
    player = new Cat(17, scrollingSpeed, vel, 0.99);
    c = new Camera();
    p = new PVector(0, 0);
    gameEnd = false;
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
}