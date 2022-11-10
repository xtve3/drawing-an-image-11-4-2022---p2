//Global Variables
int appWidth, appHeight;
Boolean widthLarger=false, heightLarger=false;
Boolean widthLarger2=false, heightLarger2=false;
float picWidthAdjusted=0.0, picHeightAdjusted=0.0;
float backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight;
PImage pic, pic2, pic3;
Boolean nightMode=false;
int tintDayMode=255, tintDayModeOpacity=100;
int tintRed=255, tintGreen=105, tintBlue=100, tintNightModeOpacity=1000;
float bruhX, bruhY, bruhWidth, bruhHeight, yourmomX, yourmomY, yourmomWidth, yourmomHeight;
//
void setup()
{
  size(1000, 800); //Landscape
  //Copy Display Algorithm from Hello World
  appWidth = width;
  appHeight = height;
  //
  //Image Dimensions for Aspect Ratio
  //karl.jpg
  //Note: Dimensions are found in the image file / Right Click / Properties / Details
  int picWidth = 800;
  int picHeight = 600;
  int pic2Width = 759 ; //landscape image
  int pic2Height = 604 ; //landscape
  //int pic3Width = ; //portrait image
  //int pic3Height = ; //portrait
  //
  float smallerDimension, largerDimension, smallerDimension2, largerDimension2;
  //Image Orientation: Landscape, Portrait, Square
  if ( picWidth >= picHeight ) { //True if Landscape or Square
    largerDimension = picWidth;
    smallerDimension = picHeight;
    widthLarger = true;
  } else { //False if Portrait
    largerDimension = picHeight;
    smallerDimension = picWidth;
    heightLarger = true;
  }
  //
  if ( pic2Width >= pic2Height ) { //True if Landscape or Square
    largerDimension2 = pic2Width;
    smallerDimension2 = pic2Height;
    widthLarger2 = true;
    //Landscape large image to larger space OR smaller space
  } else { //False if Portrait
    largerDimension2 = pic2Height;
    smallerDimension2 = pic2Width;
    heightLarger2 = true;
  }
  //
    //Teaching example, width is known to be larger
  float imageWidthRatio=0.0, imageHeightRatio=0.0;
  //Better Image Stretch Algorithm, smaller image to larger CANVAS
  if ( appWidth >= picWidth ) {
    picWidthAdjusted = appWidth;
    //
    if ( widthLarger == true ) imageWidthRatio = largerDimension / largerDimension;
    //
    if ( appHeight >= picHeight ) {
      if ( widthLarger == true ) imageHeightRatio = smallerDimension / largerDimension;
      picHeightAdjusted = picWidthAdjusted * imageHeightRatio;
      if (appHeight < picHeightAdjusted ) {
        println("STOP: image is too big for CANVAS");
        exit(); //stops any further use of APP
        //Remember: goal is 1:1 aspect ratio
      }
    } else {
      //Image smaller than CANVAS needs separate algorithm
    }
  } else {
    //Image smaller than CANVAS needs separate algorithm
  }
  //
  //verifying variable values
  println("app width:", appWidth,"and app height:", appHeight);
  println ("larger image diension is:", largerDimension);
  println("image dimensions are:", picWidth, picHeight);
  println("adjusted image dimensions are: (stretch is goal)", picWidthAdjusted, picHeightAdjusted);
  //
  //Population
  //.. stands for back, / stands for double click
pic = loadImage("../Images Used/LandScape/karl.jpg");
pic2 = loadImage("../Images Used/LandScape/googlelmao.JPG");
//pic3 = loadImage("");
backgroundImageX = appWidth*0;
backgroundImageY = appHeight*0;
backgroundImageWidth = appWidth-1;
backgroundImageHeight = appHeight-1;
yourmomX = bruhX = appWidth * 1.55/5;
yourmomY = appHeight * 0.55/10;
bruhY = appHeight * 3.5/5;
yourmomWidth = bruhWidth = appWidth * 2/6;
yourmomHeight = bruhHeight = appHeight * 1.2/6;
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
  image( pic, backgroundImageX, backgroundImageY, picWidthAdjusted, picHeightAdjusted);
  //
}//End setup
//
void draw() {
image(pic2, yourmomX, yourmomY, yourmomWidth, yourmomHeight);
//image(pic3, bruhX, bruhY, bruhWidth, bruhHeight);
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
  image( pic, backgroundImageX, backgroundImageY, picWidthAdjusted, picHeightAdjusted);
  //
 }
 if (mouseButton == RIGHT){ 
   nightMode = true;
   rect( backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight );
     tint(tintRed, tintGreen, tintBlue, tintNightModeOpacity); //RGB: Night Mode
   image( pic, backgroundImageX, backgroundImageY, picWidthAdjusted, picHeightAdjusted);
 }
}//End mousePressed
//
//End Main Program
