class HUD
{
  
  private PVector fps_pos, p, score_position;
  private float fps, score, startMillis;
  private PFont arialBold;
  HUD()
  {
    fps_pos = new PVector(width - 50, 20);
    score_position = new PVector(10, 40);
    this.arialBold = createFont("Arial Bold", 30);
  }

  void fps()
  {
    fps_pos.x =  gm.c.x + width/2 - 50;
    pushStyle();
    fill(255);
    textSize(14);
    fps = frameRate;
    text("FPS: " + String.format("%.0f", fps), fps_pos.x, fps_pos.y);
    popStyle();
  }

  void score()
  {
    score_position.x = gm.c.x - width/2 + 40;
    pushStyle();
    fill(#EAD721);
    textFont(arialBold);
    textSize(30);
    score = (millis() - startMillis) / 20;
    text("Score: " + String.format("%.0f", score), score_position.x, score_position.y);
    popStyle();
  }
}