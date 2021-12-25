
class Object{
  
  float x;
  float y;
  float vx;
  float vy;
  float gravity = 9.81;
  float rad=random(20,50);
  float dia = rad*2;
  boolean hitBound = false;
  float bounce = 1.2;
  float air = 0.984;
  
  
  Object other[];
  int objC;
  int groundHit=0;
  
  Object(float xx, float yy, float xv, float yv, Object[] o, int objc){
    vx=xv;
    vy=yv;
    x=xx;
    y=yy;
    other=o;
    objC=objc;
  }
  
  void move(float vxx, float vyy){
   // vx=0; vy=0;
    vx+=vxx;
    vy+=vyy;
  }
  
  void jump(){
      vy-=159;
  }
  
  void collide(int ths){
    
   for(int j=0; j<objC; j++){
     if(j==ths) continue;
    float dx = other[j].x - x;
      float dy = other[j].y - y;
      float distance = sqrt(dx*dx + dy*dy);
      float minDist = other[j].dia/2 + dia/2;
      if (distance < minDist) { 
        float angle = atan2(dy, dx);
       // float A=atan((dy-y)/(dx-x));
        float targetX = x + cos(angle) * minDist;
        float targetY = y + sin(angle) * minDist;
        float ax = (targetX - other[j].x) * bounce;
        float ay = (targetY - other[j].y) * bounce;
        vx -= ax;
        vy -= ay;
        other[j].vx += ax;
        other[j].vy += ay;
      }
   }
   
  }
  
  
  void onMotion(){
    vx*=air;
    vy*=air;
    x+=vx;
    vy+=gravity;
    y+=vy;
    
  
  }
 void onBounce(){
   if(x-rad<0){ 
      x=rad;
      vx=-vx/bounce;
    }
    if(x+rad>width){ 
      x=width-rad;
      vx=-vx/bounce;
    }
    if(y-rad<0){
       y=rad;
       vy=-vy/bounce;
    }
    if(y+rad>height){
       groundHit--;
       y=height-rad;
       vy=-vy/bounce;
    }
 }
  
 void show(){
   fill(255,255,255);
   ellipse(x,y,dia,dia);
 }
  
  
}