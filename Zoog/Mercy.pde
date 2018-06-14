class Mercy{
  int flag = 0;
  int select = 0;
  void check_flag(){
    if(mouseX >= 680 && mouseX <= 820 && mouseY >= 560 && mouseY <= 620){
      flag = 1;
      fight.flag = 0;
      act.flag = 0;
      item.flag = 0;     
    }
  }
  
}
