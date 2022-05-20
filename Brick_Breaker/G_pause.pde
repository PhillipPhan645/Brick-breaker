void pause(){
  
  //resume button
  fill(white);
  strokeWeight(4);
  tactile(300, 336, 200, 125);
  rect(300, 336, 200, 125);
  textSize(70);
  tax(300, 336, 200, 125);
  text("RESUME", 400, 385);

  
  //Menu button
  fill(white);
  strokeWeight(4);
  tactile(300, 200, 200, 125);
  rect(300, 200, 200, 125);
  textSize(70);
  tax(300, 200, 200, 125);
  text("MENU", 400, 250);
  
}

void pauseClicks(){
  //resume button = game frame
  if (mouseX > 300 && mouseX< 500 && mouseY > 336 & mouseY < 461) {
    mode = GAME;
  } else {
    
    //MENU button = intro frame
    if (mouseX > 300 && mouseX< 500 && mouseY > 200 & mouseY < 325) {
      mode = INTRO;
    }
    reset();
  }
}
