

class Obstacle{
  
  float x1,y1,x2,y2;
  float size=50;
  
  Obstacle(float xx1, float yy1, float xx2, float yy2){
    x1=xx1;
    y1=yy1;
    x2=xx2;
    y2=yy2;
  }
  
  void show(){
    fill(255);
    stroke(255);
    strokeWeight(1);
    line(x1,y1-size, x2, y2-size);
    line(x1,y1,x2,y2);
  }
  
  
}