

class SpaceObject{
  
  float mass;
  float rad;
  
  //float att_direction;
  //float att_dist;
  
  final float G = 6.6743*(pow(10,-16));
  
  PVector loc;
  PVector vel;
  PVector acc;
  
  SpaceObject(float xx, float yy, float m, float r, float initV, float initDir){
    xx = _scale(xx);
    yy = _scale(yy);
    mass=_scale(m);
    rad=_scale(r);
    initV=_scale(initV);
    loc=new PVector(xx,yy);
    if(initV!=0){
      vel = new PVector(initV*sin(initDir),initV*cos(initDir));
    } else{
      vel = new PVector(0,0);
    }
    acc = new PVector(0,0);
  }
  
  void update(){
    vel.add(acc);
    loc.add(vel);
  }
  
  void applyForce(SpaceObject other){
    float dist = loc.dist(other.loc);
    //att_dist=dist;
    float dy = other.loc.y-loc.y;
    float dx = other.loc.x-loc.x;
    float angle = atan2(dx,dy);  
    //att_direction=angle;
    float F = (G*mass*other.mass)/(dist*dist); 
    float a=_scale(F/mass);
    acc.mult(0);
    acc.add(new PVector(a*sin(angle),a*cos(angle)));
  }
  void applyForce(ArrayList<SpaceObject> objects, int thisIndx){
    float a = 0, dist, dy, dx, angle, F;
    acc.mult(0);
    for(int i = 0; i < objects.size(); i++){
      if(i == thisIndx) continue;
      dist = loc.dist(objects.get(i).loc);
      dy = objects.get(i).loc.y-loc.y;
      dx = objects.get(i).loc.x-loc.x;
      angle = atan2(dx,dy); 
      F = (G*mass*objects.get(i).mass)/(dist*dist);
      a = _scale(F/mass);
      acc.add(new PVector(a*sin(angle),a*cos(angle)));
    }
  }
  
  void show(){
    fill(255);
    stroke(255);
    strokeWeight(1);
    ellipse(loc.x,loc.y,rad*2,rad*2);
  }
  
  //void showMetrics(){
  //  line(loc.x, loc.y, loc.x+(55*sin(att_direction)), loc.y+(55*cos(att_direction)));
  //  textSize(25);
  //  text(OrigVal(vel.mag())
  //  +"\n"+OrigVal(acc.mag())+"\n"+OrigVal(att_dist),loc.x-100,loc.y-100);
  //}
  
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
  
  
  
  float OrigVal(float sc){
    return sc*(pow(10,5));
  }
  
  float _scale(float original){
    return original*(pow(10,-5));
  }
  
}
