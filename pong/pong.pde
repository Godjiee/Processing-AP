// Ellipse variables

int posXellipse; // Ellipse position X
int posYellipse; // Ellipse position Y
int velXellipse; // Ellipse velocity X
int velYellipse; // Ellipse velocity Y
int dimEllipse; // Ellipse size
color ellipseColor; // Ellipse color

// Bar variables
int posXbar; // Bar position X
int posYbar; // Bar position Y
int dimXbar; // Bar size X
int dimYbar; // Bar size Y
color barColor;

//boolean
boolean active = true;

//image and font variables
PFont font;
PImage img;

//velocity after gameover

int velGameover;

void setup() {
  size(1000, 900);
  noStroke();
  font = loadFont("Impact.vlw");
  img = loadImage("gameover.png");
  imageMode(CENTER);
  textAlign(CENTER, CENTER);

  velGameover = int(random(7, 20));

  // Ellipse setup values
  posXellipse = 25;
  posYellipse = 0;
  dimEllipse = 50;
  velXellipse = 4;
  velYellipse = 7;
  ellipseColor = color(0);

  // Bar setup values
  dimXbar = 200;
  dimYbar = 25;
  posXbar = (width - dimXbar) / 2; // Center bar horizontally
  posYbar = height - dimYbar - 20; // Align bar from the bottom
  barColor = color(100);
}

void draw() {
  if (active == true) {
    background(255); // Reset background

    // Draw Ellipse
    fill(ellipseColor);
    ellipseMode(CORNER);
    ellipse(posXellipse, posYellipse, dimEllipse, dimEllipse);

    // Update Ellipse position / add velocity
    posXellipse += velXellipse;
    posYellipse += velYellipse;

    // Draw Bar
    fill(barColor);
    rect(constrain(mouseX, 0, width-dimXbar), posYbar, dimXbar, dimYbar);

    //Bounce ellipseoff side walls and randomize color
    if (posXellipse + dimEllipse >= width || posXellipse <= 0) {
      velXellipse *= -1;
      ellipseColor = color(random(255), random(255), random(255));
    }

    //Bounce ellipse off the bar and change color of ellipse and bar
    if (posYellipse + dimEllipse >= posYbar) {
      if (posXellipse + dimEllipse >= mouseX && posXellipse <= mouseX + dimXbar) {
        velYellipse *= -1;
        
        if (abs(velYellipse) < 20) {
          velYellipse *= 1.5;
        }
        //  println(velYellipse);

        ellipseColor = color(random(255), random(255), random(255));
        barColor = color(random(255), random(255), random(255));
      } else { //Reset Ellipse position and velocity
        active = false;
      }
    }

    //Bounce ellipse off the top wall
    if (posYellipse < 0) {
      velYellipse *= -1;
    }
  } else {
    textFont(font, 50);
    text("Game over", width/2, height/2 - 300);
    image(img, width/2, height/2, 600, 500);
  }
}

void mousePressed() {

  if (active == false) {
    active = true;
    posXellipse = 0;
    posYellipse = 0;
    velXellipse = 3;
    velYellipse = 7;
  }
}
