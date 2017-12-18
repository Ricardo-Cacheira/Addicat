// GLOBAL VARIABLES//comment
Cat player;
Camera c;
ObstacleManager obsManager;
ObstacleGenerator obsGenerator;
DrugLevel drugLevel;
GameManager gm;
Background bg;
Dog dog;
float fps, lastMil;
float scrollingSpeed;
float multi;
PVector fps_pos, p;
float gravity = .5; // half a pixel per frame gravity.
float ground;// Y coordinate of ground for collisions
boolean gamePause, connected, junkieMode, pushed;

void setup()
{
  //fullScreen(P2D);
  size(1200, 700, P2D);
  frameRate(60);
  gm = new GameManager();
  gm.initialize();
}

void fps()
{
  fps_pos.x = c.x - width/2 + 20;
  pushStyle();
  fill(255);
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

  gm.mousePos = new PVector(mouseX, mouseY);

  if (gamePause)
  {
    gm.displayMenu();
  } else
  {
    if (!player.outOfScreen() && !drugLevel.outOfBar())
    {
      bg.update();

      obsManager.update();
      dog.update();
      player.update();
      c.update();


      bg.display();
      drugLevel.display();
      c.adjustDisplay();
      obsManager.display();
      dog.display();
      player.display();
      fps();
      println(dog.baloonVisible);
      
    } else
      gm.gameOver();
  }
}