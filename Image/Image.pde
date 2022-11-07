//Global Variables
int appWidth, appHeight;
float smallerDimension, largerDimension;
boolean widthLarger=false, heightLarger=false;
float backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight;
PImage pic;
Boolean nightMode=false;
//
size(1960, 1000); //Landscape
//Copy Display Algorithm
appWidth = width;
appHeight = height;
//
//Aspect Ratio Calculation
//karl.jpg
int picWidth = 554;
int picHeight = 715;
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
if (widthLarger == true) imageWidthRatio = largerDimension / largerDimension;   
if (widthLarger == true) imageHeightRatio = smallerDimension / largerDimension;   
if (heightLarger == true) imageWidthRatio = smallerDimension / largerDimension;   
if (heightLarger == true) imageHeightRatio = largerDimension / largerDimension;
//
picWidthAdjusted = picWidth * imageWidthRatio;
picHeightAdjusted = picHeight = imageHeightRatio;  

// 
//Population
pic = loadImage("../Images Used/karl.jpg");
backgroundImageX = appWidth*0;
backgroundImageY = appHeight*0;
backgroundImageWidth = appWidth-1;
backgroundImageHeight = appHeight-1;
//
//Rectangular Layout and Image Drawing to CANVAS
//rect( backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight );
//
//if () {} else {} for a Binaary Choice, no single IF
if (nightMode == false) tint(255, 128); //Gray Scale: use 1/2 tint value for white (i.e. 128/256=1/2)
if (nightMode == true) tint(255, 105, 100); //RGB: Night Mode
//
image( pic, backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight);
