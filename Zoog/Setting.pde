class Setting{
  int zoognum = 3;
  int f1 = 1,f2 = 1,f3 = 1;
  int damage = 0;
  int flag[] = new int[4];
  int mercy = 0;
  void Timelimit(){
    fill(255);
    textSize(15);
    timeLimit = 300;
    timeLimit -= millis()/1000;
    text("zoogs : " + str(zoognum) + "    TimeLimit : " + str(timeLimit), 780, 30);
  }
  
  void Textbox(){
    //battle-----step1
    //textbox
    strokeWeight(7);
    stroke(255);
    fill(0);
    rect(500, 420, 560, 200);
  }
  
  void Status_first(int HP,int damage){
    stroke(#EB7413);
    textSize(21);
    fill(255);
    text("You", 210, 545);
    strokeWeight(30);
    text("   LV 19      HP         "+ str(HP)+"/20", 280, 545);
    //MyLife
    stroke(255);
    strokeWeight(1);
    fill(#FF0037);
    rect(455, 536, 40, 20);
    fill(#00FF41);
    rect(455-damage/2, 536, 40-damage, 20);
    fill(0);
  }
  
  void Status_second(int HP,int damage){
    stroke(255);
    fill(255);
    text("You", 210, 645);
    strokeWeight(30);
    text("   LV 19            HP         "+ str(HP)+"/20", 280, 645);

    strokeWeight(1);
    fill(#FF0037);
    rect(455, 636, 40, 20);
    fill(#00FF41);
    rect(455-damage/2, 636, 40-damage, 20);
    fill(0);
  }
  float Speed_change(int zoognum){
    if (zoognum == 2) {
      return 2;
    } else if (zoognum == 1) {
      return 3.5;
    }else {
      return 1;
    }
  }
  
  void check_zoog_num(){
    if(enemy1.zHP <= 0 && f1 == 1){
      setting.zoognum--;
      f1 = 0;
    }
    if(enemy2.zHP <= 0 && f2 == 1){
      setting.zoognum--;
      f2 = 0;
    }
    if(enemy3.zHP <= 0 && f3 == 1){
      setting.zoognum--;
      f3 = 0;
    }
  }
  
  void touch_music(int i,int j){
    if (mouseX >= 200 + (i * 160) && mouseX <= 320 + (i * 160) && mouseY >= 560 && mouseY <= 620) {
      strokeWeight(3);
      stroke(#ffd700);
  
      if (flag[i] == 1) {
        music.simple("choice.mp3");
        flag[i] = 0;
      }
    } else {
      flag[i] = 1;
      strokeWeight(3);
      if (j == 1 && i == 3) {
        stroke(#FFEF85);
      } else {
        stroke(#EB7413);
      }
    }
    rect(260 + (i * 160), 590, 120, 55);
  }
}
