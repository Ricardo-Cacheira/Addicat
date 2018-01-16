class Background
{
  PImage FirstLayer;
  PImage SecondLayer;
  PImage ThirdLayer;

  PImage FirstLayerHigh;
  PImage SecondLayerHigh;
  PImage ThirdLayerHigh;

  float xtl;
  float xfl; 
  float xsl;

  Background(PImage FirstLayer, PImage SecondLayer, PImage ThirdLayer, PImage FirstLayerHigh, PImage SecondLayerHigh, PImage ThirdLayerHigh)
  {
    xtl=0;
    xfl=0; 
    xsl=0;
    this.FirstLayer = FirstLayer;
    this.SecondLayer = SecondLayer;
    this.ThirdLayer = ThirdLayer;

    this.FirstLayerHigh = FirstLayerHigh;
    this.SecondLayerHigh = SecondLayerHigh;
    this.ThirdLayerHigh = ThirdLayerHigh;
  }

  void update()
  {
    // pos 
    xfl=xfl-gm.scrollingSpeed();
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
    if (gm.high)
    {
      image(ThirdLayerHigh, xtl, 0);
      image(ThirdLayerHigh, xtl+ThirdLayerHigh.width, 0);

      image(SecondLayerHigh, xsl, 0);
      image(SecondLayerHigh, xsl+SecondLayerHigh.width, 0);    

      image(FirstLayerHigh, xfl, height - FirstLayerHigh.height);
      image(FirstLayerHigh, xfl+FirstLayerHigh.width, height - FirstLayerHigh.height);
    } else
    {
      image(ThirdLayer, xtl, 0);
      image(ThirdLayer, xtl+ThirdLayer.width, 0);

      image(SecondLayer, xsl, 0);
      image(SecondLayer, xsl+SecondLayer.width, 0);    

      image(FirstLayer, xfl, height - FirstLayer.height);
      image(FirstLayer, xfl+FirstLayer.width, height - FirstLayer.height);
    }
  }
}