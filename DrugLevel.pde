class DrugLevel {

  float sizex;
  float max;
  float num;
  boolean lifeTaker, lifeGiver;
  PImage bar;
  boolean ov;
  int c;

  DrugLevel(PImage bar)
  {
    sizex = 250;
    max = 500;
    num = 0.2;
    lifeTaker=false;
    lifeGiver = false;
    this.bar=bar;
    ov = false;
    c=0;
  }

  void display() {

    if (sizex!=0 && !lifeTaker && !lifeGiver) {
      if (!gm.junkieMode)
        sizex=sizex-num;
      pushStyle();
      CheckStatus(); 
      rect((width/2)/2, 50, sizex, 45);
      image(bar, (width/2)/2, 50);
      popStyle();
    } else if (sizex!=0 && lifeTaker && !lifeGiver) {
      if (!gm.junkieMode)
        sizex=sizex-5;
      pushStyle();
      CheckStatus();
      rect((width/2)/2, 50, sizex, 45);
      image(bar, (width/2)/2, 50);
      popStyle();
      lifeTaker=false;
    } else if (sizex!=0 && !lifeTaker && lifeGiver) {
      if (!gm.junkieMode)
        sizex=sizex+50;
      if (sizex > 500)
      {
        sizex = 500;
      }
      pushStyle();
      CheckStatus();
      rect((width/2)/2, 50, sizex, 45);
      image(bar, (width/2)/2, 50);
      popStyle();
      lifeTaker=false;
      lifeGiver = false;
    }

    if (sizex<=0) {
      sizex=0;
      sizex=sizex+0;
    }
    //println(lifeTaker);
  }

  boolean outOfBar()
  {
    return sizex == 0;
  }

  void CheckStatus() {

    colorMode(HSB);

    if (gm.high)
    {
      if (c >= 255)  c=0;  
      else  c+=10;
      fill(c, 255, 255);
    } else
    {
      if (sizex >=100 && sizex <=400) { //normal
        fill(#71FFDA);
        num=0.2;
      } else if (sizex>20 && sizex<100) { //sober warning
        fill(#FFC44D);
        num=0.5;
      } else if (sizex>400 && sizex<=420) { //golden zone
        gm.switchState();
      } else if (sizex>420 && sizex<=480) {//OD warning
        fill(#FFC44D);
        num=0.1;
      } else if (sizex>480 && sizex<500) {//OD
        fill(#E54545);
        ov = true;
      } else if (sizex<=20) {//Sober
        fill(#E54545);
      }
    }
  }
}