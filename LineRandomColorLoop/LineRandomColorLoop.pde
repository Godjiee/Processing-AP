//animated line
int lx;
int vx;

color cl ; // cor da linha


void setup() {
  size(1800, 800);
  lx = 100; //line x pos
  vx = 99;
  cl = color(255, 0, 255);
}

void draw() {
  background(0); // bg black, so it cleans the line trail, and don't "paint" the screen
  strokeWeight(3); // stroke size
  stroke(cl);  // stroke color
  line(lx, 0, lx, 799); // line (posx,posY,?, height)
  lx = lx + vx; // lx adds 20 x pos in loop
  
  if ((lx > width - 100) || (lx < 100)){
    //lx = 100; 
    vx = vx * (-1);
    
    cl = color(random(255), random(255), random(255)); // function that generates random numbers
  }
  
}
