

class Trail{
  float x,y;
  
  
 Trail(float xx, float yy){
   x=xx;
   y=yy;
 }
  
 void addTrail(){
   fill(0);
   ellipse(x,y,1,1);
 }
  
  
}