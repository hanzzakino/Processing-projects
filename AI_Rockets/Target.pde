

class Target{
  
  float x, y;
  float size=200;
  float midx, midy;
  
  Target(float xx, float yy){
    x=xx;
    y=yy;
    midx=x+(size/2);
    midy=y+(size/2);
  }
  
  void show(){
    fill(255);
    stroke(255);
    rect(x,y,size,size);
  }
  
}