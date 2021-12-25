

class Target{
  
  float x, y;
  float size=200;
  float midx, midy;
  
  Target(float xx, float yy){
    x=xx;
    y=yy;
    midx=x;
    midy=y;
  }
  
  void show(){
    fill(255);
    stroke(255);
    ellipse(x,y,size,size);
  }
  
}