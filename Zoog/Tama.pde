class Tama {
  float TX, TY, TR, TX1, TY1, TR1, TX2, TR2, TY2, TX3, TR3, TY3;
  Music music = new Music();
  Tama(float tx, float ty, float r, float tx1, float ty1, float r1, float tx2, float ty2, float r2, float tx3, float ty3, float r3) {
    TX = tx;
    TY = ty;
    TR = r;
    TX1 = tx1;
    TY1 = ty1;
    TR1 = r1;
    TX2 = tx2;
    TR2 = r2;
    TY2 = ty2;
    TX3 = tx3; 
    TR3 = r3;
    TY3 = ty3;
  }

  void update() {

    TY += 7;
    TY1 += 3;
    TY2 += 5;
    TY3 += 1;

    fill(#00FF41);
    stroke(#00FF41);

    triangle(TX-15, TY, TX, TY-45, TX+15, TY);
    ellipse(TX, TY, 30, 30);
    fill(255);
    stroke(255);
    triangle(TX1-15, TY1, TX1, TY1-45, TX1+15, TY1);
    ellipse(TX1, TY1, TR1+30, TR1+30);
    triangle(TX2-15, TY2, TX2, TY2-45, TX2+15, TY2);
    ellipse(TX2, TY2, TR2+30, TR2+30);
    triangle(TX3-15, TY3, TX3, TY3-45, TX3+15, TY3);
    ellipse(TX3, TY3, TR3+30, TR3+30);
    //stroke(255, 0, 0);
    //ellipse(tx, ty, r, r);
    if (TY > height || TY < 0) {
      TY = 0;
      TX = random(width);
      if (TY1 > height || TY1 < 0) {
        TY1 = 0;
        TX1 = random(width/2) + random(width/2);
        if (TY2 > height || TY2 < 0) {
          TY2 = 0;
          TX2 = random(width/3) *3;
        }
        if (TY3 > height || TY3 < 0) {
          TR3 = 0;
          TX3 = random(width/4) *4;
        }
      }
    }
  }
  void hit() {

    if (dist(TX, TY, mouseX-6, mouseY-4) <= TR / 2 || dist(TX, TY, mouseX+6, mouseY-4) <= TR /2 || dist(TX, TY, mouseX, mouseY+10) <= TR /2) {  
      if (cursor.HP < 20) {
        cursor.HP += 1;
        HPrec = millis();
        music.simple("CURE.mp3");
      }
    }
    if (millis() - muteki > 200) {

      if (dist(TX1, TY1, mouseX-6, mouseY-4) <= TR1 / 2 || dist(TX1, TY1, mouseX+6, mouseY-4) <= TR1 /2 || dist(TX1, TY1, mouseX, mouseY+10) <= TR1 /2) {  
        cursor.HP -= 1;
        muteki = millis();
        music.simple("DAMAGE4.mp3");
      }
      if (dist(TX2, TY2, mouseX-6, mouseY-4) <= TR2 / 2 || dist(TX2, TY2, mouseX+6, mouseY-4) <= TR2 /2 || dist(TX2, TY2, mouseX, mouseY+10) <= TR2 /2) { 
         cursor.HP -= 1;
        muteki = millis();
        music.simple("DAMAGE4.mp3");      
      }
      if (dist(TX3, TY3, mouseX-6, mouseY-4) <= TR3 / 2 || dist(TX3, TY3, mouseX+6, mouseY-4) <= TR3 /2 || dist(TX3, TY3, mouseX, mouseY+10) <= TR3 /2) {
        cursor.HP -= 1;
        muteki = millis();
        music.simple("DAMAGE4.mp3");
      }
    }
  }
}
