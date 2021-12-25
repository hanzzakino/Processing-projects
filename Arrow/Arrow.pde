class Arrows{
  
  float x=-100;
  float y=-100;
  float vx;
  float vy;
  float power = 0.3;
  
  float xtail,ytail;
 
  
  boolean released = false;
  
  void shoot(){
    released=true;
  }
  void move(){
   if(released){
    x-=vx;
    y-=vy;
    xtail-=vx;
    ytail-=vy;
    }
   if(x>width||x<0) released = false;
   if(y>height||y<0) released = false;
  }
  void hit(){
    released=false;
    x=-100;
    y=-100;
    xtail=0;
    ytail=0;
  }
  
  void pos(float xx, float yy){
    x=xx;
    y=yy;
  }
  void aim(float x1, float y1, float x2, float y2){
    vx=(x2-x1)*power;
    vy=(y2-y1)*power;
    xtail=x2;
    ytail=y2;
   
  }
  
  void showArrow(){
    strokeWeight(25);
    fill(240,5,5);
    point(x,y);
    strokeWeight(4);
    line(x,y,xtail,ytail);
  }
  
  
}