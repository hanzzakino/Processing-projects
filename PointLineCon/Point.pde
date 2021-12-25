
class Point {
  
  float x,y;
  float size=10;
  int total;
  Point[] other;
  
  int nLines=0;
  
  Point(float xx, float yy, Point[] o, int n){
    x=xx;
    y=yy;
    other=o;
    total=n;
  }
  void pos(float nx, float ny){
    x=nx;
    y=ny;
  }
  void con(){
    stroke(255,255,255);
    for(int i=0; i<total; i++){
      line(x,y,other[i].x,other[i].y);
      nLines++;
    }
  }
  
  void show (){
    ellipse(x,y,size,size);
  }
  
  
}