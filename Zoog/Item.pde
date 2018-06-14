class Item{
  int flag = 0;
  void check_flag(){
    if (mouseX >= 520 && mouseX <= 640 && mouseY >= 560 && mouseY <= 620) {
        flag = 1;
        fight.flag = 0;
        act.flag = 0;
        mercy.flag = 0;
    }
  }
}
