

class Rocket{
  
  PVector loc;
  
  //Physics
  PVector vel;
  PVector acc;
  float gravity=0;
  float magnitude=10;//global speed
  
  //life of the rocket
  boolean dead;
  
  //the genes of the rocket (Control set)
  ArrayList<Manuever> thisManv = new ArrayList<Manuever>();
  int thisManvCnt;
  
  //initialize
  Rocket(float xx, float yy){
     loc = new PVector(xx,yy);
     vel = new PVector(0,0);
     acc = new PVector(0,0);
     dead=false;
     geneProbability=0;
  }
  
  //reset the rocket position and Physics
  void reset(float xx,float yy){
     loc = new PVector(xx,yy);
     vel = new PVector(0,0);
     acc = new PVector(0,0);
     dead=false;
     
  }
  
  float geneProbability;
  void resetManuevers(){
    thisManv.clear();
    thisManvCnt=0;
  }

  //add new gene 
  void addManv(Manuever mv){
    thisManv.add(mv);
    thisManvCnt++;
  }
  
  //check bounds
  boolean hit(Obstacle o){
    if(loc.x<0){
      return true;
    } else if(loc.x>width){
      return true;
    } else if(loc.y<0){
      return true;
    } else if(loc.y>height){
      return true;
    } else if(loc.y<o.y1&&loc.y>o.y1-o.size){
       if(loc.x>o.x1&&loc.x<o.x2){
         return true;
       }
    } 
      return false;
    
  }
 
  
  //move
  void update(){
    vel.y+=gravity;
    vel.add(acc);
    loc.add(vel);
  }
  float d=PI;
  
  //control
  void thrust(float dir){
    vel.mult(0);
    vel.add(magnitude*sin(dir),magnitude*cos(dir));
    d=dir;
  }
  
  
  float getNearest(ArrayList<Rocket> rk, int num){
    return 0;
  }
  
  //Manuever
  void Manuevers(float t){
    for(int i=0; i<thisManvCnt; i++){
      if(t==thisManv.get(i).timeStamp){
        thrust(thisManv.get(i).direction);
      }
    }
  }
  
 float dTarget;
 
 //calculate distance to target
 float distToTarget(Target t){
   return sqrt((loc.x-t.midx)*(loc.x-t.midx)+(loc.y-t.midy)*(loc.y-t.midy));
 }
 
 float timeOfDeath;
 //kills the rocket
 void kill(float t,Target tt){
   dTarget=distToTarget(tt);
   timeOfDeath=t;
   dead=true;
 }
  
  //display
  void show(){
    fill(255);
    stroke(255,150);
    strokeWeight(10);
    //ellipse(loc.x,loc.y,10,10);
    line(loc.x,loc.y,loc.x-50*sin(d),loc.y-50*cos(d));
  }
  
  
}