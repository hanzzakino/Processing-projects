

class Block{
  
  float x=width;
  float y=random(0, height);
  float size=50;
  float vx=15;
  
  void move(){
    x-=vx;
  }
  
  void show(){
    fill(255);
    rectMode(CENTER);
    rect(x,y,size,size);
  }
  
  
}