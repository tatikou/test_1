class Cursor{
  int HP = 20;
  void no_Cursor(){
    noCursor();
  }
  
  void soul() {
    if (millis() - (500 + muteki) <= 200 || millis() - HPrec <= 200) {
      if (muteki > HPrec) {
        if ((int)millis()%4 <= 2) {
          soul_dis(mouseX, mouseY, #F92500);
        }
      } else {
        soul_dis(mouseX, mouseY, 255);
      }
    } else {
      soul_dis(mouseX, mouseY, #F92500);
    }
  }

  void soul_dis(int mouseX, int mouseY, color col) {
    stroke(255, 255, 255);
    fill(col);
    stroke(col);
    strokeWeight(5);
    ellipse(mouseX-6, mouseY-4, 10, 10);
    ellipse(mouseX+6, mouseY-4, 10, 10);
    strokeWeight(1);
    triangle(mouseX-6, mouseY+4, mouseX, mouseY, mouseX+6, mouseY+4);
    triangle(mouseX-6.75, mouseY+4, mouseX, mouseY+10, mouseX+6.75, mouseY+4);
  }
  
  void self_HP_calc(){
    switch(cursor.HP) {
    case(19):
    setting.damage = 2;
    break;
    case(18):
    setting.damage = 4;
    break;
    case(17):
    setting.damage = 6;
    break;
    case(16):
    setting.damage = 8;
    break;
    case(15):
    setting.damage = 10;
    break;
    case(14):
    setting.damage = 12;
    break;
    case(13):
    setting.damage = 14;
    break;
    case(12):
    setting.damage = 16;
    break;
    case(11):
    setting.damage = 18;
    break;
    case(10):
    setting.damage = 20;
    break;
    case(9):
    setting.damage = 22;
    break;
    case(8):
    setting.damage = 24;
    break;
    case(7):
    setting.damage = 26;
    break;
    case(6):
    setting.damage = 28;
    break;
    case(5):
    setting.damage = 30;
    break;
    case(4):
    setting.damage = 32;
    break;
    case(3):
    setting.damage = 34;
    break;
    case(2):
    setting.damage = 36;
    break;
    case(1):
    setting.damage = 38;
    break;
    case(0):
    setting.damage = 40;
    break;
    default:
    }
  }
}
