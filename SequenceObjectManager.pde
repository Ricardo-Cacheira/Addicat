class ObstacleManager
{
  private ArrayList<SequenceObject> obstacles;
  private ArrayList<SequenceObject> deadObstacles = new ArrayList<SequenceObject>();
  private ArrayList<Pill> pills;
  private PVector p;
  private int cooldown;

  ObstacleManager()
  {
    //this.p = p.copy();
    obstacles= new ArrayList<SequenceObject>();
    pills= new ArrayList<Pill>();
  }


  void update() {

    if (gm.c.x +50 >= gm.lastSpawn + cooldown)
    {
      gm.lastSpawn += cooldown;
      if (gm.high)
        gm.obsGenerator.pickHigh();
      else
        gm.obsGenerator.pick();
    }



    for (SequenceObject obstacle : obstacles) {
      obstacle.update();

      if (obstacle.isDead())
        deadObstacles.add(obstacle);
    }

    for (Pill pill : pills) {
      pill.update();
      if (pill.collected)
        deadObstacles.add(pill);
    }

    for (SequenceObject obstacle : deadObstacles) {
      //println("Remove: " + obstacle);
      obstacles.remove(obstacle);
      pills.remove(obstacle);
    }
  }

  void handleCollision()
  {
    for (SequenceObject obstacle : obstacles) {
      if (obstacle.isColliding(gm.player))
      {
        gm.player.pushed = true;
        obstacle.collide(gm.player);
      }
    }
  }

  void display() {
    for (SequenceObject obstacle : obstacles)
      obstacle.display();
  }

  void restart()
  {

    obstacles.clear();
    deadObstacles.clear();
  }

  void clearObstacles()
  {
    obstacles.clear();
    deadObstacles.clear();
  }
}