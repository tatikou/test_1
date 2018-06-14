class Act{
  int flag = 0;
  int choice[] = new int[4];
  int command[] = new int[4];
  int threat;
  
  void check_flag(){
    if(mouseX >= 360 && mouseX <= 480 && mouseY >= 560 && mouseY <= 620) {
      flag = 1;
      fight.flag = 0;
      item.flag = 0;
      mercy.flag = 0;
    }
  }
  
  void choice_music(){
    fill(255);
      textSize(30);
      if (mouseX >= 255 && mouseX <= 385 && mouseY <= 380 && mouseY >= 340) {
        fill(#ffd700);
        if (choice[0] == 1) {
          music.simple("choice.mp3");
          choice[0] = 0;
        }
      } else {
        choice[0] = 1;
        fill(255);
      }

      text("* Check", 260, 370);
      if (mouseX >= 255 && mouseX <= 385 && mouseY <= 440 && mouseY >= 400) {
        fill(#ffd700);

        if (choice[1] == 1) {
          music.simple("choice.mp3");
          choice[1] = 0;
        }
      } else {
        choice[1] = 1;
        fill(255);
      }
      text("* Threat", 260, 430);
      if (mouseX >= 495 && mouseX <= 625 && mouseY <= 380 && mouseY >= 340) {
        fill(#ffd700);
        if (choice[2] == 1) {
          music.simple("choice.mp3");
          choice[2] = 0;
        }
      } else {
        choice[2] = 1;
        fill(255);
      }
      text("* Praise", 500, 370);
      if (mouseX >= 495 && mouseX <= 625 && mouseY <= 440 && mouseY >= 400) {
        fill(#ffd700);
        if (choice[3] == 1) {
          music.simple("choice.mp3");
          choice[3] = 0;
        }
      } else {
        choice[3] = 1;
        fill(255);
      }
      text("* Hit on", 500, 430);
  }
  
  void check(){
    text("* Left Zoog      cursor.HP 10 ATK 1 DEF 0", 260, 370);
    text("* Center Zoog  cursor.HP 12 ATK 1 DEF 0", 260, 415);
    text("* Right Zoog    cursor.HP  8 ATK 1 DEF 0", 260, 455);
    text("* Their weak points are their eyes", 260, 495);
  }
  
  void threat(){
    int time = millis();
    fill(255);
      if (threat == 0) {
        if (millis() - time < 2000) {
          text(" I'll crush your eyes!", 260, 370);
        }

        if ((millis() - time >= 2000)&&(millis() - time < 4000)) {
          text("* They are scared of you", 260, 370);
        }
      } else if (threat == 1) {
        if (millis() - time < 2000) {

          text(" I'll kill every zoogs", 260, 370);
          text(" Are you ready ? ", 260, 420);
        }

        if ( (millis() - time >= 2000)&&(millis() - time < 4000)) {
          text("* They can't stop trembling", 260, 370);
        }
      } else if (threat == 2) {

        if (millis() - time < 4000) {

          text(" I had already killed ", 260, 370);
          text("  any other monsters ", 260, 415);
          text("  who I found on way here", 260, 460);
        }

        if ((millis() - time >= 4000)&&(millis() - time < 8000)) {
          text("* They are eager to run away ", 260, 370);
          text("          from here as sonn as they can", 260, 410);
        }
      } else {
        mercy.select = 1;
        if ( millis() - time >= 4000) {
          text("* They are eager to run away ", 260, 370);
          text("     from here as sonn as they can", 260, 410);
        }
      }
  }
}
