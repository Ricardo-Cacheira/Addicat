import processing.sound.*;
GameManager gm;
Controller controller;
SoundFile song;

void setup()
{
  //fullScreen(P2D);
  size(1200, 700, P2D);
  frameRate(60);
  song = new SoundFile(this, "cat-song.wav");
  controller = new Controller();

  gm = new GameManager();
}

void draw()
{
  background(255);
  fill(#005588);
  //imageMode(CORNER);
  //image(backgroundImage,0,0);
  gm.mousePosition();

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
    {
      gm.gameOverScreen();
    }
  }
}

void keyPressed() {
  if (!gm.gamePause)
  {
    controller.keyPressed(key, keyCode);
  } else
  {
    gm.play();
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