
class Obstacle{
  
  float x1,y1,x2,y2;
  
  Obstacle(float X1, float Y1, float X2, float Y2){
    x1=X1;
    y1=Y1;
    x2=X2;
    y2=Y2;
  }
  
  void show(){
    fill(255);
    stroke(255); 
  //  rect(x1,y1,(x2-x1),(y2-y1)); 
    quad(x1,y1,x2,y1,x2,y2,x1,y2);
  }
  
}