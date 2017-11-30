// GLOBAL VARIABLES
Cat player;
Camera c;
ObstacleManager obsManager;
DrugLevel drugLevel;
GameManager gm;
float fps, lastMil, left, right, up, down;
float scrollingSpeed = 6;
float multi = 0.0001;
PVector fps_pos, p;
float gravity = .5;// half a pixel per frame gravity.
float ground;// Y coordinate of ground for collision
boolean gameEnd, connected, junkieMode;

void setup()
{
  //fullScreen();
  size(1024, 728);
  smooth();
  frameRate(60);
  gm = new GameManager();
  gm.initialize();
}

void fps()
{
  fps_pos.x += scrollingSpeed;
  pushStyle();
  fill(0);
  textSize(14);
  fps = frameRate;
  text("FPS: " + String.format("%.0f", fps), fps_pos.x, fps_pos.y);
  popStyle();
}

void draw()
{



  background(255);
  fill(#005588);
  //imageMode(CORNER);
  //image(backgroundImage,0,0);

  if (!gameEnd)
  {
    player.updatePlayer();

    p.x = c.x;
    p.y = c.y;

    obsManager.update();
    c.update();
  }
  
  drugLevel.display();  
  drawFloor();  

  //println(last_mil);
  //println(p);
  //println("------------");

  c.adjustDisplay();
  player.display();
  //test_speed();

  fps();
 obsManager.display();
}