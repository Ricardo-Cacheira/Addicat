class GameManager {
  Cat player;
  Camera c;
  ObstacleManager obsManager;
  ObstacleGenerator obsGenerator;
  DrugLevel drugLevel;
  Background bg;
  Dog dog;
  HUD hud;
  ImagePreloader ImgPreloader;
  private float lastMil, startMillis;
  private float scrollingSpeed;
  private float multi;
  private float gravity = .5; // half a pixel per frame gravity.
  private float ground;// Y coordinate of ground for collisions
  private boolean gamePause, high, junkieMode, flash;
  private PVector mousePosition, buttonPosition;
  private int buttonRadius;

  GameManager()
  {
    flash = false;
    gamePause = true;
    ImgPreloader = new ImagePreloader();
    mousePosition = new PVector(mouseX, mouseY);
    buttonPosition = new PVector(width/2, height/2);
    buttonRadius = 100;
  }

  PVector mousePosition()
  {
    return mousePosition;
  }

  float scrollingSpeed()
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

  float gravity()
  {
    return gravity;
  }

  float ground()
  {
    return ground;
  }

  PVector buttonPosition()
  {
    return buttonPosition;
  }

  int buttonRadius()
  {
    return buttonRadius;
  }

  void play() {
    high = false;
    bg = new Background(ImgPreloader.FirstLayer, ImgPreloader.SecondLayer, ImgPreloader.ThirdLayer, ImgPreloader.FirstLayerHigh, ImgPreloader.SecondLayerHigh, ImgPreloader.ThirdLayerHigh);
    drugLevel=new DrugLevel(ImgPreloader.bar);
    scrollingSpeed = 10;
    //direction change sprite so it doesnt mirror it and stays consistent
    PVector vel = new PVector(0, 0);
    //Cat(float jumpSpeed, float walkSpeed, PVector velocity, float fric)
    c = new Camera(0.0001);
    player = new Cat(20, scrollingSpeed, vel, 0.99, ImgPreloader.imager, ImgPreloader.imager2, ImgPreloader.imagers);
    hud = new HUD();
    ground =  height - 30;
    gravity = .9;
    lastMil = millis();
    startMillis = millis();
    obsGenerator = new ObstacleGenerator(int(lastMil));
    obsManager = new ObstacleManager();    
    dog = new Dog(ImgPreloader.dog, ImgPreloader.baloon);
    junkieMode = false;
    gamePause = false;
  }

  void gameOverScreen() {
    pushStyle();
    imageMode(CENTER);
    if (player.outOfScreen() || dog.isColliding(player))
      image(ImgPreloader.GOdog, width/2, height/2);
    else if (drugLevel.outOfBar())
      image(ImgPreloader.GOsober, width/2, height/2);
    else if (drugLevel.ov)
      image(ImgPreloader.GOov, width/2, height/2);
    popStyle();
  }

  void restart()
  {
    high = false;
    lastMil = millis();
    obsManager.restart();
    multi  = 0.0001;
    scrollingSpeed = 10;
    drugLevel=new DrugLevel(ImgPreloader.bar);
    PVector vel = new PVector(0, 0);
    player = new Cat(20, scrollingSpeed, vel, 0.99, ImgPreloader.imager, ImgPreloader.imager2, ImgPreloader.imagers);
    c = new Camera(0.0001);
    startMillis = millis();
    dog = new Dog(ImgPreloader.dog, ImgPreloader.baloon);
    junkieMode = false;
  }

  void displayMenu()
  {
    pushStyle();
    imageMode(CENTER);
    image(ImgPreloader.menuBackground, width/2, height/2);
    image(ImgPreloader.play, width/2, height/2);
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
    dog.update(player);
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

  void switchState()
  {
    high = !high;
    obsManager.restart();
    flash = true;
  }

  void flash()
  {
    pushStyle();
    int alpha = 1, delta = 5;

    if (alpha >= 255) { 
      delta = -delta;
    }

    if (alpha > 0) { 
      alpha += delta;
    } else flash = false;

    fill(255, alpha);
    rectMode(CENTER);
    rect(c.x, c.y, width, height);
    popStyle();
  }
}