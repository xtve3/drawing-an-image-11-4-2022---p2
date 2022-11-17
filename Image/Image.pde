//Global Variables
int appWidth, appHeight;
float backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight;
float picWidthAdjusted1=0.0, picHeightAdjusted1=0.0;
float picWidthAdjusted2=0.0, picHeightAdjusted2=0.0;
float picWidthAdjusted3=0.0, picHeightAdjusted3=0.0;
float bruhX, bruhY, bruhWidth, bruhHeight; //bottom half
float yourmomX, yourmomY, yourmomWidth, yourmomHeight; //top half
PImage pic, pic2, pic3;
Boolean nightMode=false;
int tintDayMode=255, tintDayModeOpacity=100;
int tintRed=255, tintGreen=105, tintBlue=100, tintNightModeOpacity=1000;
//
void setup()
{
  size(1000, 800); //Landscape
  //Copy Display Algorithm from Hello World
  //fullScreen(); //displayWidth, displayHeight
  appWidth = width;
  appHeight = height;
  //
  //Population
  //.. stands for back, / stands for double click
  pic = loadImage("../Images Used/LandScape/karl.jpg");
  pic2 = loadImage("../Images Used/LandScape/googlelmao.JPG");
  pic3 = loadImage("../Images Used/Portrait/solid-5-panel-wood-ed.png");
  backgroundImageX = appWidth*0;
  backgroundImageY = appHeight*0;
  backgroundImageWidth = appWidth-1;
  backgroundImageHeight = appHeight-1;
  yourmomX = appWidth * 1.55/5;
  bruhX = appWidth * 1.55/5;
  yourmomY = appHeight * 0.55/10;
  bruhY = appHeight * 3.5/5;
  yourmomWidth = appWidth * 2/6;
  bruhWidth = appWidth * 2/6;
  yourmomHeight = appHeight * 1.2/6;
  bruhHeight = appHeight * 1.2/6;
  //
  //Image Dimensions for Aspect Ratio: image meta data
  //Note: meta explored in MP3's or music files
  //Note: Dimensions are found in the image file / Right Click / Properties / Details
  int picWidth1 = 800; //karl landscape
  int picHeight1 = 600; 
  int picWidth2 = 759; //google landscape image
  int picHeight2 = 604; 
  int picWidth3 = 278; //door portrait image
  int picHeight3 = 600; 
  //
  //Image Orientation: Landscape, Portrait, Square
  //Scaling Image size with aspect ratio requires larger dimension
  float smallerDimension1, smallerDimension2, smallerDimension3;
  float largerDimension1, largerDimension2, largerDimension3;
  float imageWidthRatio1=0.0, imageHeightRatio1=0.0;
  float imageHeightRatio2=0.0, imageWidthRatio2=0.0;
  float imageHeightRatio3=0.0, imageWidthRatio3=0.0;
  if ( picWidth1 >= picHeight1 ) { //True if Landscape or Square
    largerDimension1 = picWidth1;
    smallerDimension1 = picHeight1;
    //
    picWidthAdjusted1 = backgroundImageWidth; //from rect() layout
    imageHeightRatio1 = smallerDimension1 / largerDimension1;
    picHeightAdjusted1 = picWidthAdjusted1 * imageHeightRatio1;
  } else { //False if Portrait
    largerDimension1 = picHeight1;
    smallerDimension1 = picWidth1;
    //
    picHeightAdjusted1 = backgroundImageHeight; //from rect() layout
    imageWidthRatio1 = smallerDimension1 / largerDimension1;
    picWidthAdjusted1 = picHeightAdjusted1 * imageWidthRatio1;
  }
  if ( picWidth2 >= picHeight2 ) { //True if Landscape or Square
    largerDimension2 = picWidth2;
    smallerDimension2 = picHeight2;
    //
    picWidthAdjusted2 = yourmomWidth; //from rect() layout
    imageHeightRatio2 = smallerDimension2 / largerDimension2;
    picHeightAdjusted2 = picWidthAdjusted2 * imageHeightRatio2;
  } else { //False if Portrait
    largerDimension2 = picHeight2;
    smallerDimension2 = picWidth2;
    //
    picHeightAdjusted2 = yourmomHeight; //from rect() layout
    imageWidthRatio2 = smallerDimension2 / largerDimension2;
    picWidthAdjusted2 = picHeightAdjusted2 * imageWidthRatio2;
  }
  if ( picWidth3 >= picHeight3 ) { //True if Landscape or Square
    largerDimension3 = picWidth3;
    smallerDimension3 = picHeight3;
    //
    picWidthAdjusted3 = bruhWidth; //from rect() layout
    imageHeightRatio3 = smallerDimension3 / largerDimension3;
    picHeightAdjusted3 = picWidthAdjusted3 * imageHeightRatio3;
  } else { //False if Portrait
    largerDimension3 = picHeight3;
    smallerDimension3 = picWidth3;
    //
    picHeightAdjusted3 = bruhHeight; //from rect() layout
    imageWidthRatio3 = smallerDimension3 / largerDimension3;
    picWidthAdjusted3 = picHeightAdjusted3 * imageWidthRatio3;
  }
  //
  //Rectangular Layout and Image Drawing to CANVAS
  rect( backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight );
  rect(yourmomX, yourmomY, yourmomWidth, yourmomHeight); //top half
  rect(bruhX, bruhY, bruhWidth, bruhHeight); //bottom half
  //
  //Background Image must be single executed code
  if (nightMode == false) tint(tintDayMode, tintDayModeOpacity); //Gray Scale: use 1/2 tint value for white (i.e. 128/256=1/2)
  if (nightMode == true) tint(tintRed, tintGreen, tintBlue, tintNightModeOpacity); //RGB: nightMode
  //image( pic, backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight);
  image( pic, backgroundImageX, backgroundImageY, picWidthAdjusted1, picHeightAdjusted1);
  //
}//End setup
//
void draw() 
{
  image(pic2, yourmomX, yourmomY, picWidthAdjusted2, picHeightAdjusted2);
  image(pic3, bruhX, bruhY, picWidthAdjusted3, picHeightAdjusted3);
}//End draw
//
void keyPressed() {
}//End keyPressed
//
void mousePressed() {
  //
  //Mouse Pressed will control background image
  if (mouseButton == LEFT) {
    nightMode = false; 
    rect( backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight );
    tint(tintDayMode, tintDayModeOpacity); //Gray Scale: use 1/2 tint value for white (i.e. 128/256=1/2)
    image( pic, backgroundImageX, backgroundImageY, picWidthAdjusted1, picHeightAdjusted1);
    //
  }
  if (mouseButton == RIGHT) { 
    nightMode = true;
    rect( backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight );
    tint(tintRed, tintGreen, tintBlue, tintNightModeOpacity); //RGB: Night Mode
    image( pic, backgroundImageX, backgroundImageY, picWidthAdjusted1, picHeightAdjusted1);
  }
}//End mousePressed
//
//End Main Program
