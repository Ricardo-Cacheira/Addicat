class HUD
{

  private PVector fps_pos, p, score_position;
  private float fps, score, startMillis;
  private PFont arialBold;
  private int c;
  private PImage bar;



  private float num;




  HUD(PImage bar)
  {
    fps_pos = new PVector(width - 50, 20);
    score_position = new PVector(10, 40);
    this.arialBold = createFont("Arial Bold", 30);
    this.bar = bar;
    c=0;


    num = 0.2;
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
    CheckStatus(player, player.level); 
    rect((width/2)/2, 50, player.level, 45);
    image(bar, (width/2)/2, 50);
    popStyle();
  }

  void CheckStatus(Cat player, float level) {


    colorMode(HSB);

    if (gm.high)
    {
      if (c >= 255)  c=0;  
      else  c+=10;
      fill(c, 255, 255);
    } else
    {
      if (level >=100 && level <=400) { //normal
        fill(#71FFDA);
        num=0.2;
      } else if (level>20 && level<100) { //sober warning
        fill(#FFC44D);
        num=0.5;
      } else if (level>425 && level<=450) { //golden zone
        gm.switchState();
      } else if (level>450) {//OD
        fill(#E54545);
        player.ov = true;
      } else if (level<=50) {//Sober
        fill(#E54545);
      }
    }
  }


  void displayBar(HUD hud, Cat player) {

    if (player.level!=0 && !player.lifeTaker && !player.lifeGiver) {
      if (!gm.junkieMode)
        player.level=player.level-num;
      hud.DrugMeter(player);
    } else if (player.level!=0 && player.lifeTaker && !player.lifeGiver) {
      if (!gm.junkieMode)
        player.level=player.level-5;
      hud.DrugMeter(player);
      player.lifeTaker=false;
    } else if (player.level!=0 && !player.lifeTaker && player.lifeGiver) {      
      if (!gm.junkieMode)
        player.level=player.level+50;
      if (gm.high && !gm.junkieMode)
        player.ov = true;

      if (player.level > 500)
      {
        player.level = 500;
      }
      hud.DrugMeter(player);
      player.lifeTaker=false;
      player.lifeGiver = false;
    }

    //println(lifeTaker);
  }
}