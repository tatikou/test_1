class Fight{
  int flag = 0;
  void check_flag(){
    if(mouseX >= 200 && mouseX <= 320 && mouseY >= 560 && mouseY <= 620) {
      flag = 1;
      act.flag = 0;
      item.flag = 0;
      mercy.flag = 0;
    }
  }
  boolean range(Enemy enemy){
    if(mouseX >=  235 + (200 * enemy.i) && mouseX <= 365 + (200 * enemy.i) && mouseY >= 115 && mouseY <= 315 && enemy.zHP >= 0){
      enemy.zHP -= 2;
      enemy.rightcount++;
      enemy.leftcount++;
      music.simple("DAMAGE.mp3");
      fight.flag = 0;
      return true;
    }else{
      return false;
    }
  }
  void red_range(Enemy enemy){
    fill(255);
    text("* Choose a zoog", 260, 370);
    if(mouseX >=  235 + (200 * enemy.i) && mouseX <= 365 + (200 * enemy.i) && mouseY >= 115 && mouseY <= 315 && enemy.zHP >= 0) {
      stroke(255, 0, 0, 100);
      fill(255, 0, 0, 100);
      rect(300 + (200 * enemy.i), 215, 130, 200);
    } 
  }
}
