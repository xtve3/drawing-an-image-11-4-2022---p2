//Global Variables
int appWidth, appHeight;
Boolean widthLarger=false, heightLarger=false;
Boolean widthLarger2=false, heightLarger2=false;
float picWidthAdjusted=0.0, picHeightAdjusted=0.0;
float picWidthAdjusted2=0.0, picHeightAdjusted2=0.0;
//float picWidthAdjusted3=0.0, picHeightAdjusted3=0.0;
float bruhX, bruhY, bruhWidth, bruhHeight; //bottom half
float yourmomX, yourmomY, yourmomWidth, yourmomHeight; //top half
float backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight;
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
  //pic3 = loadImage("../Images Used/Portrait/solid-5-panel-wood-ed.png");
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
  //karl.jpg
  //Note: Dimensions are found in the image file / Right Click / Properties / Details
  int picWidth1 = 800; //karl landscape
  int picHeight1 = 600; 
  int picWidth2 = 759; //google landscape image
  int picHeight2 = 604; 
  int picWidth3 = 278; //door portrait image
  int picHeight3 = 600; 
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
  float imageHeightRatio2=0.0, imageWidthRatio2=0.0;
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
  //Image is either larger or smaller than rect (including CANVAS)
  //Google image: landscape into landscape 
  if ( widthLarger2 == true ) { //Landscape or sqaure is TRUE
  picWidthAdjusted2 = yourmomWidth;
  imageHeightRatio2 = smallerDimension2 / largerDimension2;
  picHeightAdjusted2 = picWidthAdjusted2 * imageHeightRatio2;
  } else { //portrait is TRUE, heightLarger2==true
  picHeightAdjusted2 = yourmomHeight;
  imageWidthRatio2 = smallerDimension2 / largerDimension2;
  picHeightAdjusted2 = picHeightAdjusted2 * imageWidthRatio2;
  }
  //
  //verifying variable values
  println("app width:", appWidth,"and app height:", appHeight);
  println ("larger image diension is:", largerDimension);
  println("image dimensions are:", picWidth, picHeight);
  println("adjusted image dimensions are: (stretch is goal)", picWidthAdjusted, picHeightAdjusted);
  //
  println("app width:", pic2Width,"and app height:", pic2Height);
  println ("larger image diension is:", widthLarger2, "or", heightLarger2);
  println("Rectangle dimensions are:", yourmomWidth, yourmomHeight );
  println("Scale Ratios, width: ", "height is", imageHeightRatio2);
  println("adjusted image dimensions are: (stretch is goal):", picWidthAdjusted, picHeightAdjusted);
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
