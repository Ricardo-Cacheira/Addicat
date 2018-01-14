class HUD
{

  PVector fps_pos, p, score_position;
  float fps, score, startMillis;
  HUD()
  {
    fps_pos = new PVector(10, 20);
    score_position = new PVector(width - 100, 20);
  }

  void fps()
  {
    fps_pos.x = gm.c.x - width/2 + 20;
    pushStyle();
    fill(255);
    textSize(14);
    fps = frameRate;
    text("FPS: " + String.format("%.0f", fps), fps_pos.x, fps_pos.y);
    popStyle();
  }

  void score()
  {
    score_position.x = gm.c.x + width/2 - 100;
    pushStyle();
    fill(#EAD721);
    textSize(14);
    score = (millis() - startMillis) / 1000;
    text("Score: " + String.format("%.0f", score), score_position.x, score_position.y);
    popStyle();
  }
}