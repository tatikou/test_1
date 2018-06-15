Tama tama;
ArrayList danmaku;
import ddf.minim.*;
Minim minim;
Music music;
AudioPlayer player;
Cursor cursor;
Setting setting;
End end;
Enemy enemy1,enemy2,enemy3;
Fight fight;
Act act;
Mercy mercy;
Item item;
boolean waiting = true;
int scared = 0;

int f10 = 1, f11 = 1, f12 = 1, f13 = 1;
float f5 = 0;
int vx = 1;
float sp = 1, n = 1;
float deg = 0.0;
float HPrec = 0;
int i;
int timeLimit = 300;
int turn = 1;
int muteki;
int tcomment1 = -2500, tcomment2 = -2000, tcomment3 = -4000;
int tcomment4 = -3500, tcomment5 = -7000;
int flatter = 0;


void setup() {
  size(1000, 700); 
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  minim = new Minim(this);
  music = new Music();
  setting = new Setting();
  end = new End();
  enemy1 = new Enemy(100,100,12,0);
  enemy2 = new Enemy(100,100,8,1);
  enemy3 = new Enemy(100,100,10,2);
  fight = new Fight();
  act = new Act();
  item = new Item();
  mercy = new Mercy();
  cursor = new Cursor();
  
  cursor.no_Cursor();
  
  music.simple("STARTBATTLE.mp3");
  music.loop_m("Undertale.mp3");
  i = -7000;
  
  danmaku = new ArrayList();
  for (int di = 0; di < 7; di++) {
    danmaku.add (new Tama(
      random(width), random(height), 10, 
      random(width), random(height), 30, 
      random(width), random(height), 5, 
      random(width), random(height), 20
      ));
  }
  tama = new Tama(300, 0, 10, 280, 0, 30, 500, 0, 5, 50, 0, 20);
}

