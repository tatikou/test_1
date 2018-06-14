class Music{
  void simple(String music_name){
    player = minim.loadFile(music_name);
    player.play();
  }
  
  void loop_m(String music_name){
    player = minim.loadFile(music_name);
    player.play();
    player.loop();
  }
  
  void end(){
    player.close();
    minim.stop();
  }
}
