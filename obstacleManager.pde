class ObstacleManager
{
  ArrayList<Obstacle> obstacles;
  ArrayList<Obstacle> deadObstacles = new ArrayList<Obstacle>();
  ArrayList<Pill> pills;
  PVector p;
  int cooldown;

  ObstacleManager(PVector p)
  {
    this.p = p.copy();
    obstacles= new ArrayList<Obstacle>();
    pills= new ArrayList<Pill>();
  }
  void generate()
  {
    Obstacle o;
    //int type = int(random(5));

    int type = 5;
    if (type == 0)
    {
      o = new Box(new PVector(c.x + width / 2 + 50, ground - 60), new PVector(60, 60));
    } else if (type == 1)
    {
      o = new TrashBin(new PVector(c.x + width / 2 + 50, ground - 100), new PVector(60, 100));
    } else if (type == 2)
    {
      o = new Platform(new PVector(c.x + width / 2 + 50, ground - 160), new PVector(450, 50));
    } else if (type == 3)
    {
      Pill p = new Pill(new PVector(c.x + width / 2 + 50, ground - 60), new PVector(35, 20));//35*20 for the peace pill
      o = p;
      text("pill", c.x + width / 2 + 50, ground - 80);
      pills.add(p);
    } else
    {
      o = new Platform(new PVector(c.x + width / 2 + 50, ground - 160), new PVector(450, 50));
      obstacles.add(o);
      o = new Box(new PVector(c.x + width / 2 + 100, ground - 60), new PVector(60, 60));
      obstacles.add(o);
      o = new TrashBin(new PVector(c.x + width / 2 + 330, ground - 260), new PVector(60, 100));
      obstacles.add(o);
      Pill p = new Pill(new PVector(c.x + width / 2 + 580, ground - 500), new PVector(30, 30)); //30*30 only for the peace pill
      o = p;
      pills.add(p);
      cooldown = 2500;
    }
    obstacles.add(o);
  }

  void update() {

    if (millis() >= lastMil + cooldown)
    {
      lastMil += cooldown;
      generate();
    }



    for (Obstacle obstacle : obstacles) {
      obstacle.update();

      if (obstacle.isDead())
        deadObstacles.add(obstacle);
    }

    for (Pill pill : pills) {
      pill.update();
      if (pill.collected)
        deadObstacles.add(pill);
    }

    for (Obstacle obstacle : deadObstacles) {
      //println("Remove: " + obstacle);
      obstacles.remove(obstacle);
      pills.remove(obstacle);
    }
  }

  void handleCollision()
  {
    for (Obstacle obstacle : obstacles) {
      if (obstacle.isColliding(player))
      {
        pushed = true;
        obstacle.collide(player);
      }
    }
  }

  void display() {
    for (Obstacle obstacle : obstacles)
      obstacle.display();
  }

  void restart()
  {
    for (Obstacle obstacle : obstacles) {
      deadObstacles.add(obstacle);
    }

    for (Obstacle obstacle : deadObstacles) {
      obstacles.remove(obstacle);
      pills.remove(obstacle);
    }
  }
}