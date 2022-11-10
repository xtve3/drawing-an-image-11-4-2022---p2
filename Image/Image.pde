//Global Variables
int appWidth, appHeight;
Boolean widthLarger=false, heightLarger=false;
float picWidthAdjusted=0.0, picHeightAdjusted=0.0;
float backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight;
PImage pic;
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
  //
  float smallerDimension, largerDimension;
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
pic = loadImage("../Images Used/karl.jpg");
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
//shapes presented when ran
rect(yourmomX, yourmomY, yourmomWidth, yourmomHeight);
rect(bruhX, bruhY, bruhWidth, bruhHeight);
//Background Image must be single executed code
  if (nightMode == false) tint(tintDayMode, tintDayModeOpacity); //Gray Scale: use 1/2 tint value for white (i.e. 128/256=1/2)
  if (nightMode == true) tint(tintRed, tintGreen, tintBlue, tintNightModeOpacity); //RGB: nightMode
  //image( pic, backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight);
  image( pic, backgroundImageX, backgroundImageY, picWidthAdjusted, picHeightAdjusted);
  //
}//End setup
//
void draw() {

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
