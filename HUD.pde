class HUD
{

  private PVector fps_pos, p, score_position;
  private float fps, score, startMillis;
  private PFont arialBold;
  private int c;
  private PImage bar;



  HUD(PImage bar)
  {
    fps_pos = new PVector(width - 50, 20);
    score_position = new PVector(10, 40);
    this.arialBold = createFont("Arial Bold", 30);
    this.bar = bar;
    c=0;
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

  void DrugMeter(Cat player) {

    pushStyle();
    CheckStatus(player); 
    rect((width/2)/2, 50, player.level, 45);
    image(bar, (width/2)/2, 50);
    popStyle();
  }

  void CheckStatus(Cat player) {


    colorMode(HSB);

    if (gm.high)
    {
      if (c >= 255)  c=0;  
      else  c+=10;
      fill(c, 255, 255);
    } else
    {
      if (player.level >=100 && player.level <=400) { //normal
        fill(#71FFDA);
        player.num=0.2;
      } else if (player.level>20 && player.level<100) { //sober warning
        fill(#FFC44D);
        player.num=0.5;
      } else if (player.level>425 && player.level<=450) { //golden zone
        gm.switchState();
      } else if (player.level>450) {//OD
        fill(#E54545);
        player.ov = true;
      } else if (player.level<=50) {//Sober
        fill(#E54545);
      }
    }
  }
}