
class Object{
  
  float angleDir=0;
  float size=25;
  
  float initAcc=10;
  
  PVector loc;
  PVector vel;
  PVector acc;
  PVector gravity;
  
  Object(float xx, float yy){
    loc = new PVector(xx,yy);
    vel= new PVector(0,0);
    gravity=new PVector(0,0);
  }
  
  void move(){
    
    acc= new PVector(initAcc*sin(angleDir),initAcc*cos(angleDir));
    vel.limit(30);
    vel.add(gravity);
    vel.add(acc);
    loc.add(vel);
    
  }
  
  void checkBounds(){
    if(loc.x-size<=0){
      vel.x=-vel.x;
      loc.x=size;
    }if(loc.y-size<=0){
      vel.y=-vel.y;
      loc.y=size;
    }if(loc.x+size>=width){
      vel.x=-vel.x;
      loc.x=width-size;
    }if(loc.y+size>=height){
      vel.y=-vel.y;
      loc.y=height-size;
    }
  }
  
  void show(){
    
    fill(255);
    stroke(255);
    checkBounds();
    strokeWeight(0);
    ellipse(loc.x,loc.y,size*2, size*2);
    strokeWeight(25);
    
    line(loc.x,loc.y,loc.x+30*sin(angleDir-PI),loc.y+30*cos(angleDir-PI));
    
  }
  
  
  
  
}