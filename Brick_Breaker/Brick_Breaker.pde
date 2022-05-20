import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//color palette
color red = #FFADAD;
color orange = #FFD6A5;
color yellow = #FDFFB6;
color green = #CAFFBF;
color blue = #A0C4FF;
color purple = #BDB2FF;
color white = #FFFFFC;
color black = #000000;
color pink = #FFC6FF;
color brown = #cb997e;
color grey = #C0C0C0;
color Bred = #EE4B2B;
color DarkBlue = #050A30;

//framework
int mode;
final int INTRO = 1;
final int GAME = 2;
final int PAUSE = 3;
final int GAMEOVER = 4;
final int OPTIONS = 5;

//keyboard variables
boolean leftkey, rightkey;

//paddle variable
float paddleX, paddleY, paddleD;

//font
PFont magic;

//images
PImage stars, ufo, nova, rocket, winner, loser;

//ufo movementt
int ufoX, ufoVX;


//ball varibles
float ballx, bally, balld;
float vx, vy;
float timer;

//brick variables
int[] x;
int[] y;
int brickd;
int n;
int tempx, tempy;
boolean[] alive;

//win conditions
int score, lives;

//sound varibles
Minim minim;
AudioPlayer point, bump, theme, gameover;



void setup() {
  size(800, 800);
  mode = INTRO;
  textAlign(CENTER, CENTER);

  //keyboard setup
  leftkey = rightkey = false;

  //paddle setup
  paddleX = width/2;
  paddleY = height;
  paddleD = 200;

  //font
  magic = createFont("magic.otf", 200);

  //images
  stars = loadImage("stars.png");

  ufo = loadImage("ufo.png");
  ufoX = 0;
  ufoVX = 5;

  nova = loadImage("nova.png");

  rocket = loadImage("rocket.png");
  
  winner = loadImage("winner.jpeg");
  
  loser = loadImage("lose.jpeg");

  //minim
  minim = new Minim(this);
  theme = minim.loadFile("theme.mp3");
  bump = minim.loadFile("bump.mp3");
  point = minim.loadFile("score.wav");
  gameover = minim.loadFile("winner.wav");

  //ball setup
  ballx = width/2;
  bally = height/2;
  balld = 10;
  vx = 0;
  vy = 5;
  timer = 80;

  //win conditions setup
  lives = 3;
  score = 100;

  //brick setup
  n = 76;
  x = new int[n];
  y = new int[n];
  alive = new boolean[n];
  brickd = 20;
  tempx = 40;
  tempy = 60;
  int i = 0;
  while (i < n) {
    x[i] = tempx;
    y[i] = tempy;
    alive[i] = true;
    tempx = tempx + 40;
    if (tempx == width) {
      tempx = 40;
      tempy = tempy + 100;
    }
    i = i +1;
  }
}



void draw () {
  //coordinates
  println(mouseX + "," + mouseY);
  //frame work
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else if (mode == OPTIONS) {
    options();
  } else {
    println("Mode error;" + mode);
  }
}