void draw() {
  background(0);
  cursor.soul();
  if(check_setting_mode(i) == true){
    setting.Timelimit();
    setting.Textbox();
    setting.Status_first(cursor.HP,setting.damage);
    
    for(int j = 0; j < 4; j++){
      setting.touch_music(j,mercy.flag);
    }
    
    fill(#EB7413);
    textSize(30);
    text("FIGHT", 220, 600);
    text("ACT", 390, 600);
    text("ITEM", 545, 600);
    text("MERCY", 690, 600);
    
    //reset the place
    enemy1.state_reset();
    enemy2.state_reset();
    enemy3.state_reset();
  }

  fill(0);
  stroke(0);
  
  if (timeLimit <= 0 || cursor.HP <= 0) {
    end.Game_over();
    music.end();
    music.simple("GAMEOVER.mp3");
    super.stop();
   }
 

  if (check_setting_mode(i) == false) {
    if (act.threat > 0) {
      enemy1.thread_move();
      enemy2.thread_move();
      enemy3.thread_move();
      setting.Status_second(cursor.HP,setting.damage);
    } else {
      tama.hit();
      setting.Status_second(cursor.HP,setting.damage);

      if (turn > 2) {
        tama.update();
        for (int di = danmaku.size() -1; di  >= 0; di--) {
          Tama t = (Tama)danmaku.get(di);
          t.hit();
          t.update();
        }
      } else if (turn == 2) {
        tama.update();
      }
      sp = setting.Speed_change(setting.zoognum);

      enemy1.move1(turn,vx);
      enemy2.move2(sp);
      enemy3.move3(vx);
    }
  }

  //Draw Zoog's body
  enemy1.display(flatter);
  enemy2.display(flatter);
  enemy3.display(flatter);
  
  enemy1.check_eye();
  enemy2.check_eye();
  enemy3.check_eye();
  
  
  setting.check_zoog_num();


  if (enemy1.zHP <= 0 && enemy2.zHP <= 0 && enemy3.zHP <= 0) {
    end.Win();
    music.end();
    super.stop();
    music.simple("WIN.mp3");
  }

  enemy1.damage_calc1();
  enemy2.damage_calc2();
  enemy3.damage_calc3();
  cursor.self_HP_calc();
  
  if (millis() - i > 7000) {
    if(fight.flag == 1) {
      fight.red_range(enemy1);
      fight.red_range(enemy2);
      fight.red_range(enemy3);
    } else if (act.flag == 1) {
      act.choice_music();
    } else if (item.flag == 3) {
    } else if (mercy.flag == 1 && mercy.select == 1) {
      end.Mercy();
      music.end();
      super.stop();
      music.simple("WIN.mp3");
    }
    if (act.command[0] == 1) {
      fill(255);
      if (millis() - tcomment3 < 3500) {
        act.check();
        return;
      }
      if(f10 ==1){
        turn = turn + 1;
        i = millis();
        f10 = 0;
        act.flag = 0;
      }
    } else if (act.command[1] == 1) {
      act.threat();
      if (waiting && (millis() - tcomment2)<= 5500) {
        cursor.soul();
        return;
      }
      if(f11 == 1){
        turn = turn + 1;
        i = millis();
        scared = 1;
        act.threat += 1;
        act.command[1] = 0;
        f11 = 0;
        act.flag = 0;
      }
    } else if (act.command[2] == 1) {
      fill(255);
      if (millis() - tcomment3 < 3500) {
        text(" What a cute eyes you have!", 260, 370);
      }

      if  ((millis() - tcomment3)>= 3500 && millis() - tcomment4 < 7500 ) {
        text("* Zoogs sre flattered ", 260, 370);
      }

      if (waiting && (millis() - tcomment4)< 8500 ) {
        cursor.soul();
        return;
      }
      waiting = false;
      //not enter waiting if

      if (f12 == 1) {
        turn = turn + 1;
        f12 = 0;
        i = millis();
        scared = 0;
        flatter = 1;
      }
    } else if (act.command[3] == 1) {
    }
  }
  cursor.soul();
}

//---------------------------------------------------------------mouseClicked
void mouseClicked() {
  
  if (millis() - i >= 7000) {
    if ((mouseX >= 200 && mouseX <= 320 && mouseY >= 560 && mouseY <= 620) 
      ||(mouseX >= 360 && mouseX <= 480 && mouseY >= 560 && mouseY <= 620)
      ||(mouseX >= 520 && mouseX <= 640 && mouseY >= 560 && mouseY <= 620)
      ||(mouseX >= 680 && mouseX <= 820 && mouseY >= 560 && mouseY <= 620)) {
      player = minim.loadFile("decide.mp3");
      player.play();

      fight.check_flag();
      act.check_flag();
      item.check_flag();
      mercy.check_flag();
    }
    //I want response from choice in ACT when I clicked

    if (fight.flag == 1) {
      if(fight.range(enemy1) == true || fight.range(enemy2) == true || fight.range(enemy3) == true){
        turn = turn + 1;
        act.threat = 0;
        i = millis();
        fight.flag = 0;
      }
    }
    
    
    if (act.flag == 1) {
      if (mouseX >= 255 && mouseX <= 385 && mouseY <= 380 && mouseY >= 340) {
        act.command[0] = 1;
        music.simple("decide.mp3");
        f10 = 1;
        tcomment3 = millis();
        waiting = true;
        act.threat = 0;
      } else if (mouseX >= 255 && mouseX <= 385 && mouseY <= 440 && mouseY >= 400) {
        act.command[1] = 1;
        music.simple("decide.mp3");
        f11 = 1;
        tcomment2 = millis();
        waiting = true;
      } else if (mouseX >= 495 && mouseX <= 625 && mouseY <= 380 && mouseY >= 340) {
        act.command[2] = 1; 
        music.simple("decide.mp3");
        tcomment3 = millis();
        tcomment4 = millis();
        f12 = 1;
        waiting = true;
      } else if (mouseX >= 495 && mouseX <= 625 && mouseY <= 440 && mouseY >= 400) {
        act.command[3] = 1;
        music.simple("decide.mp3");
      }
    }
  }else{
    enemy1.hit();
    enemy2.hit();
    enemy3.hit();
  }
}

boolean check_setting_mode(int i){
  if(millis() - i >= 7000){
    return true;
  }else{
    return false;
  }
}
