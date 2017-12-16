// GLOBAL VARIABLES
Cat player;
Camera c;
ObstacleManager obsManager;
DrugLevel drugLevel;
GameManager gm;
float fps, lastMil;
float scrollingSpeed;
float multi;
PVector fps_pos, p;
float gravity = .5;// half a pixel per frame gravity.
float ground;// Y coordinate of ground for collisions
boolean gameEnd, gamePause, connected, junkieMode, pushed;

//void settings() {
//  size(3*displayWidth>>2, 3*displayHeight>>2);
//}

void setup()
{
  //fullScreen(P2D);
  size(1200, 700);
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

  gm.mousePos = new PVector(mouseX, mouseY);

  if (gamePause)
  {
    gm.displayMenu();
  } else
  {    
    if (!gameEnd)
    {
      player.update();

      obsManager.update();
      c.update();
      
      if(player.outOfScreen())
      gm.restart();
    }

    rect(0, ground, width, 60);
    drugLevel.display();
    c.adjustDisplay();
    player.display();
    fps();
    obsManager.display();
    println(pushed);
  }
  
}

void mousePressed()
{
  if (mouseButton == LEFT)
  {
    if (gamePause)
    {
      if (gm.get_mousePos().dist(gm.get_bPos()) < gm.get_buttonRadius())
      {
        gm.play();
      }
    }
  }
}