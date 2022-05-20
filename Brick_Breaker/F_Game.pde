void game() {
  background(DarkBlue);

  //score & lives
  textSize(80);
  fill(white);
  text("Score: " + score, 120, 700);
  text("Lives: " + lives, 680, 700);
  if (lives == 0) mode = GAMEOVER;


  //paddle
  stroke(black);
  fill(grey);
  circle(paddleX, paddleY, paddleD);
  if (leftkey == true) paddleX = paddleX - 12;
  if (rightkey == true) paddleX = paddleX + 12;
  if (paddleX > 700) paddleX = 700;
  if (paddleX < 100) paddleX = 100;

  //ball
  fill(white);
  stroke(white);
  strokeWeight(1);
  circle(ballx, bally, balld);
  timer = timer - 1;
  if (timer < 0) {
    ballx = ballx + vx;
    bally = bally + vy;
  }

  //miss
  if (bally > 800) {
    ballx = width/2;
    bally = height/2;
    timer = 80;
    vx = 0;
    vy = 5;
    lives--;
    paddleX = width/2;
    paddleY = height;
  }

  //win or lose
  if (lives < 1) {
    mode = GAMEOVER;
  }
  if (score > 75) {
    gameover.play();
    gameover.rewind();
    mode = GAMEOVER;
  }


  //bounce
  if (dist(ballx, bally, paddleX, paddleY) < balld/2 + paddleD/2) {
    vx = (ballx - paddleX)/9;
    vy = (bally - paddleY)/9;
    bump.play();
    bump.rewind();
  }

  //boarder top
  if (bally < balld/2) {
    vy = vy * -1;
    bump.play();
    bump.rewind();
  }

  //boarder sides
  if (ballx < balld/2 || ballx  > width -balld/2) {
    vx = vx * -1;
    bump.play();
    bump.rewind();
  }

  //bricks
  int i = 0;
  while (i < n) {
    if (alive[i] == true)
      manageBrick(i);
    i=i+1;
  }
}








void gameClicks() {
  if (mouseX > 0 &&  mouseX < 800 && mouseY > 0 & mouseY < 800);
  mode = PAUSE;
}

void manageBrick(int i) {
  stroke(black);
  strokeWeight(2);
  if (y[i] == 60) fill(red);
  if (y[i] == 160) fill(orange);
  if (y[i] == 260) fill(yellow);
  if (y[i] == 360) fill(green);
  circle(x[i], y[i], brickd);
  if (dist(ballx, bally, x[i], y[i]) < balld/2 + brickd/2) {
    vx = (ballx - x[i])/1.5;
    vy = (bally - y[i])/1.5;
    point.play();
    point.rewind();
    score++;
    alive[i] = false;
  }
}
