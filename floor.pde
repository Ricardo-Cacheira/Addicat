final int GRID_SIZE = 25;
int halfScreen;
int interval;
int startMillis;
//

int[] Moving_Background_Timer = new int[1000000];

int currentPos;
int scrollPos = GRID_SIZE;

void iniFloor()
{

  for (int i = 0; i < Moving_Background_Timer.length; i++)
  {
    if (random(1) > 0.85)
    {
      Moving_Background_Timer[i] = int(random(width / GRID_SIZE));
    }
  }
  // Half screen in terms of grid size
  halfScreen = currentPos = width / GRID_SIZE/2;

}



void drawFloor()
{
for (int i = currentPos - halfScreen, j = 0; i < currentPos + halfScreen - 1; i++, j--)
  {
    if (Moving_Background_Timer[i] > -10)
    {
      //  fill(255,255,0);
      rect(scrollPos + j * 26, height-30, width, 50);
    }
  }

  //++ makes it go the other way
  scrollPos--;
  //scrollPos %= halfScreen;
  if (scrollPos == 0)
  {
    currentPos++;
    scrollPos = GRID_SIZE ;
    if (currentPos == Moving_Background_Timer.length - halfScreen+25)
      exit(); // End
  }
}