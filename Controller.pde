class Controller {

  void keyPressed(char key, int keyCode)
  {

    if (key == CODED) {
      //if (keyCode == RIGHT) 
      //{
      //  gm.player.right = 3;
      //}
      if (keyCode == UP)
      {
        if (!gm.player.down)
          gm.player.up = true;
      }
      if (keyCode == DOWN)
      {
        gm.player.down = true;
      }
    } else
    {
      if (key == 'r' || key == 'R')
      {
        gm.junkieMode = !gm.junkieMode;
      }
      if (key == 'p' || key == 'P')
      {
        gm.restart();
      }
      if (key==' ')
      {
        gm.switchState();
      }
      //if (key == 'l' || key == 'L')
      //{
      //  //lose
      //  drugLevel.sizex = 0;
      //}
    }
  }

  void keyReleased(char key, int keyCode)
  {
    if (keyCode == RIGHT)
    {
      gm.player.right = 0;
    }
    if (keyCode == UP)
    {
      gm.player.up = false;
    }
    if (keyCode == DOWN)
    {
      gm.player.down = false;
    }
  }

  void mousePressed()
  {
    if (mouseButton == LEFT)
    {
      if (gm.gamePause)
      {
        if (gm.mousePosition().dist(gm.buttonPosition()) < gm.buttonRadius())
        {
          gm.play();
        }
      }
    }
  }
}