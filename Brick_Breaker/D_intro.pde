void intro() {
  
  theme.play();

  //background
  background(DarkBlue);
  image(stars, 0, 0, 800, 800);
  image(ufo, ufoX, 465, 400, 400);
  ufoX = ufoX + 100;
  if (ufoX > 418) ufoX = ufoX -450;
  image(nova, 400, 55, 700, 700);
  image(rocket, 0, 200, 400, 400);

  //Brick breaker title
  textFont(magic);
  fill(white);
  textSize(175);
  text("Brick Breaker", width/2, height/8);

  //play button
  strokeWeight(6);
  stroke(black);
  fill(purple);
  tactile(300, 425, 200, 110);
  rect(300, 425, 200, 110);
  textSize(100);
  fill(black);
  tax(300, 425, 200, 110);
  text("PLAY", 400, 465);
}

void introClicks() {
  if (mouseX > 300 && mouseX< 500 && mouseY > 425 & mouseY < 535) {
    mode = GAME;
  }
}
