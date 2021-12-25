



class Block{
  
  float x=width;
  float y=random(0, height);
  float size=50;
  float vx=15;
  float vy;
  float gravity=9.81;
  float R=255;
  float G=255;
  float B=255;
  
  Block(){
    x=width;
    y=random(0, height);
    vx=15;
    gravity=9.81;
    R=255;
    G=255;
    B=255;
  }
  
  Block(float xx, float yy){
    x=xx;
    y=yy;
    vx=15;
    gravity=9.81;
    R=255;
    G=255;
    B=255;
  }
  
  void move(){
    y-=vy;
    x-=vx;
  }
  
  void setColor(float r, float g, float b){
    R=r;
    G=g;
    B=b;
  }
  
  void show(){
    fill(R,G,B);
    ellipseMode(CENTER);
    ellipse(x,y,size,size);
  }
  
  
}

