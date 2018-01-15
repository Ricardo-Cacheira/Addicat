GameManager gm;
Controller controller;

void setup()
{
  //fullScreen(P2D);
  size(1200, 700, P2D);
  frameRate(60);
  gm = new GameManager();
  controller = new Controller();
}

void draw()
{
  background(255);
  fill(#005588);
  //imageMode(CORNER);
  //image(backgroundImage,0,0);

  gm.mousePos = new PVector(mouseX, mouseY);

  if (gm.gamePause)
  {
    gm.displayMenu();
  } else
  {
    if (!gm.gameOver())
    {
      gm.update();

      gm.display();
    } else
      gm.gameOverScreen();
  }
}

void keyPressed() {
  if (!gm.gamePause)
  {
    controller.keyPressed(key, keyCode);
  }
}

void keyReleased() {
  if (!gm.gamePause)
  {
    controller.keyReleased(key, keyCode);
  }
}

void mousePressed()
{
  controller.mousePressed();
}