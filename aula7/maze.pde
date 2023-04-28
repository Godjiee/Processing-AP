//implementação basica do jogo maze

PFont font;
PImage imgRIGHT;
PImage imgLEFT;

//estrutura do terreno do jogo maze

int nPosC = 4; //HORIZONTAL

int nPosL = 4; //VERTICAL

boolean [][]grid;

boolean LR;

int posInicialC = 0; //COLUNA
int posInicialL = 0; //LINHA

int posFinalC = 3; // COLUNA
int posFinalL = 3; // LINHA


int posPlayerC = 0;
int posPlayerL = 0;



int dimRect = 200; //dimensão rectangulo

boolean active = true;


void setup() {
  background(255);
  size(800, 800);
  
  font = loadFont("Impact.vlw");
  imgRIGHT = loadImage("playerRIGHT.png");
  imgLEFT = loadImage("playerLEFT.png");
  
  LR = true;
  
  grid = new boolean [nPosC][nPosL];
  //col1
  grid [0][0] = true;
  grid [0][1] = true;
  grid [0][2] = false;
  grid [0][3] = false;
  //col2
  grid [1][0] = false;
  grid [1][1] = true;
  grid [1][2] = true;
  grid [1][3] = false;
  //col3
  grid [2][0] = false;
  grid [2][1] = false;
  grid [2][2] = true;
  grid [2][3] = true;
  //col4
  grid [3][0] = false;
  grid [3][1] = false;
  grid [3][2] = false;
  grid [3][3] = true;
}

void draw () {
  //ciclo para desenhar area de jogo( 2 ciclos, um dentro do outro)
  //1º cocçp itera nas colunas e 2º ciclo nas linhas
  //as posições validas no percurso são aqui marcadas/desenhadas a preto
  //este código também poderá ficar numa função própria
  if (active == true) {
    gridDraw();
    playerDraw();
    meta();

    if ((posPlayerL == posFinalL) && (posPlayerC == posFinalC)) {
      active = false;
    }
  } else {
    active = false;
    color(0);
    textAlign(CENTER, CENTER);
    textFont(font, 50);
    text("Game over", width/2, height/2 - 300);
    textFont(font, 40);
    text("Press R to restart", width/2, height/2 - 250);
  }
}

void gridDraw() {

  for (int i = 0; i < nPosC; i++) {
    for (int j = 0; j < nPosL; j++) {
      rectMode(CORNER);
      color(0);
      fill(255);
      if (grid[i][j] == true) {
        fill(200);
      }
      rect(i*dimRect, j*dimRect, dimRect, dimRect);
    }
  }
}

void playerDraw() {

  //desenhar jogador
  fill(0, 0, 0);
  imageMode(CENTER);
  
  if (LR){
    image(imgRIGHT, posPlayerC * dimRect + dimRect/2, posPlayerL * dimRect + dimRect/2, dimRect/2, dimRect/2);
  }else{
    image(imgLEFT, posPlayerC * dimRect + dimRect/2, posPlayerL * dimRect + dimRect/2, dimRect/2, dimRect/2);
  }
  
}

void meta() {
  //desenhar casa final
  noStroke();
  rectMode(CORNER);
  fill(255, 0, 0);
  rect(posFinalC*dimRect, posFinalL*dimRect, dimRect, dimRect);
}


//a função keyPressed() é chamada sempre que se pressiona uma tecla do teclado
//corrigir /adaptar esta função para tratar de todas as ateclas e movimentos possiveis
void keyPressed() {

  if (key == CODED) {
    if (keyCode == UP) {
      if ( (posPlayerL != 0) && (grid[posPlayerC][posPlayerL-1] == true) ) {
        posPlayerL = posPlayerL - 1;
      }
    }
    if (keyCode == DOWN) {
      if ( (posPlayerL != nPosL-1) && (grid[posPlayerC][posPlayerL+1] == true) ) {
        posPlayerL = posPlayerL + 1;
      }
    }
    if (keyCode == LEFT) {
      LR = false;
      if ( (posPlayerC != 0) && (grid[posPlayerC-1][posPlayerL] == true) ) {
        posPlayerC = posPlayerC - 1;
      }
    }
    if (keyCode == RIGHT) {
      LR = true;
      if ( (posPlayerC != nPosC-1) && (grid[posPlayerC+1][posPlayerL] == true) ) {
        posPlayerC = posPlayerC + 1;
      }
    }
  }
  
  if ((key == 'r'  || key == 'R') && !(active)) {
  reset();
}
}

void reset(){
  posPlayerC = posInicialC;
  posPlayerL = posInicialL;
  active = true;
}
