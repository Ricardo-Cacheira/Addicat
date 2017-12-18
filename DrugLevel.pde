class DrugLevel {

  float sizex = 250;
  float max = 500;
  float num = 0.2;
  boolean lifeTaker=false, lifeGiver = false;
  PImage bar=loadImage("Bar.png");

  void display() {
    if (sizex!=0 && !lifeTaker && !lifeGiver) {
      if (!junkieMode)
        sizex=sizex-num;
      pushStyle();
      CheckStatus(); 
      rect((width/2)/2, 50, sizex, 45);
      image(bar, (width/2)/2, 50);
      popStyle();
    } else if (sizex!=0 && lifeTaker && !lifeGiver) {
      if (!junkieMode)
        sizex=sizex-5;
      pushStyle();
      CheckStatus();
      rect((width/2)/2, 50, sizex, 45);
      image(bar, (width/2)/2, 50);
      popStyle();
      lifeTaker=false;
    } else if (sizex!=0 && !lifeTaker && lifeGiver) {
      if (!junkieMode)
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

    if (sizex >=100 && sizex <=400) { //normal
      fill(#71FFDA);
      num=0.2;
    } else if (sizex>20 && sizex<100) { //sober warning
      fill(#FFC44D);
      num=0.5;
    } else if (sizex>400 && sizex<=420) { //golden zone
      fill(#FFF86A);
    } else if (sizex>420 && sizex<=480) {//OD warning
      fill(#FFC44D);
      num=0.1;
    } else if (sizex>480 && sizex<500) {//OD
      fill(#E54545);
    } else if (sizex<=20) {//Sober
      fill(#E54545);
    }
  }
}