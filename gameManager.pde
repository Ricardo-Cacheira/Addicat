class GameManager {

  void initialize() {
    drugLevel=new DrugLevel();
    fps_pos = new PVector(10, 20);
    //direction change sprite so it doesnt mirror it and stays consistent
    PVector vel = new PVector(0, 0);
    //Cat(String img, float jumpSpeed, float walkSpeed, PVector velocity, float fric)
    player = new Cat("cat.png", 20, 10, vel, 0.99);
    c = new Camera();
    ground =  height - 30;
    gravity = .6;
    p = new PVector(0, 0);
    obsManager = new ObstacleManager(p);
    lastMil = 0;
    iniFloor();
    gameEnd = false;
    junkieMode = false;
  }

  void gameOver() {

    background(0);
    textSize(100);
    fill(#FF0000);
    text("You're Sober\nGame Over", 200, height/2-100);
    gameEnd = true;
  }
}