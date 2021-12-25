
class Dot{
  
  float x =width/3.2;
  float y =height/2;
  float rad = 50;
  float dia=rad*2;
  
  float jumpv=0.875;
  float jumps=80;
  float vy=-100;
  float gravity=12;
  
 
  void move(){
    vy+=gravity;
    y+=vy;
    
    if(y+rad>height){
      vy=0;
      y=height-rad;
    }
    if(y<rad){
      vy=0;
      y=rad;
    }
   
  }
  
  void jump(){
    vy-=(abs(vy*jumpv)+jumps);
  }
  
  void show(){
    fill(230,230,55);
    
    ellipse(x,y,dia, dia);
  }
  
}