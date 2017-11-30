class ObstacleManager
{
  ArrayList<Obstacle> obstacles;
  ArrayList<Pill> pills;
  PVector p;
  int nextSpawn;

  ObstacleManager(PVector p)
  {
    this.p = p.copy();
    obstacles= new ArrayList<Obstacle>();
    pills= new ArrayList<Pill>();
    nextSpawn = 5000;
  }
  void generate()
  {
    Obstacle o;
    int type = int(random(4));
    if (type == 0)
    {
      o = new Box(new PVector(c.x + width / 2 + 50, ground - 60), new PVector(60, 60));
    } else if (type == 1)
    {
      o = new TrashBin(new PVector(c.x + width / 2 + 50, ground - 100), new PVector(60, 100));
    } else if (type == 2)
    {
      o = new Platform(new PVector(c.x + width / 2 + 50, ground - 160), new PVector(450, 50));
    } else
    {
      Pill p = new Pill(new PVector(c.x + width / 2 + 50, ground - 60), new PVector(35, 20));
      o = p;
      text("pill", c.x + width / 2 + 50, ground - 80);
      pills.add(p);
    }
    obstacles.add(o);
  }

  void update() {

    if (millis() >= lastMil + 2000)
    {
      lastMil += 2000;
      generate();
    }

    ArrayList<Obstacle> deadObstacles = new ArrayList<Obstacle>();

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

    //handleCollision();

    for (Obstacle obstacle : deadObstacles) {
      println("Remove: " + obstacle);
      obstacles.remove(obstacle);
      pills.remove(obstacle);
    }
  }

  void handleCollision()
  {
    for (Obstacle obstacle : obstacles) {
      if (obstacle.isColliding(player))
        obstacle.collide(player);
    }
  }

  void display() {
    for (Obstacle obstacle : obstacles)
      obstacle.display();
  }
}