class End{
  void Game_over(){
      background(0);
      fill(255);
      textAlign(CENTER);
      text("GAME OVER", width/2, height/2);
  }
  void Win(){
    textSize(30);
    fill(0, 0, 0, 20);
    rect(width/2, height/2, width, height);
    stroke(255);
    fill(255);
    text("* You won!", 260, 370);
    text("* You gained 3 EXP", 260, 400);
  }
  void Mercy(){
    fill(0, 0, 0, 30);
    rect(width/2, height/2, width, height);
    fill(255);
    text(" You won!  I gave mercy", 260, 370);
  }
}
