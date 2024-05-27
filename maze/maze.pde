//implementação basica do jogo maze




PFont font;
PImage RIGHTd;
PImage LEFTd;
PImage DOWNd;
PImage UPd;

PImage grass;
PImage path;

//estrutura do terreno do jogo maze

int nPosC = 16; //HORIZONTAL

int nPosL = 16; //VERTICAL

boolean [][]grid;
boolean [][]visited;
boolean start = false;
//int [0,1,2]

//boolean LR;

int direction;


int posInicialC = 0; //COLUNA
int posInicialL = 5; //LINHA

int posFinalC = 11; // COLUNA
int posFinalL = 15; // LINHA


int posPlayerC = posInicialC;
int posPlayerL = posInicialL;



int dimRect = 50; //dimensão rectangulo

boolean active = false;

boolean tempoEsgotado = false;

//time

int time30s;
int time1s;
int segundo = 1000; //1 segundos
int segundosPassados = 30;

int espera30s = segundosPassados * segundo;



void setup() {
  background(255);
  size(800, 800);

  font = loadFont("Impact.vlw");
  RIGHTd = loadImage("RIGHT.png");
  LEFTd = loadImage("LEFT.png");
  UPd = loadImage("UP.png");
  DOWNd = loadImage("DOWN.png");

  grass = loadImage("grass.png");
  path = loadImage("path.png");

  direction = 1;

  //guardar o tempo em milisegundos passado desde o inicio do programa
  time30s = millis();
  time1s = millis();

  //LR = true;

  visited = new boolean [nPosC][nPosL];
  grid = new boolean [nPosC][nPosL];
  //col0
  grid [0][0] = false;
  grid [0][1] = false;
  grid [0][2] = false;
  grid [0][3] = false;
  grid [0][4] = false;
  grid [0][5] = true;
  grid [0][6] = false;
  grid [0][7] = false;
  grid [0][8] = false;
  grid [0][9] = false;
  grid [0][10] = false;
  grid [0][11] = false;
  grid [0][12] = false;
  grid [0][13] = false;
  grid [0][14] = true;
  grid [0][15] = false;

  //col1
  grid [1][0] = true;
  grid [1][1] = true;
  grid [1][2] = false;
  grid [1][3] = false;
  grid [1][4] = false;
  grid [1][5] = true;
  grid [1][6] = false;
  grid [1][7] = false;
  grid [1][8] = false;
  grid [1][9] = false;
  grid [1][10] = true;
  grid [1][11] = true;
  grid [1][12] = true;
  grid [1][13] = true;
  grid [1][14] = true;
  grid [1][15] = true;

  //col2
  grid [2][0] = false;
  grid [2][1] = true;
  grid [2][2] = true;
  grid [2][3] = true;
  grid [2][4] = true;
  grid [2][5] = true;
  grid [2][6] = true;
  grid [2][7] = true;
  grid [2][8] = true;
  grid [2][9] = false;
  grid [2][10] = false;
  grid [2][11] = false;
  grid [2][12] = false;
  grid [2][13] = true;
  grid [2][14] = false;
  grid [2][15] = true;


  //col3
  grid [3][0] = false;
  grid [3][1] = false;
  grid [3][2] = false;
  grid [3][3] = true;
  grid [3][4] = false;
  grid [3][5] = true;
  grid [3][6] = false;
  grid [3][7] = false;
  grid [3][8] = true;
  grid [3][9] = true;
  grid [3][10] = true;
  grid [3][11] = false;
  grid [3][12] = false;
  grid [3][13] = true;
  grid [3][14] = false;
  grid [3][15] = true;

  //col4
  grid [4][0] = false;
  grid [4][1] = false;
  grid [4][2] = false;
  grid [4][3] = true;
  grid [4][4] = false;
  grid [4][5] = true;
  grid [4][6] = true;
  grid [4][7] = false;
  grid [4][8] = false;
  grid [4][9] = false;
  grid [4][10] = true;
  grid [4][11] = true;
  grid [4][12] = false;
  grid [4][13] = true;
  grid [4][14] = false;
  grid [4][15] = false;


  //col5
  grid [5][0] = false;
  grid [5][1] = false;
  grid [5][2] = false;
  grid [5][3] = true;
  grid [5][4] = false;
  grid [5][5] = false;
  grid [5][6] = true;
  grid [5][7] = true;
  grid [5][8] = false;
  grid [5][9] = false;
  grid [5][10] = false;
  grid [5][11] = false;
  grid [5][12] = false;
  grid [5][13] = true;
  grid [5][14] = false;
  grid [5][15] = false;


  //col6
  grid [6][0] = false;
  grid [6][1] = false;
  grid [6][2] = false;
  grid [6][3] = false;
  grid [6][4] = false;
  grid [6][5] = false;
  grid [6][6] = false;
  grid [6][7] = true;
  grid [6][8] = true;
  grid [6][9] = false;
  grid [6][10] = false;
  grid [6][11] = true;
  grid [6][12] = true;
  grid [6][13] = true;
  grid [6][14] = false;
  grid [6][15] = false;


  //col7
  grid [7][0] = false;
  grid [7][1] = true;
  grid [7][2] = true;
  grid [7][3] = true;
  grid [7][4] = true;
  grid [7][5] = true;
  grid [7][6] = false;
  grid [7][7] = false;
  grid [7][8] = true;
  grid [7][9] = false;
  grid [7][10] = false;
  grid [7][11] = true;
  grid [7][12] = false;
  grid [7][13] = false;
  grid [7][14] = false;
  grid [7][15] = false;

  //col8
  grid [8][0] = false;
  grid [8][1] = true;
  grid [8][2] = false;
  grid [8][3] = false;
  grid [8][4] = false;
  grid [8][5] = false;
  grid [8][6] = false;
  grid [8][7] = false;
  grid [8][8] = true;
  grid [8][9] = true;
  grid [8][10] = true;
  grid [8][11] = true;
  grid [8][12] = false;
  grid [8][13] = false;
  grid [8][14] = true;
  grid [8][15] = true;

  //col9
  grid [9][0] = false;
  grid [9][1] = true;
  grid [9][2] = true;
  grid [9][3] = true;
  grid [9][4] = true;
  grid [9][5] = true;
  grid [9][6] = false;
  grid [9][7] = true;
  grid [9][8] = true;
  grid [9][9] = false;
  grid [9][10] = false;
  grid [9][11] = true;
  grid [9][12] = true;
  grid [9][13] = true;
  grid [9][14] = true;
  grid [9][15] = false;

  //col10
  grid [10][0] = false;
  grid [10][1] = false;
  grid [10][2] = false;
  grid [10][3] = true;
  grid [10][4] = false;
  grid [10][5] = true;
  grid [10][6] = false;
  grid [10][7] = false;
  grid [10][8] = false;
  grid [10][9] = false;
  grid [10][10] = false;
  grid [10][11] = true;
  grid [10][12] = false;
  grid [10][13] = false;
  grid [10][14] = false;
  grid [10][15] = false;

  //col11
  grid [11][0] = true;
  grid [11][1] = true;
  grid [11][2] = false;
  grid [11][3] = true;
  grid [11][4] = false;
  grid [11][5] = true;
  grid [11][6] = false;
  grid [11][7] = false;
  grid [11][8] = true;
  grid [11][9] = true;
  grid [11][10] = true;
  grid [11][11] = true;
  grid [11][12] = false;
  grid [11][13] = true;
  grid [11][14] = true;
  grid [11][15] = true;

  //col12
  grid [12][0] = false;
  grid [12][1] = true;
  grid [12][2] = true;
  grid [12][3] = true;
  grid [12][4] = false;
  grid [12][5] = true;
  grid [12][6] = true;
  grid [12][7] = true;
  grid [12][8] = true;
  grid [12][9] = false;
  grid [12][10] = false;
  grid [12][11] = false;
  grid [12][12] = false;
  grid [12][13] = true;
  grid [12][14] = false;
  grid [12][15] = false;

  //col13
  grid [13][0] = false;
  grid [13][1] = true;
  grid [13][2] = false;
  grid [13][3] = false;
  grid [13][4] = false;
  grid [13][5] = true;
  grid [13][6] = false;
  grid [13][7] = false;
  grid [13][8] = false;
  grid [13][9] = true;
  grid [13][10] = true;
  grid [13][11] = true;
  grid [13][12] = true;
  grid [13][13] = true;
  grid [13][14] = false;
  grid [13][15] = false;

  //col14
  grid [14][0] = false;
  grid [14][1] = true;
  grid [14][2] = false;
  grid [14][3] = false;
  grid [14][4] = false;
  grid [14][5] = false;
  grid [14][6] = false;
  grid [14][7] = false;
  grid [14][8] = false;
  grid [14][9] = true;
  grid [14][10] = false;
  grid [14][11] = false;
  grid [14][12] = false;
  grid [14][13] = true;
  grid [14][14] = true;
  grid [14][15] = false;

  //col15
  grid [15][0] = false;
  grid [15][1] = true;
  grid [15][2] = true;
  grid [15][3] = true;
  grid [15][4] = true;
  grid [15][5] = true;
  grid [15][6] = true;
  grid [15][7] = true;
  grid [15][8] = true;
  grid [15][9] = true;
  grid [15][10] = false;
  grid [15][11] = false;
  grid [15][12] = false;
  grid [15][13] = false;
  grid [15][14] = false;
  grid [15][15] = false;

  initVisited();

  //colocar a posição incial como visitada

  visited[posPlayerC][posPlayerL] = true;
}

