//tactile function (squares/rectangles)
void tactile(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    stroke(green);
  } else {
    stroke(black);
  }
}

//tactile function (circles)
void tact (int x, int y, int r) {
  if (dist(x, y, mouseX, mouseY)<r) {
    stroke(Bred);
  } else {
    stroke(white);
  }
}

//tactile (words)
void tax(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    fill(green);
  } else {
    fill(black);
  }
}

void keyPressed() {
  if (keyCode == LEFT) leftkey = true;
  if (keyCode == RIGHT) rightkey = true;
}

void keyReleased() {
  if (keyCode == LEFT) leftkey = false;
  if (keyCode == RIGHT) rightkey = false;
}

void reset() {
  ballx = width/2;
  bally = height/2;
  balld = 10;
  vx = 0;
  vy = 5;
  timer = 80;
  lives = 3;
  score = 0;
  
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
  paddleX = width/2;
  paddleY = height;
}
