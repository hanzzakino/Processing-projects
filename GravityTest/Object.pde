class Object{
  
  float x=540;
  float y=-15;
  float size=50;
  float yspeed=0;
  float gravity=9.81;
  float air = 0.95;
  
  void show(float t){
    noStroke();
    //if(x<size/2)x=size/2;
   // if(x+(size/2)>width)x=width-(size/2);
   // if(y<size/2)y=size/2;
   // if(y+(size/2)>height)y=height-(size/2);
    ellipse(x,y-50-t,15,15);
    ellipse(x,y-35-t,size/2,(size/2)+5);
    ellipse(x,y-10-t,size-10,size+10);
    ellipse(x,y-t,size,size);
    ellipseMode(CENTER);
  }
  
  boolean hitG = false;
  void grDr(){ 
    ellipse(width/2, -20-yspeed, 200,150);
    
  }
  void reset(boolean G){
    if(G){
    y=0;
    yspeed=0;
    hitG=false;
    }
  }
  void fall(){
     if(y+(size/2)>=height) hitG=true;
      yspeed+=gravity;
      yspeed*=air;
      y+=yspeed;
  }
  void rise(){
      yspeed-=gravity;
      y-=yspeed;
  }
  
}