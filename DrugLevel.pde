class DrugLevel {

  /*  //private float level;
   private float max;
   private float num;
   // private boolean lifeTaker, lifeGiver;
   private PImage bar;
   private boolean ov;
   private int c;
   
   DrugLevel(PImage bar)
   {
   //  level = 250;
   max = 500;
   //num = 0.2;
   // lifeTaker=false;
   //lifeGiver = false;
   this.bar=bar;
   ov = false;
   c=0;
   }
   
  /*void display() {
   
   if (level!=0 && !lifeTaker && !lifeGiver) {
   if (!gm.junkieMode)
   level=level-num;
   pushStyle();
   CheckStatus(); 
   rect((width/2)/2, 50, level, 45);
   image(bar, (width/2)/2, 50);
   popStyle();
   } else if (level!=0 && lifeTaker && !lifeGiver) {
   if (!gm.junkieMode)
   level=level-5;
   pushStyle();
   CheckStatus();
   rect((width/2)/2, 50, level, 45);
   image(bar, (width/2)/2, 50);
   popStyle();
   lifeTaker=false;
   } else if (level!=0 && !lifeTaker && lifeGiver) {      
   if (!gm.junkieMode)
   level=level+50;
   if (gm.high && !gm.junkieMode)
   ov = true;
   
   if (level > 500)
   {
   level = 500;
   }
   pushStyle();
   CheckStatus();
   rect((width/2)/2, 50, level, 45);
   image(bar, (width/2)/2, 50);
   popStyle();
   lifeTaker=false;
   lifeGiver = false;
   }
   
   if (level<=0) {
   level=0;
   level=level+0;
   }
   //println(lifeTaker);
   }
   */
  /*  boolean outOfBar()
   {
   return level == 0;
   }
   */
  /* void CheckStatus() {
   
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
   ov = true;
   } else if (level<=50) {//Sober
   fill(#E54545);
   }
   }
   }*/
}