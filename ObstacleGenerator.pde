class ObstacleGenerator
{

  int duration, currentSection, startMillis;
  int easyProb, mediumProb, hardProb;
  int[][] sectionSettings = { {60, 100, 0, 0}, 
    {90, 80, 20, 0}, 
    {120, 60, 40, 0}, 
    {150, 40, 62,60}, 
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


  void Easy0()
  {
    Obstacle o;
    o = new Platform(new PVector(gm.c.x + width / 2 + 50, gm.ground() - 160), new PVector(300, 50), gm.ImgPreloader.platImg);
    gm.obsManager.obstacles.add(o);
    o = new Box(new PVector( gm.c.x + width / 2 + 100, gm.ground() - 60), new PVector(60, 60), gm.ImgPreloader.boxImg);
    gm.obsManager.obstacles.add(o);
    o = new TrashBin(new PVector( gm.c.x + width / 2 + 260, gm.ground() - 255), new PVector(75, 95), gm.ImgPreloader.trashImg);
    gm.obsManager.obstacles.add(o);
    Pill p = new Pill(new PVector( gm.c.x + width / 2 + 400, gm.ground() - 500), new PVector(62,60), gm.ImgPreloader.pillImg); //30*30 only for the peace pill
    o = p;
    gm.obsManager.pills.add(p);  
    gm.obsManager.obstacles.add(o);
    gm.obsManager.cooldown = 2000;
  }

  void Easy1()
  {
    Obstacle o;
    o = new Platform(new PVector( gm.c.x + width / 2 + 50, gm.ground() - 200), new PVector(300, 50), gm.ImgPreloader.platImg);
    gm.obsManager.obstacles.add(o);
    o = new Box(new PVector( gm.c.x + width / 2 + 50, gm.ground() - 260), new PVector(60, 60), gm.ImgPreloader.boxImg);
    gm.obsManager.obstacles.add(o);
    o = new Box(new PVector( gm.c.x + width / 2 + 110, gm.ground() - 260), new PVector(60, 60), gm.ImgPreloader.boxImg);
    gm.obsManager.obstacles.add(o);
    Pill p = new Pill(new PVector( gm.c.x + width / 2 + 150, gm.ground() - 330), new PVector(62,60), gm.ImgPreloader.pillImg); //30*30 only for the peace pill
    o = p;
    gm.obsManager.pills.add(p);  
    gm.obsManager.obstacles.add(o);
    gm.obsManager.cooldown = 2000;
  }

  void Easy2()
  {  
    Obstacle o;
    o = new Spike(new PVector( gm.c.x + width / 2 + 50, gm.ground() - 32), new PVector(62, 32), gm.ImgPreloader.spikeImg);
    gm.obsManager.obstacles.add(o);
    o = new Spike(new PVector( gm.c.x + width / 2 + 110, gm.ground() - 32), new PVector(62, 32), gm.ImgPreloader.spikeImg);
    gm.obsManager.obstacles.add(o);
    o = new Spike(new PVector( gm.c.x + width / 2 + 170, gm.ground() - 32), new PVector(62, 32), gm.ImgPreloader.spikeImg);
    gm.obsManager.obstacles.add(o);
    gm.obsManager.cooldown = 2000;
  }

  void Medium0()
  {
    Obstacle o;
    o = new Box(new PVector( gm.c.x + width / 2 + 50, gm.ground() - 60), new PVector(60, 60), gm.ImgPreloader.boxImg);
    gm.obsManager.obstacles.add(o);
    o = new Platform(new PVector( gm.c.x + width / 2 + 300, gm.ground() - 200), new PVector(300, 50), gm.ImgPreloader.platImg);
    gm.obsManager.obstacles.add(o);
    o = new Box(new PVector( gm.c.x + width / 2 + 300, gm.ground() - 260), new PVector(60, 60), gm.ImgPreloader.boxImg);
    gm.obsManager.obstacles.add(o);
    o = new Box(new PVector( gm.c.x + width / 2 + 360, gm.ground() - 260), new PVector(60, 60), gm.ImgPreloader.boxImg);
    gm.obsManager.obstacles.add(o);
    o = new Box(new PVector( gm.c.x + width / 2 + 420, gm.ground() - 260), new PVector(60, 60), gm.ImgPreloader.boxImg);
    gm.obsManager.obstacles.add(o);
    Pill p = new Pill(new PVector( gm.c.x + width / 2 + 350, gm.ground() - 40), new PVector(62,60), gm.ImgPreloader.pillImg); //30*30 only for the peace pill
    o = p;
    gm.obsManager.pills.add(p);  
    gm.obsManager.obstacles.add(o);
    gm.obsManager.cooldown = 2000;
  }

  void Medium1()
  {
    Obstacle o;
    o = new Platform(new PVector( gm.c.x + width / 2 + 50, gm.ground() - 160), new PVector(300, 50), gm.ImgPreloader.platImg);
    gm.obsManager.obstacles.add(o);
    o = new Platform(new PVector( gm.c.x + width / 2 + 350, gm.ground() - 160), new PVector(300, 50), gm.ImgPreloader.platImg);
    gm.obsManager.obstacles.add(o);
    o = new Box(new PVector( gm.c.x + width / 2 + 100, gm.ground() - 60), new PVector(60, 60), gm.ImgPreloader.boxImg);
    gm.obsManager.obstacles.add(o);
    o = new Box(new PVector( gm.c.x + width / 2 + 150, gm.ground() - 220), new PVector(60, 60), gm.ImgPreloader.boxImg);
    gm.obsManager.obstacles.add(o);
    o = new Platform(new PVector( gm.c.x + width / 2 + 450, gm.ground() - 360), new PVector(300, 50), gm.ImgPreloader.platImg);
    gm.obsManager.obstacles.add(o);

    gm.obsManager.cooldown = 2000;
  }

  void Medium2()
  {
    Obstacle o;
    o = new Platform(new PVector( gm.c.x + width / 2 + 50, gm.ground() - 160), new PVector(300, 50), gm.ImgPreloader.platImg);
    gm.obsManager.obstacles.add(o);
    o = new Box(new PVector( gm.c.x + width / 2 + 50, gm.ground() - 60), new PVector(60, 60), gm.ImgPreloader.boxImg);
    gm.obsManager.obstacles.add(o);
    o = new Box(new PVector( gm.c.x + width / 2 + 50, gm.ground() - 120), new PVector(60, 60), gm.ImgPreloader.boxImg);
    gm.obsManager.obstacles.add(o);
    o = new Platform(new PVector( gm.c.x + width / 2 + 50, gm.ground() - 360), new PVector(300, 50), gm.ImgPreloader.platImg);
    gm.obsManager.obstacles.add(o);

    gm.obsManager.cooldown = 2000;
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

  void pickHigh()
  {
    int s = int(random(0, 3));

    switch(s) {
    case 0: 
      High0();
      break;
    case 1: 
      High1();
      break;
    case 2: 
      High2();
      break;
    }
  }


  void High0()
  {
    Obstacle o;
    Pill p = new Pill(new PVector( gm.c.x + width / 2 + 50, gm.ground() - 60), new PVector(62,60), gm.ImgPreloader.pillImg);
    o = p;
    gm.obsManager.pills.add(p);  
    gm.obsManager.obstacles.add(o);
    gm.obsManager.cooldown = 2000;
  }

  void High1()
  {
    Obstacle o;
    o = new Platform(new PVector( gm.c.x + width / 2 + 50, gm.ground() - 170), new PVector(300, 50), gm.ImgPreloader.platImg);
    gm.obsManager.obstacles.add(o);
    Pill p = new Pill(new PVector( gm.c.x + width / 2 + 200, gm.ground() - 250), new PVector(62,60), gm.ImgPreloader.pillImg);
    o = p;
    gm.obsManager.pills.add(p);  
    gm.obsManager.obstacles.add(o);
    gm.obsManager.cooldown = 2000;
  }

  void High2()
  {
    Obstacle o;
    o = new Platform(new PVector( gm.c.x + width / 2 + 50, gm.ground() - 170), new PVector(300, 50), gm.ImgPreloader.platImg);
    gm.obsManager.obstacles.add(o);
    Pill p = new Pill(new PVector( gm.c.x + width / 2 + 200, gm.ground() - 60), new PVector(62,60), gm.ImgPreloader.pillImg);
    o = p;
    gm.obsManager.pills.add(p);  
    gm.obsManager.obstacles.add(o);
    gm.obsManager.cooldown = 2000;
  }
}