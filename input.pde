void keyPressed()
{
  if (key == 'd' || key == 'D')
  {
    player.right = 1;
  }
  if (key == 'a' || key == 'A')
  {
    player.left = -1;
  }
  if (key == 'w' || key == 'W')
  {
    if (player.down != 1)
      player.up = -1;
  }
  if (key == 's' || key == 'S')
  {
    player.down = 1;
  }
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

void keyReleased()
{
  if (key == 'd' || key == 'D')
  {
    player.right = 0;
  }
  if (key == 'a' || key == 'A')
  {
    player.left = 0;
  }
  if (key == 'w' || key == 'W')
  {
    player.up = 0;
  }
  if (key == 's' || key == 'S')
  {
    player.down = 0;
  }
}