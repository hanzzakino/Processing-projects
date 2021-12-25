class Drop{
  float x = width/2;
  float y = 0;
  float ySpeed=0;
  float gravity=9;
  
  
  void fall(){
    ySpeed+=gravity;
    y+=ySpeed;
  } 
  
  void pos(float xa,float yb){
    x=xa;
    y=yb;
  }
  
  void show(){
    fill(220,100,210);
    noStroke();
    rect(x-25,y,50,50);
  }
  
}