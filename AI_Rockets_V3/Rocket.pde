
class Rocket{
  
  PVector loc;
  PVector vel;
  PVector acc;
  PVector gravity;
  
  //// change or inherit from parents every new gene
  ManueverSet manueverSet;
  
  ////// reset every new generation
  float dirAngle;
  float newDir;
  float distToTarget;
  boolean isAlive;
  float nearestDistToTarget;
  float timeOfDeath;
  boolean crashed;
 
  float universalTime;
  int currentManuever;
  boolean reachedTarget;
  
  //Constants
  float speedConst=10;
  float rocketLen=50;
  float g=2;
  float steerTime = 0.03;  //default 0.015
  
  float ix,iy;
  float initDist;
  float initDir;
  
  Manuever initial;
  Rocket(float xx,float yy){
    ix=xx; iy=yy;
    loc=new PVector(ix,iy);
    vel=new PVector(0,0);
    acc=new PVector(0,0);
    gravity=new PVector(0,g);
    reachedTarget = false;
    initDir=random(rad(90),rad(270));
    initial = new Manuever(0,initDir);
    dirAngle=initDir;
    newDir=dirAngle;
    isAlive=true;
    crashed=false;
    currentManuever =0;
    //Initial Manuever
    manueverSet= new ManueverSet(initial);
  }
  
  void reset(){
    loc=new PVector(ix,iy);
    vel.mult(0);
    dirAngle=manueverSet.manuever.get(0).direction;
    newDir=dirAngle;
    timeOfDeath=0;
    currentManuever=0;
    crashed=false;
    isAlive=true;
 }
  
  void setManueverSet(ManueverSet s){
    manueverSet.replaceSet(s.manuever);
    initDir = s.manuever.get(0).direction;
  }
 
 int evol=0;
  ///Trial Function
  void evolve(){
    //minimum manuever time is 45
    float manvTime = floor(random(timeOfDeath*0.4, timeOfDeath*0.5));
    if(!reachedTarget)manueverSet.addManuever(new Manuever(manvTime, random(rad(90),rad(270))));
    evol++;
  }
  
  
  
  void changeDir(){
    if(dirAngle!=newDir){
    if(dirAngle>newDir) dirAngle-=steerTime;
    if(dirAngle<newDir) dirAngle+=steerTime;
    }
  }
  void setTimeOfDeath(float t){
    if(timeOfDeath==0){
      timeOfDeath=t;
    }
  }
  
  
  void move(float t, Target tg, ArrayList<Obstacle> ob){
    universalTime = t;
    for(int i=0; i<ob.size(); i++){
      if(hitObs(ob.get(i))) {
      crashed = true;
      kill(); setTimeOfDeath(t);
      }
    }
    if(isAlive){
      for(int i=0; i<manueverSet.manuever.size();i++){
      if(manueverSet.manuever.get(i).timeStamp==t){
        
        currentManuever=i;
        newDir=manueverSet.manuever.get(i).getDirection();
          }
       }
    
    distToTarget = loc.dist(tg.loc);
    if(t==0){
      nearestDistToTarget = distToTarget;
      initDist =distToTarget;
      }
    if(distToTarget<nearestDistToTarget){
      nearestDistToTarget = distToTarget;
    }
    
    if(inTarget(tg)){
      reachedTarget=true;
      kill();
    }
    changeDir();
    
    vel=new PVector(speedConst*sin(dirAngle),speedConst*cos(dirAngle));
    loc.add(vel);
    }
  }
  
  //for distinction
  int rocketNum;
  void setRocketNum(int num){
    rocketNum=num;
  }
  
  void showInfo(){
    stroke(255);
    strokeWeight(1);
    fill(0,255,0);
    textSize(20);
    if(isAlive){
      text("t-"+universalTime+"\n"+currentManuever+"\n"+
      manueverSet.geneFitness+"\n"+nearestDistToTarget+"\n"+evol
      +"\n"+manueverSet.manuever.size(), loc.x, loc.y);
    }else{
      text("t-"+timeOfDeath+"\n"+currentManuever+"\n"+
      manueverSet.geneFitness+"\n"+nearestDistToTarget+"\n"+evol
      +"\n"+manueverSet.manuever.size(), loc.x, loc.y);
    }
  }
  
  
  void show(){
    
    showTrail();
    
    
    fill(255);
    stroke(255,200);
    strokeWeight(rocketLen/5);
    
    line(loc.x,loc.y,loc.x+rocketLen*sin(dirAngle-PI),loc.y+rocketLen*cos(dirAngle-PI));
    
    if(reachedTarget){
      fill(0,255,0,200);
    } else if(crashed){
      fill(255,0,0,200);
    } else {
      fill(215,0,200,200);
    }
    noStroke();
    ellipse(loc.x,loc.y,8,8);
    
  //  showInfo();
    
  }
  
  
  
  
  
  ArrayList<Point> p=new ArrayList<Point>();
    
  void showTrail(){
    stroke(210,120,10,150);
    strokeWeight(1);
    if(p.size()>15) p.remove(0);
    p.add(new Point(loc.x+rocketLen*sin(dirAngle-PI),loc.y+rocketLen*cos(dirAngle-PI)));
    for(int i=0;i<p.size();i++){
      if(i>0){
        strokeWeight(map(i,0,p.size(),0,17));
        line(p.get(i).x,p.get(i).y,p.get(i-1).x,p.get(i-1).y);
      }
    }
  }
  
  void kill(){
  //  if(!reachedTarget&&manueverSet.manuever.size()>0)manueverSet.manuever.remove(manueverSet.manuever.size()-1);
    isAlive=false;
  }
  
  boolean hitObs(Obstacle o){
    boolean temp=false;
    if(loc.x>o.x1 && loc.x<o.x2){
       if(loc.y>o.y1 && loc.y<o.y2){
         temp = true;
       }
    } else{
         temp = false;
    }
    return temp;
  }
  
  boolean inTarget(Target target){
    return (loc.dist(target.loc)<=target.rad);
  }
  
  float rad(float r){
    return r*(PI/180);
  }
  
}