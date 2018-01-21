class ImagePreloader
{

  private PImage FirstLayer;
  private PImage SecondLayer;
  private PImage ThirdLayer;

  private PImage FirstLayerHigh;
  private PImage SecondLayerHigh;
  private PImage ThirdLayerHigh;

  private PImage boxImg;
  private PImage pillImg;
  private PImage platImg;
  private PImage spikeImg;
  private PImage trashImg;

  private PImage imager, imager2, imagers;

  private PImage dog0;
  private PImage dog1;
  private PImage dog2;
  private PImage dog3;


  private PImage baloon;

  private PImage bar;

  private PImage play, menuBackground, GOdog, GOov, GOsober;

  ImagePreloader()
  {
    //FirstLayer = loadImage("firstBackground.png"); 
    FirstLayer = loadImage("NewfirstBackground.png");
    SecondLayer = loadImage("secondBackground.png");
    //ThirdLayer = loadImage("thirdBackground.png");
    ThirdLayer = loadImage("Sunset.png");

    FirstLayerHigh = loadImage("firstBackgroundHigh.png");
    SecondLayerHigh = loadImage("secondBackgroundHigh.png");
    ThirdLayerHigh = loadImage("thirdBackgroundHigh.png");

    boxImg = loadImage("box.png");
    pillImg = loadImage("peacepillorange.png");
    platImg = loadImage("newplatform.png");
    spikeImg = loadImage("spike.png");
    trashImg = loadImage("trashbin.png");

    imager = loadImage("catr1.png");
    imager2 = loadImage("catr2.png");
    imagers = loadImage("catrs.png");

    dog0 = loadImage("dog0.png");
    dog1 = loadImage("dog1.png");
    dog2 = loadImage("dog2.png");
    dog3 = loadImage("dog3.png");

    baloon = loadImage("baloon.png");

    bar=loadImage("Bar.png");

    play = loadImage("play.png");
    menuBackground = loadImage("menu_background.png");
    menuBackground.resize(width, height);
    GOdog = loadImage("GOdog.png");
    GOov = loadImage("GOov.png");
    GOsober = loadImage("GOsober.png");
  }
}