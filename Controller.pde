class Controller {

  void keyPressed(char key, int keyCode)
  {
    if (key == CODED) {
      if (keyCode == RIGHT) 
      {
        gm.player.right = 3;
      }
      if (keyCode == UP)
      {
        if (gm.player.down != 1)
          gm.player.up = -1;
      }
      if (keyCode == DOWN)
      {
        gm.player.down = 1;
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
      gm.player.right = -3;
    }
    if (keyCode == UP)
    {
      gm.player.up = 1;
    }
    if (keyCode == DOWN)
    {
      gm.player.down = 0;
    }
  }

  void mousePressed()
  {
    if (mouseButton == LEFT)
    {
      if (gm.gamePause)
      {
        if (gm.get_mousePos().dist(gm.get_bPos()) < gm.get_buttonRadius())
        {
          gm.play();
        }
      }
    }
  }
}