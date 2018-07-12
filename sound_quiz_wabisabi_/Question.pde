class Question {
  String[] s_url;
  String[] name  = {"鼠", "牛", "虎", "卯", "竜", "ヘビ", "馬", "羊", "猿", "鳥", "犬", "猪"};
  String[] sound = {"mouse.mp3", "cow.mp3", "tiger.mp3", "rabbit.mp3", "doragon.mp3", "snake.mp3", "horse.mp3", "sheep.mp3", "monkey.mp3", "bird.mp3", "dog.mp3", "boar.mp3"};
  String[] q_url =  {"mouse.jpg", "cow.JPG", "tiger.jpg", "rabbit.jpg", "doragon.jpg", "snake.jpg", "horse.jpg", "sheep.jpg", "monkey.jpg", "bird.jpg", "dog.jpg", "boar.jpg"};
  int q_cnt;
  int q_state = 0;
  PImage s_logo;
  PImage[] q_img = new PImage[60];
  boolean ans;
  int choice;
  int collect;
  int[] make_q = new int[4];
  int ans_num;

  Question() {
    q_state = 0;
    q_cnt = 1;
    s_logo =loadImage("sound_logo.png");
    collect = 0;
    make_question();
  }

  void display() {
    if (q_state == 0) {
      fill(0);
      textSize(30);
      text(q_cnt+"/10", 610, 30);
      image(s_logo, width/2, height/5, 200, 200);
      for (int i = 0; i < 4; i++) {
        q_img[i] = loadImage(q_url[make_q[i]], "jpg");
        image(q_img[i], width/5*(i+1), height*2/3, 100, 100);
      }
    } else if (q_state == 1) {
      fill(0);
      textSize(30);
      text(q_cnt+"/10", 610, 30);
      image(s_logo, width/2, height/5, 200, 200);
      for (int i = 0; i < 4; i++) {
        q_img[i] = loadImage(q_url[make_q[i]], "jpg");
        image(q_img[i], width/5*(i+1), height*2/3, 100, 100);
      }
      if (ans == true) {
        stroke(255, 0, 0);
        strokeWeight(10);
        noFill();
        ellipse(width/5*(ans_num+1), height*2/3, 100, 100);
        fill(0, 255, 0);
        noStroke();
        rect(width/2, height*5/6, 140, 80);
        fill(255);
        text("Next", width/2-35, height*5/6+10);
      } else {
        stroke(255, 0, 0);
        strokeWeight(10);
        noFill();
        ellipse(width/5*(ans_num+1), height*2/3, 100, 100);
        stroke(0, 0, 255);
        line(width/5*(choice+1)-50, height*2/3-50, width/5*(choice+1)+50, height*2/3+50);
        line(width/5*(choice+1)+50, height*2/3-50, width/5*(choice+1)-50, height*2/3+50);
        fill(0, 255, 0);
        noStroke();
        rect(width/2, height*5/6, 140, 80);
        fill(255);
        text("Next", width/2-35, height*5/6+10);
      }
    } else if (q_state == 2) {
      fill(0);
      text("result:"+collect+"/10", width/2-100, height/2);
      fill(0, 255, 0);
      noStroke();
      rect(width/2, height*4/5, 200, 120);
      fill(255);
      text("Back home", width/2 - 80, height*4/5+10);
    }
  }

  void make_question() {
    make_q[0] = (int)random(12);
    for (int i = 1; i < 4; i++) {
      int j, k;
      while (true) {
        j = (int)random(12);
        for (k=0; k < i; k++) {
          if (j == make_q[k]) {
            break;
          }
        }
        if (k == i) {
          break;
        }
      }
      make_q[i] = j;
    }
    ans_num = (int)random(4);
  }


  void check_ans() {
    for (int i = 0; i < 4; i++) {
      if (q_state == 0 && mouseX >= width/5*(i+1) - 50   && mouseX <= width/5*(i+1) + 50 && mouseY >= height*2/3 - 50 && mouseY <= height*2/3 + 50) {
        q_state = 1;
        choice = i;
        if (choice == ans_num) {
          ans = true;
          collect++;
        } else {
          ans = false;
        }
      }
    }
  }

  void next_question() {
    if (q_state == 1 && mouseX >= width/2 - 70 && mouseX <= width/2 + 70 && mouseY >= height*5/6 - 40 && mouseY <= height*5/6 + 40) {
      q_cnt++;
      q_state = 0;
      make_question();
    }
  }

  void move_result() {
    if (q_cnt == 11) {
      q_state = 2;
    }
  }
  
  void check_sound(){
    if((q_state == 0 || q_state == 1) && mouseX >= width/2 -100 && mouseX <= width/2 +100 && mouseY >= height/5 - 100 && mouseY <= height/5 + 100){
      player = minim.loadFile(sound[make_q[ans_num]]);
      player.play();
    }
  }

  int reset_value() {
    if (q_state == 2 && mouseX>= width/2 - 100 && mouseX <= width/2 + 100 && mouseY >= height*4/5 - 60 && mouseY <= height*4/5 + 60) {
      q_state = 0;
      q_cnt = 0;
      collect = 0;
      return 0;
    } else {
      return 1;
    }
  }
}
