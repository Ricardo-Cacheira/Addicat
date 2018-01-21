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

  private float lastSpawn, startMillis, startHigh, highTime = 5000;
  private float scrollingSpeed, scrollingSpeedHigh;
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
    buttonPosition = new PVector(width/2, height/2);
    buttonRadius = 100;
    //song.loop();
    startHigh = 0;
    high = false;
    bg = new Background(ImgPreloader.FirstLayer, ImgPreloader.SecondLayer, ImgPreloader.ThirdLayer, ImgPreloader.FirstLayerHigh, ImgPreloader.SecondLayerHigh, ImgPreloader.ThirdLayerHigh);
    scrollingSpeed = 12;
    scrollingSpeedHigh = 5;

    ground =  height - 30;
    gravity = .9;
    junkieMode = false;
  }

  PVector mousePosition()
  {
    mousePosition = new PVector(mouseX, mouseY);
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
    song.loop();
    startHigh = 0;
    high = false;
    bg = new Background(ImgPreloader.FirstLayer, ImgPreloader.SecondLayer, ImgPreloader.ThirdLayer, ImgPreloader.FirstLayerHigh, ImgPreloader.SecondLayerHigh, ImgPreloader.ThirdLayerHigh);
    //drugLevel=new DrugLevel(ImgPreloader.bar);
    hud = new HUD(ImgPreloader.bar);
    scrollingSpeed = 12;
    PVector vel = new PVector(0, 0);
    c = new Camera(0.0001);
    player = new Cat(20, scrollingSpeed, vel, 0.99, ImgPreloader.imager, ImgPreloader.imager2, ImgPreloader.imagers);
    lastSpawn = c.x;
    startMillis = millis();
    obsGenerator = new ObstacleGenerator(int(startMillis));
    obsManager = new ObstacleManager();    
    dog = new Dog(ImgPreloader.dog0, ImgPreloader.dog1, ImgPreloader.dog2, ImgPreloader.dog3, ImgPreloader.baloon);
    gamePause = false;
  }

  void gameOverScreen() {
    pushStyle();
    imageMode(CENTER);
    if (player.outOfScreen() || dog.isColliding(player))
      image(ImgPreloader.GOdog, width/2, height/2);
    else if (player.outOfBar())
      image(ImgPreloader.GOsober, width/2, height/2);
    else if (player.ov)
      image(ImgPreloader.GOov, width/2, height/2);
    popStyle();
  }

  void restart()
  {
    song.stop();
    song.loop();
    startHigh = 0;
    high = false;
    bg = new Background(ImgPreloader.FirstLayer, ImgPreloader.SecondLayer, ImgPreloader.ThirdLayer, ImgPreloader.FirstLayerHigh, ImgPreloader.SecondLayerHigh, ImgPreloader.ThirdLayerHigh);
    //drugLevel=new DrugLevel(ImgPreloader.bar);
    hud = new HUD(ImgPreloader.bar);
    scrollingSpeed = 12;
    PVector vel = new PVector(0, 0);
    c = new Camera(0.0001);
    player = new Cat(20, scrollingSpeed, vel, 0.99, ImgPreloader.imager, ImgPreloader.imager2, ImgPreloader.imagers);
    lastSpawn = c.x;
    startMillis = millis();
    obsGenerator = new ObstacleGenerator(int(startMillis));
    obsManager = new ObstacleManager();    
    dog = new Dog(ImgPreloader.dog0, ImgPreloader.dog1, ImgPreloader.dog2, ImgPreloader.dog3, ImgPreloader.baloon);
    gamePause = false;
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
    return player.outOfScreen() || player.outOfBar() || dog.isColliding(player) || player.ov;
  }

  void update()
  {
    if (high)
      if (millis() > startHigh + highTime)
      {
        switchState();
      }

    bg.update();

    obsManager.update();
    dog.update();
    c.update();
    player.update();
  }

  void display()
  {
    bg.display();
    hud.displayBar(hud, player);
    c.adjustDisplay();
    obsManager.display();
    dog.display();
    player.display();
    hud.fps();
    hud.score();
    println(c.x - dog.position.x + "\r"+ "\n");
  }

  void switchState()
  {
    high = !high;
    if (high)
      startHigh = millis();
    else
      player.level = 200;

    obsManager.restart();

    obsManager.cooldown = 500;
  }
}