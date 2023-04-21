
float[] x; //letter pos x
float[] y; //letter pos y
char[] letter; // letter character
float[] fsize; // font size
float[] vel; // velocity
color[] c; // color

int NLETTERS = 350;

PFont font; // font
boolean[] queda;

void setup() {
  background(255);
  fullScreen();
  font = loadFont("Slaytanic-48.vlw"); //import font
  textFont(font); //activate font
  textAlign(CENTER, CENTER);

  x = new float[NLETTERS]; //letter pos x
  y = new float[NLETTERS]; //letter pos y
  letter = new char[NLETTERS]; // letter character
  fsize = new float[NLETTERS]; // font size
  vel = new float[NLETTERS]; // velocity
  c = new color[NLETTERS]; // color
  queda = new boolean[NLETTERS];


  //for (inicialização; condição; expressão) {intruções};

  reset();

  noStroke();
}

void draw() {
  //background(255);
  fill(255, 80);
  rect(0, 0, width, height);
  for (int i = 0; i < NLETTERS; i++) {

    float distMouseLetter = dist(mouseX, mouseY, x[i], y[i]);

    color tempC;

    char tempLetter;

    if (distMouseLetter < 100) {
      tempC = color(255, 0, 0);
      tempLetter = char(int(120));
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
    //y[i] += random(-vel[i], vel[i]);

    if (queda[i]) {
      y[i] += vel[i];
    } else {
      y[i] += random(-vel[i], vel[i]);
    }

    // check if letter is too close to the edges of the screen
    if (x[i] < 100) {
      x[i] = 100; // set position to edge of barrier
    } else if (x[i] > width - 100) {
      x[i] = width - 100; // set position to edge of barrier
    }

    if (y[i] < 100) {
      y[i] = 100; // set position to edge of barrier
    } else if (y[i] > height - 100) {
      y[i] = height - 100; // set position to edge of barrier
    }
  }
}

void mousePressed() {
  if (mouseButton == LEFT) {
    for (int i = 0; i < NLETTERS; i++) {
      float distMouseLetter = dist(mouseX, mouseY, x[i], y[i]);
      if (distMouseLetter < 100) {
        queda[i] = true;
        c[i] = color(255, 0, 0);
      }
    }
  }
  if (mouseButton == RIGHT) {
    reset();
  }
}


void reset() {
  
      for ( int i = 0; i < NLETTERS; i++ ) {
      x[i] = random(width);
      y[i] = random(height);
      letter[i] = char(int(random(65, 90)));
      fsize[i] = random(30, 60);
      vel[i] = random(2, 7);
      c[i] = color(random(100));
      queda[i] = false;
    }
  
}
