class ObstacleManager
{
  ArrayList<Obstacle> obstacles;
  ArrayList<Obstacle> deadObstacles = new ArrayList<Obstacle>();
  ArrayList<Pill> pills;
  PVector p;
  int cooldown;

  ObstacleManager()
  {
    //this.p = p.copy();
    obstacles= new ArrayList<Obstacle>();
    pills= new ArrayList<Pill>();
  }


  void update() {

    if (millis() >= gm.lastMil + cooldown)
    {
      gm.lastMil += cooldown;
      if (gm.high)
        gm.obsGenerator.pickHigh();
      else
        gm.obsGenerator.pick();
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
      if (obstacle.isColliding(gm.player))
      {
        gm.player.pushed = true;
        obstacle.collide(gm.player);
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

  void clearObstacles()
  {
    for (Obstacle obstacle : obstacles) {
      deadObstacles.add(obstacle);
    }

    for (Obstacle obstacle : deadObstacles) {
      obstacles.remove(obstacle);
      deadObstacles.remove(obstacle);
      pills.remove(obstacle);
    }
  }
}