
class Ball {

  float x,y,vx,vy,rad, bn;
  float dia;
  
  float bounce=1, bounceW=1;
  float gravity=0;
  int lineN=0;
  
  Ball[] other; int objC;
  
  Ball(float r, float xx, float yy, float vxx, float vyy, Ball[] o, int objc, int ballN){
    x=xx;
    y=yy;
    rad=r;
    dia=r+r;
    vx=vxx;
    vy=vyy;
    other=o;
    objC=objc;
    bn=ballN;
  }
  void conLine(){
    stroke(255,255,255);
    strokeWeight(1);
    for(int i=0; i<objC; i++){
      lineN++;
      line(x,y, other[i].x, other[i].y);
    }
  }
  
  void collide (int ths){
    
   for(int j=0; j<objC; j++){
     if(j==ths) continue;
    float dx = other[j].x - x;
      float dy = other[j].y - y;
      float distance = sqrt(dx*dx + dy*dy);
      float minDist = other[j].dia/2 + dia/2;
      if (distance < minDist) { 
        float angle = atan2(dy, dx);
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
  
  void move(){
    vy+=gravity;
    x+=vx;
    y+=vy;
    
    if(x>=width-rad){
      x=width-rad;
      vx=-vx*bounceW;
    }
    if(x<=rad){
      x=rad;
      vx=-vx*bounceW;
    }
    if(y>=height-rad){
      y=height-rad;
      vy=-vy*bounceW;
    }
    if(y<=rad){
      y=rad;
      vy=-vy*bounceW;
    }
  }
  
  void show(){
    float direction = sqrt(vx*vx+vy*vy);
    fill(255,255,255);
    strokeWeight(1);
    ellipse(x,y,rad*2,rad*2);
    textSize(30);
    fill(0,2,255);
    textAlign(CENTER);
      //  text((int)bn+"\n"+x+"\n"+y+"\n"+direction,x,y-45);
    
  }
  
}