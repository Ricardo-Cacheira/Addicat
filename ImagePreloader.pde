class ImagePreloader
{

  PImage FirstLayer;
  PImage SecondLayer;
  PImage ThirdLayer;

  PImage FirstLayerHigh;
  PImage SecondLayerHigh;
  PImage ThirdLayerHigh;

  PImage boxImg;
  PImage pillImg;
  PImage platImg;
  PImage spikeImg;
  PImage trashImg;

  PImage imager, imager2, imagers;

  PImage dog;
  PImage baloon;

  PImage bar;

  PImage play, menuBackground, GOdog, GOov, GOsober;

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

    dog = loadImage("dog.png");
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