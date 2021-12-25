
class Barrier{
  
  float x1,y1,x2,y2;
  
 
  
  Barrier(float xx1, float yy1, float xx2, float yy2){
    x1=xx1;
    y1=yy1;
    x2=xx2;
    y2=yy2;
  }
  
  void show(){
    
    stroke(0);
    strokeWeight(5);
    
    line(x1,y1,x2,y2);
   
    
    
  }
  
  
  
  
  
}