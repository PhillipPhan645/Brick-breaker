void gameover() {
  background(DarkBlue);
  textSize(100);

  if (score > 75) {
    image(winner, 0, 0, width, height);
    fill(yellow);
    text("Winner!", width/2, height/8);
  }

  if (lives < 1) {
    image(loser, 0, 0, width, height);
    fill(Bred);
    text("Try Again ):", width/2, height/8);
  }
  
  stroke(black);
  fill(blue);
  tactile(300, 500, 200, 100);
  rect(300, 500, 200, 100);
  tax(300, 500, 200, 100);
  text("Menu", 400, 533);
}
void gameoverClicks() {
  if (mouseX > 300 && mouseX< 500 && mouseY > 500 & mouseY < 600) {
    mode = INTRO;
    reset();
    theme.rewind();
  }
}
