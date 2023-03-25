//card
PFont font; // font
PImage img; // photo img
color clPink; //color pink
color clBlue; //color blue
color clGreen; //color green
color clPurple; //color pink
color clYellow; //color yellow


//text
int posText1X;
int posText1Y;
int posText2X;
int posText2Y;
int sizeText1;
int sizeText2;

//bars
int posBar1X;
int posBarY;
int posBar2X;
int posBar3X;
int posBar4X;
int posBar5X;
int posBar6X;
int posBar7X;
int posBar8X;
int posBar9X;
int posBar10X;
int posBar11X;
int posBar12X;


int posStaticBar1X;
int posStaticBar2X;
int posStaticBar3X;
int posStaticBar4X;
int posStaticBar5X;
int posStaticBar6X;
int posStaticBar7X;
int posStaticBar8X;
int posStaticBar9X;
int posStaticBar10X;
int posStaticBar11X;
int posStaticBar12X;

int posStaticBarY;

int barSizeX;
int barSizeY;
int StaticBarSizeX;
int StaticBarSizeY;



//speeds
int text1Speed;
int text2Speed;
int barSpeed1;
int barSpeed2;
int barSpeed3;
int barSpeed4;
int barSpeed5;
int barSpeed6;
int barSpeed7;
int barSpeed8;
int barSpeed9;
int barSpeed10;
int barSpeed11;
int barSpeed12;






