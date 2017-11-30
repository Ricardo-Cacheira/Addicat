void keyPressed()
{
  if (key == 'd' || key == 'D')
  {
    right = 1;
  }
  if (key == 'a' || key == 'A')
  {
    left = -1;
  }
  if (key == ' ')
  {
    if (down != 1)
      up = -1;
  }
  if (key == 'w' || key == 'W')
  {
    if (down != 1)
      up = -1;
  }
  if (key == 's' || key == 'S')
  {
    down = 1;
  }
  if (key == 'r' || key == 'R')
  {
    junkieMode = !junkieMode;
  }
}

void keyReleased()
{
  if (key == 'd' || key == 'D')
  {
    right = 0;
  }
  if (key == 'a' || key == 'A')
  {
    left = 0;
  }
  if (key == ' ')
  {
    up = 0;
  }
   if (key == 'w' || key == 'W')
  {
    up = 0;
  }
  if (key == 's' || key == 'S')
  {
    down = 0;
  }
}