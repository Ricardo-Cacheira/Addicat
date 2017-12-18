void keyPressed()
{
  if (key == CODED) {
    if (keyCode == RIGHT) 
    {
      player.right = 3;
    }
    if (keyCode == UP)
    {
      if (player.down != 1)
        player.up = -1;
    }
    if (keyCode == DOWN)
    {
      player.down = 1;
    }
  } else
  {
    if (key == 'r' || key == 'R')
    {
      junkieMode = !junkieMode;
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

void keyReleased()
{
  if (keyCode == RIGHT)
  {
    player.right = -3;
  }
  if (keyCode == UP)
  {
    player.up = 1;
  }
  if (keyCode == DOWN)
  {
    player.down = 0;
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