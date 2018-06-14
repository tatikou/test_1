class Enemy{
  float x,y;
  int leftcount,rightcount;
  int zHP;
  int damage;
  int eye_count;
  int zoog_HP_display;
  int i;
  
  Enemy(int x0,int y0,int zHP0,int j){
    x = x0;
    y = y0;
    leftcount = 0;
    rightcount = 0;
    zHP = zHP0;
    eye_count = zHP/2;
    damage = 0;
    zoog_HP_display = 10 * zHP0;
    i = j;
  }
  
  void state_reset(){
    x = 100;
    y = 100;
  }
  
  void display(int flatter){
    if(zHP > 0){
      strokeWeight(1);
      stroke(255);
      fill(200);
      rect(200 * (i+1)+x, 150+y, 20, 100);
    
      //Draw Zoog's head
      fill(#FF0037);
      rect(200 * (i+1)+x, 60+y, zoog_HP_display, 25);
      fill(#00FF41);
      rect(200 * (i+1)+x-damage/2, 60+y, zoog_HP_display-damage, 25);
      fill(255);
      ellipse(200 * (i+1)+x, 150+y-30, 60, 60);
    
      //Draw Zoog's eyes
      fill(0);
      ellipse(x-19+200 * (i+1), y-30+150, 16, 32);
      ellipse(x+19+200 * (i+1), y-30+150, 16, 32);
    
      //Draw Zoog's cheek
      if (flatter == 1) {
        stroke(#FF2600, 90);
        fill(#FF2600, 90);
        ellipse(x-24 + 200 * (i+1), y+135, 17, 8 );
        ellipse(x+24 + 200 * (i+1), y+135, 17, 8 );
      }
    
      //Draw Zoog's legs
      stroke(255);
      line(x-10+200 * (i+1), y + 50+150, x - 20+200 * (i+1), y + 60+150);
      line(x + 10+200 * (i+1), y + 50+150, x + 20+200 * (i+1), y + 60+150);
    }else{
      strokeWeight(1);
      stroke(255,200);
      fill(200,200,200,200);
      rect(200 * (i+1)+x, 150+y, 20, 100);
    
      //Draw Zoog's head
      fill(#FF0037,200);
      rect(200 * (i+1)+x, 60+y, zoog_HP_display, 25);
      fill(#00FF41,200);
      rect(200 * (i+1)+x-damage/2, 60+y, zoog_HP_display-damage, 25);
      fill(255,255,255,200);
      ellipse(200 * (i+1)+x, 150+y-30, 60, 60);
    
      //Draw Zoog's eyes
      fill(0,0,0,200);
      ellipse(x-19+200 * (i+1), y-30+150, 16, 32);
      ellipse(x+19+200 * (i+1), y-30+150, 16, 32);
    
      //Draw Zoog's cheek
      if (flatter == 1) {
        stroke(#FF2600, 90);
        fill(#FF2600, 90);
        ellipse(x-24 + 200 * (i+1), y+135, 17, 8 );
        ellipse(x+24 + 200 * (i+1), y+135, 17, 8 );
      }
    
      //Draw Zoog's legs
      stroke(255,200);
      line(x-10+200 * (i+1), y + 50+150, x - 20+200 * (i+1), y + 60+150);
      line(x + 10+200 * (i+1), y + 50+150, x + 20+200 * (i+1), y + 60+150);
    } 
  }
  
  void move1(int turn,int vx){
    stroke(0);
    fill(0);
    if (zHP > 0) {
      if (turn % 3 == 1) {

        x -= 5+sp;
        y += sp;

        if (millis() - i > 1500) {
          x += 10;
        }
      } else if (turn %3 == 2) {
        y += 2;
        if (millis() - i > 500) {
          x -= 2;
        } else if (millis() - i > 1500) {
          y -= 20;
        } else if (millis() - i > 3000) {
          x += 13;
        }
      } else {
        x += vx+5;
        if (millis() - i > 500) {
          x -= 12;
        } else if (millis() - i > 1500) {
          x = 100;
        } else {
          x += 13;
        }
      }
    }
  }
  
  void move2(float sp){
    if(zHP > 0) {
      y = y + sp;
      x = 100.0*sin(y/20.0)  + 150;
    }
  }
  
  void move3(int vx){
    if (zHP >0) {
        y = 150.0*cos(x/20.0) + 250.0;
        x += vx;
    }
  }
  
  void thread_move(){
    if(i == 0){
      x += 3 * act.threat * cos(act.threat * y+1);
      y += 3 * act.threat * sin(x); 
    }
    if(i == 1){
      x += 3 * act.threat * sin(act.threat * y+1);
      y += 3 * act.threat * cos(x); 
    }
    if(i == 2){
      x += 3 * act.threat * cos(y);
      y += 3 * act.threat * sin(act.threat * x + 1); 
    }
  }
  
  //error have to change zoog HP
  void check_eye(){
    if (leftcount >= eye_count) {
      stroke(255);
      fill(255);
      ellipse(x-19+200*(i+1), y-30+150, 20, 35);
    }
    if (rightcount >= eye_count) {
      stroke(255);
      fill(255);
      ellipse(x+19+200*(i+1), y-30+150, 20, 35);
    } 
    if (leftcount >= eye_count && rightcount >= eye_count) {
      stroke(255);
      fill(255);
      ellipse(x-19+200*(i+1), y-30+150, 20, 35);
      ellipse(x+19+200*(i+1), y-30+150, 20, 35);
    }
  }
  
  void check(){
    
  }
  
  void damage_calc1(){
    switch(zHP) {
    case(11):
    damage = 10;
    break;
    case(10):
    damage = 20;
    break;
    case(9):
    damage = 30;
    break;
    case(8):
    damage = 40;
    break;
    case(7):
    damage = 50;
    break;
    case(6):
    damage = 60;
    break;
    case(5):
    damage = 70;
    break;
    case(4):
    damage = 80;
    break;
    case(3):
    damage = 90;
    break;
    case(2):
    damage = 100;
    break;
    case(1):
    damage = 110;
    break;
    case(0):
    damage = 120;
    break;
    case(-1):
    damage = 120;
    break;
    case(-2):
    damage = 120;
    break;
    default:
    }
  }
  void damage_calc2(){
    switch(zHP) {
    case(7):
    damage = 10;
    break;
    case(6):
    damage = 20;
    break;
    case(5):
    damage = 30;
    break;
    case(4):
    damage = 40;
    break;
    case(3):
    damage = 50;
    break;
    case(2):
    damage = 60;
    break;
    case(1):
    damage = 70;
    break;
    case(0):
    damage = 80;
    break;
    case(-1):
    damage = 80;
    break;
    case(-2):
    damage = 80;
    break;
    default:
    }
  }
  
  void damage_calc3(){
    switch(zHP) {
    case(9):
    damage = 10;
    break;
    case(8):
    damage = 20;
    break;
    case(7):
    damage = 30;
    break;
    case(6):
    damage = 40;
    break;
    case(5):
    damage = 50;
    break;
    case(4):
    damage = 60;
    break;
    case(3):
    damage = 70;
    break;
    case(2):
    damage = 80;
    break;
    case(1):
    damage = 90;
    break;
    case(0):
    damage = 100;
    break;
    case(-1):
    damage = 100;
    break;
    case(-2):
    damage = 100;
    break;
    default:
    }
  }
  
  void hit(){
    if (leftcount < eye_count) { 
      if (pow((x-mouseX-19+200 + (200 * i)),2)/pow(8,2)+pow((y-mouseY-30+150),2)/pow(16,2) <= 1) {
        zHP -= 1;
        leftcount += 1;
        music.simple("DAMAGE.mp3");
      }
    }
    if (rightcount < eye_count) { 
      if (pow((x-mouseX+19+200 + (200 * i)),2)/pow(8,2)+pow((y-mouseY-30+150),2)/pow(16,2) <= 1) {
        zHP -= 1;
        rightcount += 1;
        music.simple("DAMAGE.mp3");
      }
    }
  }
}
