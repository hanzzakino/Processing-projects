

class Object {
  
  float x=-100;
  float y= random(100, (height-(height/2))-150);
  float vx = random(2,10);
  float size=height*0.08;
  float hitC=0;
  
  void reset (){
    vx = random(2,10);
    hitC=0;
  }
  
  void move(){
    x+=vx;
    
    if(x>=width){
      y=random(100,300);
      x=-100;
      }
  }
  
  void show(){
    ellipse(x,y,size,size);
  }
  
  void hit(){
    hitC++;
    x=-100;
    y= random(100, (height-(height/2))-150);
    vx=random(2+hitC,10+hitC);
  }

}