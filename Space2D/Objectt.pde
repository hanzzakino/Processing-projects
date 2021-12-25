
class Objectt{
  
  float mass;
  float rad;
  
  //constant
  final float G=6.6743*(pow(10,-18));
  
  
  float att_direction;
  
  PVector loc;
  PVector acc;
  PVector vel;
  PVector gravPull;
  
  Objectt(float xx, float yy, float m, float r,float initV, float initDir){
    loc = new PVector(xx,yy);
    mass=m;
    rad=r;
    if(initV!=0){
      vel = new PVector(initV*sin(initDir),initV*cos(initDir));
    } else{
      vel = new PVector(0,0);
    }
    acc = new PVector(0,0);
    
  }
  float dst;
  
  void applyForce(Objectt other){
    float dist = loc.dist(other.loc);
    dst=dist;
    float dy = other.loc.y-loc.y;
    float dx = other.loc.x-loc.x;
    float angle = atan2(dx,dy);  
    att_direction = angle;
    float F = (G*mass*other.mass)/(dist*dist); 
    float a= F/mass;
     acc.mult(0);
    acc.add(new PVector(a*sin(angle),a*cos(angle)));
  }
  
  
  void update(){
    vel.add(acc);
    loc.add(vel);
  }
  
  
  void show(){
    fill(255);
    stroke(255);
    strokeWeight(1);
    
    showTrail();
    
    ellipse(loc.x,loc.y,rad*2,rad*2);
    line(loc.x, loc.y, loc.x+(55*sin(att_direction)), loc.y+(55*cos(att_direction)));
    
    
    textSize(20);
    text((vel.mag()/60)*(pow(10,5))+"\n"+(acc.mag()/(60*60))*(pow(10,5))
    +"\n"+ dst*(pow(10,5)) ,loc.x+20,loc.y-0);
    
    
    
  }
  
  
  ArrayList<Point> p=new ArrayList<Point>();
    
  void showTrail(){
    strokeWeight(1);
    if(p.size()>500) p.remove(0);
    p.add(new Point(loc.x,loc.y));
    for(int i=0;i<p.size();i++){
      if(i>0){
        line(p.get(i).x,p.get(i).y,p.get(i-1).x,p.get(i-1).y);
      }
    }
  }
  
  
  
}