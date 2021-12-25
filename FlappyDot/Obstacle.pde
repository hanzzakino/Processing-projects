

class Obstacle {

  float opensize;
  float mainLen;
  float w = 60;
  float x=(w*2)+width;
  float vx=-10;
  float lvl;
  float R=50;
  float G=50;
  float B=155;
  
  Obstacle(float sc){
     lvl= 0.36-(sc*0.003);
     if(lvl<0.20) lvl = 0.2;
     opensize = height*lvl;
     mainLen = random (opensize+100, height-100);
  }
  
  void move(){
    x+=vx;
    
  }
  
  
  void hit(){
    
    R = 255;
    G = 0;
    B = 0;
    
  }
  
  void show(){
    fill(R,G,B);
    rect(x,0,w,mainLen-opensize);
    rect(x, height, w, -(height-mainLen));
  }



}