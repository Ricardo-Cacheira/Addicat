class DrugLevel {

  float sizex = 300;
  float max = 350;
  float num = 0.1;
  boolean lifeTaker=false, lifeGiver = false;

  void display() {
    if (sizex!=0 && !lifeTaker && !lifeGiver) {
      if(!junkieMode)
      sizex=sizex-num;
      pushStyle();
      fill(#2DE8F7);
      rect(370, 50, sizex, 20);
      popStyle();
    }else if (sizex!=0 && lifeTaker && !lifeGiver) {
      if(!junkieMode)
      sizex=sizex-5;
      pushStyle();
      fill(#980202);
      rect(370, 50, sizex, 20);
      popStyle();
      lifeTaker=false;
    }else if (sizex!=0 && !lifeTaker && lifeGiver) {
      if(!junkieMode)
      sizex=sizex+50;
      if (sizex > 350)
      {
        sizex = 350;
      }
      pushStyle();
      fill(#10E5A0);
      rect(370, 50, sizex, 20);
      popStyle();
      lifeTaker=false;
      lifeGiver = false;
    }

    if (sizex<=0) {
      sizex=0;
      sizex=sizex+0; 
      gm.gameOver();
    }
    //println(lifeTaker);
  }
}