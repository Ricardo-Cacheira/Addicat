class ObstacleGenerator
{

  int duration, currentSection, startMillis;
  int easyProb, mediumProb, hardProb;
  int[][] sectionSettings = { {60, 100, 0, 0}, 
    {90, 80, 20, 0}, 
    {120, 60, 40, 0}, 
    {150, 40, 30, 30}, 
    {180, 30, 40, 30}, 
    {210, 20, 40, 40}, 
    {240, 10, 40, 50}, 
    {270, 10, 30, 60}, 
    {300, 10, 20, 70} };

  ObstacleGenerator(int lastmil)
  {
    startMillis = lastmil;
    currentSection = 0;
    duration = sectionSettings[currentSection][0];
    easyProb = sectionSettings[currentSection][1];
    mediumProb = sectionSettings[currentSection][2];
    hardProb = sectionSettings[currentSection][3];
  }

  void updateSettings()
  {
    if (millis() - startMillis > duration*1000)
      currentSection++;
    if (currentSection > 8)
      currentSection = 8;

    duration = sectionSettings[currentSection][0];
    easyProb = sectionSettings[currentSection][1];
    mediumProb = sectionSettings[currentSection][2];
    hardProb = sectionSettings[currentSection][3];
  }

  void pick()
  {
    updateSettings();
    
    int r = int(random(0, 101));
    
    if (r < easyProb)
    {
      int s = int(random(0, 3));

      switch(s) {
      case 0: 
        Easy0();
        break;
      case 1: 
        Easy1();
        break;
      case 2: 
        Easy2();
        break;
      }
    } else if (r < mediumProb + easyProb)
    {
      int s = int(random(0, 3)); 

      switch(s) {
      case 0: 
        Medium0();
        break;
      case 1: 
        Medium1();
        break;
      case 2: 
        Medium2();
        break;
      }
    } else
    {
      int s = int(random(0, 1)); //0 only

      switch(s) {
      case 0: 
        Hard0();
        break;
      case 1:
        Hard1();
        break;
      case 2: 
        Hard2();
        break;
      }
    }
  }
}

void Easy0()
{
  Obstacle o;
  o = new Platform(new PVector(c.x + width / 2 + 50, ground - 160), new PVector(300, 50));
  obsManager.obstacles.add(o);
  o = new Box(new PVector(c.x + width / 2 + 100, ground - 60), new PVector(60, 60));
  obsManager.obstacles.add(o);
  o = new TrashBin(new PVector(c.x + width / 2 + 260, ground - 255), new PVector(75, 95));
  obsManager.obstacles.add(o);
  Pill p = new Pill(new PVector(c.x + width / 2 + 400, ground - 500), new PVector(30, 30)); //30*30 only for the peace pill
  o = p;
  obsManager.pills.add(p);  
  obsManager.obstacles.add(o);
  obsManager.cooldown = 2000;
}

void Easy1()
{
  Obstacle o;
  o = new Platform(new PVector(c.x + width / 2 + 50, ground - 200), new PVector(300, 50));
  obsManager.obstacles.add(o);
  o = new Box(new PVector(c.x + width / 2 + 50, ground - 260), new PVector(60, 60));
  obsManager.obstacles.add(o);
  o = new Box(new PVector(c.x + width / 2 + 110, ground - 260), new PVector(60, 60));
  obsManager.obstacles.add(o);
  Pill p = new Pill(new PVector(c.x + width / 2 + 150, ground - 330), new PVector(30, 30)); //30*30 only for the peace pill
  o = p;
  obsManager.pills.add(p);  
  obsManager.obstacles.add(o);
  obsManager.cooldown = 2000;
}

void Easy2()
{  
  Obstacle o;
  o = new Spike(new PVector(c.x + width / 2 + 50, ground - 60), new PVector(62, 32));
  obsManager.obstacles.add(o);
  o = new Spike(new PVector(c.x + width / 2 + 110, ground - 60), new PVector(62, 32));
  obsManager.obstacles.add(o);
  o = new Spike(new PVector(c.x + width / 2 + 170, ground - 60), new PVector(62, 32));
  obsManager.obstacles.add(o);
  obsManager.cooldown = 2000;
}

void Medium0()
{
  Obstacle o;
  o = new Box(new PVector(c.x + width / 2 + 50, ground - 60), new PVector(60, 60));
  obsManager.obstacles.add(o);
  o = new Platform(new PVector(c.x + width / 2 + 300, ground - 200), new PVector(300, 50));
  obsManager.obstacles.add(o);
  o = new Box(new PVector(c.x + width / 2 + 300, ground - 260), new PVector(60, 60));
  obsManager.obstacles.add(o);
  o = new Box(new PVector(c.x + width / 2 + 360, ground - 260), new PVector(60, 60));
  obsManager.obstacles.add(o);
  o = new Box(new PVector(c.x + width / 2 + 420, ground - 260), new PVector(60, 60));
  obsManager.obstacles.add(o);
  Pill p = new Pill(new PVector(c.x + width / 2 + 350, ground - 40), new PVector(30, 30)); //30*30 only for the peace pill
  o = p;
  obsManager.pills.add(p);  
  obsManager.obstacles.add(o);
  obsManager.cooldown = 2000;
}

void Medium1()
{
  Obstacle o;
  o = new Platform(new PVector(c.x + width / 2 + 50, ground - 160), new PVector(300, 50));
  obsManager.obstacles.add(o);
  o = new Platform(new PVector(c.x + width / 2 + 350, ground - 160), new PVector(300, 50));
  obsManager.obstacles.add(o);
  o = new Box(new PVector(c.x + width / 2 + 100, ground - 60), new PVector(60, 60));
  obsManager.obstacles.add(o);
  o = new Box(new PVector(c.x + width / 2 + 150, ground - 220), new PVector(60, 60));
  obsManager.obstacles.add(o);
  o = new Platform(new PVector(c.x + width / 2 + 450, ground - 360), new PVector(300, 50));
  obsManager.obstacles.add(o);

  obsManager.cooldown = 2000;
}

void Medium2()
{
  Obstacle o;
  o = new Platform(new PVector(c.x + width / 2 + 50, ground - 160), new PVector(300, 50));
  obsManager.obstacles.add(o);
  o = new Box(new PVector(c.x + width / 2 + 50, ground - 60), new PVector(60, 60));
  obsManager.obstacles.add(o);
  o = new Box(new PVector(c.x + width / 2 + 50, ground - 120), new PVector(60, 60));
  obsManager.obstacles.add(o);
  o = new Platform(new PVector(c.x + width / 2 + 50, ground - 360), new PVector(300, 50));
  obsManager.obstacles.add(o);

  obsManager.cooldown = 2000;
}

void Hard0()
{
  
}

void Hard1()
{
}

void Hard2()
{
}