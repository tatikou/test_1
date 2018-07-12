int state;
Title title;
Question question;
import ddf.minim.*;
Minim minim;
AudioPlayer player;


void setup(){
  background(255);
  imageMode(CENTER);
  ellipseMode(CENTER);
  rectMode(CENTER);
  size(700,700);
  state = 0;
  title = new Title();
  question = new Question();
  minim = new Minim(this);
}

void draw(){
  background(255);
  if(state == 0){
    title.display();
  }else if(state == 1){
    question.display();
  }else if (state == 2){
    background(150);
  }
}

void mouseClicked(){
  if(state == 0){
    state = title.click_check();
    question.make_question();
  }else if(state == 1){
    state = question.reset_value();
    question.check_ans();
    question.next_question();
    question.move_result();
    question.check_sound();
  }
}