void draw () {
  //ciclo para desenhar area de jogo( 2 ciclos, um dentro do outro)
  //1º cocçp itera nas colunas e 2º ciclo nas linhas
  //as posições validas no percurso são aqui marcadas/desenhadas a preto
  //este código também poderá ficar numa função própria
  //noLoop();
  if (!start) {
    fill(255);
    rect(0, 0, 800, 800);
    fill(0);
    textAlign(CENTER, CENTER);
    textFont(font, 50);
    text("Press R to start", width/2, height/2);
  } else {

    if (active == true) {
      gridDraw();
      playerDraw();
      meta();
      tempo();
      mostraTempo();

      if ((posPlayerL == posFinalL) && (posPlayerC == posFinalC)) {
        active = false;
      }
    } else {
      color(0);
      textAlign(CENTER, CENTER);
      textFont(font, 50);
      if (tempoEsgotado == true) {
        text("Time is over", width/2, height/2 - 300);
      } else {
        text("Game over", width/2, height/2 - 300);
      }
      text("Press R to restart", width/2, height/2 - 250);
    }
  }
}
void gridDraw() {

  for (int i = 0; i < nPosC; i++) {
    for (int j = 0; j < nPosL; j++) {
      imageMode(CORNER);
      color(0);
      fill(255);
      if (grid[i][j] == true) {
        fill(255, 0, 0);
      }
      if (visited[i][j] == false) {
        image(grass, i*dimRect, j*dimRect, dimRect, dimRect);
      } else {
        image(path, i*dimRect, j*dimRect, dimRect, dimRect);
      }
    }
  }
}

