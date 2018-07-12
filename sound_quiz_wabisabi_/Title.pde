class Title{
  void display(){
    fill(0,50,200);
    rect(width/2,height/2,300,100);
    fill(255);
    textSize(50);
    text("Start",width/2-60,height/2+20);
    fill(0,200,0);
    rect(width/2,height/4*3,200,100);
    fill(255);
    textSize(30);
    text("Collection",width/2-70,height/4*3+10);
 }
  
 int click_check(){
    if(mouseX <= width/2 + 150 && mouseX >=  width/2 - 150 && mouseY <= height/2 + 50 && mouseY >= height/2 - 50){
      return 1;
    }else if(mouseX <= width/2 + 100 && mouseX >= width/2 - 100 && mouseY <= height/4*3 + 50 && mouseY >= height/4*3 - 50){
      return 2;
    }else{
      return 0;
    }
  }
}
