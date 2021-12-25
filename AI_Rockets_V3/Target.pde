
class Target{
  
  PVector loc;
  float rad;
  
  Target(float xx, float yy, float rr){
    loc = new PVector(xx,yy);
    rad=rr;
  }
  
  void show(){
    fill(255,255,0);
    stroke(255);
    strokeWeight(1);
    ellipse(loc.x,loc.y,rad*2,rad*2);
  }
}