void initVisited() {
  for (int i = 0; i < nPosC; i++) {
    for (int j = 0; j < nPosL; j++) {
      visited[i][j] = false;
    }
  }
}

void playerDraw() {

  //desenhar jogador
  fill(0, 0, 0);
  imageMode(CENTER);

  if (direction == 1) {
    image(RIGHTd, posPlayerC * dimRect + dimRect/2, posPlayerL * dimRect + dimRect/2, dimRect/2, dimRect/2);
  }
  if (direction == 2) {
    image(LEFTd, posPlayerC * dimRect + dimRect/2, posPlayerL * dimRect + dimRect/2, dimRect/2, dimRect/2);
  }

  if (direction == 3) {
    image(UPd, posPlayerC * dimRect + dimRect/2, posPlayerL * dimRect + dimRect/2, dimRect/2, dimRect/2);
  }

  if (direction == 4) {
    image(DOWNd, posPlayerC * dimRect + dimRect/2, posPlayerL * dimRect + dimRect/2, dimRect/2, dimRect/2);
  }
}

void playerpath() {
  image(path, posPlayerC * dimRect + dimRect/2, posPlayerL * dimRect + dimRect, dimRect, dimRect);
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
      direction = 3;
      if ( (posPlayerL != 0) && (grid[posPlayerC][posPlayerL-1] == true) ) {
        posPlayerL = posPlayerL - 1;
      }
    }
    if (keyCode == DOWN) {
      direction = 4;
      if ( (posPlayerL != nPosL-1) && (grid[posPlayerC][posPlayerL+1] == true) ) {
        posPlayerL = posPlayerL + 1;
      }
    }
    if (keyCode == LEFT) {
      direction = 2;
      if ( (posPlayerC != 0) && (grid[posPlayerC-1][posPlayerL] == true) ) {
        posPlayerC = posPlayerC - 1;
      }
    }
    if (keyCode == RIGHT) {
      direction = 1;
      if ( (posPlayerC != nPosC-1) && (grid[posPlayerC+1][posPlayerL] == true) ) {
        posPlayerC = posPlayerC + 1;
      }
    }
  }

  if ((key == 'r'  || key == 'R') && !(active)) {
    reset();
  }

  visited[posPlayerC][posPlayerL] = true;
}

void reset() {
  start = true;
  posPlayerC = posInicialC;
  posPlayerL = posInicialL;
  active = true;
  time30s = millis(); //reset tempo
  time1s = millis();
  segundosPassados = 30;
  tempoEsgotado = false;
}


void tempo() {
  if (millis() - time1s >= segundo) {
    segundosPassados--;
    time1s = millis();
    println("tempo="+segundosPassados+"segundos");
  }

  if (millis() - time30s >= espera30s) {
    tempoEsgotado = true;
    active = false;
  }
}

void mostraTempo() {
  fill(0, 0, 0, 0.5);
  rect(width - 92, 20, 70, 50);
  fill(0);
  textFont(font, 40);
  text(segundosPassados, width - 90, 60);
}
