/*
float x, y; //letter pos
 char letter; // letter character
 float fsize; // font size
 float vel; // velocity
 color c; // color
 */

//arrays

float[] x; //letter pos x
float[] y; //letter pos y
char[] letter; // letter character
float[] fsize; // font size
float[] vel; // velocity
color[] c; // color

int NLETTERS = 500;

PFont font; // font

void setup() {
  background(255);
  fullScreen();
  font = loadFont("Slaytanic-48.vlw"); //import font
  textFont(font); //activate font
  textAlign(CENTER, CENTER);

  //initialize variables
  /*
  x = random(width);
   y = random(height);
   fsize = random(30, 60);
   vel = random(10, 60);
   c = color(random(255), 0, 0);
   letter = char(int(random(65, 90))); //int to only generate int numbers, ascci table works with int numbers
   */

  x = new float[NLETTERS]; //letter pos x
  y = new float[NLETTERS]; //letter pos y
  letter = new char[NLETTERS]; // letter character
  fsize = new float[NLETTERS]; // font size
  vel = new float[NLETTERS]; // velocity
  c = new color[NLETTERS]; // color

  //initialize arrays

  //x[0] = random(width);

  //for (inicialização; condição; expressão) {intruções};

  for ( int i = 0; i < NLETTERS; i++ ) {
    x[i] = random(width);
    y[i] = random(height);
    letter[i] = char(int(random(65, 90)));
    fsize[i] = random(30, 60);
    vel[i] = random(2, 7);
    c[i] = color(random(255), 0, 0);
  }

  noStroke();
}

void draw() {
  //background(255);
  fill(255, 100);
  rect(0, 0, width, height);
  for (int i = 0; i < NLETTERS; i++) {

    float distMouseLetter = dist(mouseX, mouseY, x[i], y[i]);

    color tempC;

    char tempLetter;

    if (distMouseLetter < 100) {
      tempC = color(0,0,255);
      tempLetter = char(int(90));
    } else {
      tempC = c[i];
      tempLetter = letter[i];
    }

    textFont(font, fsize[i]);
    fill(tempC);
    text(tempLetter, x[i], y[i]);
    //fill(0, 255, 0);
    //ellipse(x[i], y[i], 3, 3); //letter center point

    //move
    x[i] += random(-vel[i], vel[i]);
    y[i] += random(-vel[i], vel[i]);
  }
  
}