void setup() {
  //screen size
  size(500,900);
  
  //colors
  clPink = color(255,113,206);
  clBlue = color(1,205,254);
  clGreen = color(5,255,161);
  clPurple = color(185,103,255);
  clYellow = color(255,251,150);
  
  noStroke();
  
  //import font + photo
  font = loadFont("Digital-7-48.vlw"); //import font
  img = loadImage("foto1.png");
  
  
  //positions
  posText1X = width/2;
  posText1Y = 100;
  posText2X = width/2;
  posText2Y = 160;
  posBar1X = 13;
  posBar2X = posBar1X + 40;
  posBar3X = posBar2X + 40;
  posBar4X = posBar3X + 40;
  posBar5X = posBar4X + 40;
  posBar6X = posBar5X + 40;
  posBar7X = posBar6X + 40;
  posBar8X = posBar7X + 40;
  posBar9X = posBar8X + 40;
  posBar10X = posBar9X + 40;
  posBar11X = posBar10X + 40;
  posBar12X = posBar11X + 40;
  
  posStaticBar1X = 13;
  posStaticBar2X = posStaticBar1X + 40;
  posStaticBar3X = posStaticBar2X + 40;
  posStaticBar4X = posStaticBar3X + 40;
  posStaticBar5X = posStaticBar4X + 40;
  posStaticBar6X = posStaticBar5X + 40;
  posStaticBar7X = posStaticBar6X + 40;
  posStaticBar8X = posStaticBar7X + 40;
  posStaticBar9X = posStaticBar8X + 40;
  posStaticBar10X = posStaticBar9X + 40;
  posStaticBar11X = posStaticBar10X + 40;
  posStaticBar12X = posStaticBar11X + 40;
  
  
  posBarY = height-10;
  posStaticBarY = height-40;
  
  //speeds
  
  text1Speed = 8;
  text2Speed = 5;
  barSpeed1 = 1;
  barSpeed2 = barSpeed1 + 1; 
  barSpeed3 = barSpeed2 + 1;
  barSpeed4 = barSpeed3 + 1;
  barSpeed5 = barSpeed4 + 1;
  barSpeed6 = barSpeed5 + 1;
  barSpeed7 = barSpeed6 + 1;
  barSpeed8 = barSpeed7 + 1;
  barSpeed9 = barSpeed8 + 1;
  barSpeed10 = barSpeed9 + 1;
  barSpeed11 = barSpeed10 + 1;
  barSpeed12 = barSpeed11 + 1;
  
  
  
  
  //Sizes
  
  sizeText1 = 52;
  sizeText2 = 28;
  barSizeX = 30;
  barSizeY = 180;
  StaticBarSizeX = 30;
  StaticBarSizeY = 100;
  
  //aligns
  textAlign(CENTER);
  imageMode(CENTER);
  //noLoop();
}
  
  
void draw() {
  //bg
  background(0);
  //text1
  fill(clPink);
  textFont(font, sizeText1); // font size
  text("Joao Correia", posText1X, posText1Y);
 
   posText1X = posText1X + text1Speed;
 
  //Text2
  fill(clGreen);
  textFont(font, sizeText2);
  text("Digital Media Design", posText2X, posText2Y);
  
  posText2X = posText2X + text2Speed;
  
  //if statement to reset TEXT 1 TO - 
  
  if (posText1X > width + (sizeText1 * 2)) {
    posText1X = 0 - (sizeText1 * 2);
  }
  
  
  //if statement to collision left and right x axis TEXT2
  
  if ((posText2X < 0 + (sizeText2 * 4)) || (posText2X > width - (sizeText2 * 4))) {
    text2Speed *= -1;
  }
  
  
  //foto
  image(img, width/2, height/2+100, 330, 400); //photo
  
  //bar config
  
  fill(clYellow);
  rect(posBar1X, posBarY, barSizeX, barSizeY);
  posBarY = posBarY - barSpeed1;
  
  fill(clYellow);
  rect(posStaticBar1X, posStaticBarY, StaticBarSizeX, StaticBarSizeY);
  
  if ((posBarY < height-140) || (posBarY > (height - 20))) {
     barSpeed1 *= -1;
  }
  
  //bar clones
  
  //bar 2
  
  fill(clGreen);
  rect(posBar2X, posBarY, barSizeX, barSizeY);
  posBarY = posBarY - barSpeed2;
  
  fill(clGreen);
  rect(posStaticBar2X, posStaticBarY, StaticBarSizeX, StaticBarSizeY);
  
  if ((posBarY < height-140) || (posBarY > (height - 20))) {
     barSpeed2 *= -1;
  }
  
  //bar 3
  
  fill(clPink);
  rect(posBar3X, posBarY, barSizeX, barSizeY);
  posBarY = posBarY - barSpeed3;
  
  fill(clPink);
  rect(posStaticBar3X, posStaticBarY, StaticBarSizeX, StaticBarSizeY);
  
  if ((posBarY < height-140) || (posBarY > (height - 20))) {
     barSpeed3 *= -1;
  }
  
  //bar 4
  
  fill(clBlue);
  rect(posBar4X, posBarY, barSizeX, barSizeY);
  posBarY = posBarY - barSpeed4;
  
  fill(clBlue);
  rect(posStaticBar4X, posStaticBarY, StaticBarSizeX, StaticBarSizeY);
  
  if ((posBarY < height-140) || (posBarY > (height - 20))) {
     barSpeed4 *= -1;
  }
  
  //bar 5
  
  fill(clPurple);
  rect(posBar5X, posBarY, barSizeX, barSizeY);
  posBarY = posBarY - barSpeed5;
  
  fill(clPurple);
  rect(posStaticBar5X, posStaticBarY, StaticBarSizeX, StaticBarSizeY);
  
  if ((posBarY < height-140) || (posBarY > (height - 20))) {
     barSpeed5 *= -1;
  }
  
  //bar 6
  
  fill(clYellow);
  rect(posBar6X, posBarY, barSizeX, barSizeY);
  posBarY = posBarY - barSpeed6;
  
  fill(clYellow);
  rect(posStaticBar6X, posStaticBarY, StaticBarSizeX, StaticBarSizeY);
  
  if ((posBarY < height-140) || (posBarY > (height - 20))) {
     barSpeed6 *= -1;
  }
  
  //bar 7
  
  fill(clGreen);
  rect(posBar7X, posBarY, barSizeX, barSizeY);
  posBarY = posBarY - barSpeed7;
  
  fill(clGreen);
  rect(posStaticBar7X, posStaticBarY, StaticBarSizeX, StaticBarSizeY);
  
  if ((posBarY < height-140) || (posBarY > (height - 20))) {
     barSpeed7 *= -1;
  }
  
  //bar 8
  
  fill(clPink);
  rect(posBar8X, posBarY, barSizeX, barSizeY);
  posBarY = posBarY - barSpeed8;
  
  fill(clPink);
  rect(posStaticBar8X, posStaticBarY, StaticBarSizeX, StaticBarSizeY);
  
  if ((posBarY < height-140) || (posBarY > (height - 20))) {
     barSpeed8 *= -1;
  }
  
  //bar 9
  
  fill(clBlue);
  rect(posBar9X, posBarY, barSizeX, barSizeY);
  posBarY = posBarY - barSpeed9;
  
  fill(clBlue);
  rect(posStaticBar9X, posStaticBarY, StaticBarSizeX, StaticBarSizeY);
  
  if ((posBarY < height-140) || (posBarY > (height - 20))) {
     barSpeed9 *= -1;
  }
  
  //bar 10
  
  fill(clGreen);
  rect(posBar10X, posBarY, barSizeX, barSizeY);
  posBarY = posBarY - barSpeed10;
  
  fill(clGreen);
  rect(posStaticBar10X, posStaticBarY, StaticBarSizeX, StaticBarSizeY);
  
  if ((posBarY < height-140) || (posBarY > (height - 20))) {
     barSpeed10 *= -1;
  }
  
  //bar 11
  
  fill(clPurple);
  rect(posBar11X, posBarY, barSizeX, barSizeY);
  posBarY = posBarY - barSpeed11;
  
  fill(clPurple);
  rect(posStaticBar11X, posStaticBarY, StaticBarSizeX, StaticBarSizeY);
  
  if ((posBarY < height-140) || (posBarY > (height - 20))) {
     barSpeed11 *= -1;
  }
  
  //bar 12
  
  fill(clYellow);
  rect(posBar12X, posBarY, barSizeX, barSizeY);
  posBarY = posBarY - barSpeed12;
  
  fill(clYellow);
  rect(posStaticBar12X, posStaticBarY, StaticBarSizeX, StaticBarSizeY);
  
  if ((posBarY < height-140) || (posBarY > (height - 20))) {
     barSpeed12 *= -1;
  }
  
  //save frame - saveFrame("frame.png");
  
  
  
}



 /* 
  colors
   
  color clpink; //var color pink
  color clblue; //var color blue
  color clgreen; //var color green
  color clpurple; //var color pink
  color clyellow; //var colorv yellow
 
 
------------------------------------------

  clpink = color(255,113,206);
  clblue = color(1,205,254);
  clgreen = color(5,255,161);
  clpurple = color(185,103,255);
  clyellow = color(255,251,150);
  
  */
