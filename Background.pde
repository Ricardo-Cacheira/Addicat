class Background
{
  PImage FirstLayer;
  PImage SecondLayer;
  PImage ThirdLayer;
  float xtl;
  float xfl; 
  float xsl;

  Background()
  {
    xtl=0;
    xfl=0; 
    xsl=0;
    //FirstLayer = loadImage("firstBackground.png"); 
    FirstLayer = loadImage("NewfirstBackground.png");
    SecondLayer = loadImage("secondBackground.png");
    ThirdLayer = loadImage("thirdBackground.png");
  }

  void update()
  {
    // pos 
    xfl=xfl-gm.get_scrollingSpeed();
    xsl=xsl-2;
    xtl=xtl-0;



    if (xfl<-FirstLayer.width) 
      xfl=0;

    if (xsl<-SecondLayer.width) 
      xsl=0;

    if (xtl<-ThirdLayer.width) 
      xtl=0;
  }

  void display()
  {

    image(ThirdLayer, xtl, 0);
    image(ThirdLayer, xtl+ThirdLayer.width, 0);

    image(SecondLayer, xsl, 0);
    image(SecondLayer, xsl+SecondLayer.width, 0);    

    image(FirstLayer, xfl, height - FirstLayer.height);
    image(FirstLayer, xfl+FirstLayer.width, height - FirstLayer.height);
  }
}