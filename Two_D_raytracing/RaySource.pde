

class RaySource{
  
  float x1,y1;
  
  
  float A;
  
  float l;
  
   float  x2;
   float  y2;
  float px,py;
  
  RaySource(float xx, float yy, float Aa){
    x1=xx;
    y1=yy;
    A = Aa;
    l=height*2;
    x2= l*sin(A);
    y2= l*cos(A);
  }
  
  void rePos(float X, float Y){
    x1=X;
    y1=Y;
    x2=l*sin(A);
    y2=l*cos(A);
  }
  
  void move(){
    x1+=2;
    y1+=5;
   x2=l*sin(A);
   y2=l*cos(A);
  }
  
  void inter(float X1, float Y1, float X2, float Y2, float X3, float Y3, float X4, float Y4){
    float PX, PY;
    float D = (X1-X2)*(Y3-Y4) - (Y1-Y2)*(X3-X4);
    PX= ((X1*Y2 - Y1*X2)*(X3-X4) - (X1-X2)*(X3*Y4 - Y3*X4))/D;
    PY= ((X1*Y2 - Y1*X2)*(Y3-Y4) - (Y1-Y2)*(X3*Y4 - Y3*X4))/D;
    x2=PX; px=PX;
    y2=PY; py=PY;
  }
  
  boolean hitsBar(Barrier b){
    float t,u;
    float n = (x1-b.x1)*(b.y1-b.y2);
    float n2 = (y1-b.y1)*(b.x1-b.x2);
    float d = (x1-x2)*(b.y1-b.y2);
    float d2 = (y1-y2)*(b.x1-b.x2);
    
    t=(n-n2)/(d-d2);
    
    n = (x1-x2)*(y1-b.y1);
    n2=(y1-y2)*(x1-b.x1);
    d = (x1-x2)*(b.y1-b.y2);
    d2=(y1-y2)*(b.x1-b.x2);
    
    u=-(n-n2)/(d-d2);
    
    if(t<=1&&t>=0&&u<=1&&u>=0){
   
        return true;
    
    }
    return false;
  }
  
  
  float c=255;
  void hit(){
    c=0;
  }
  
  void show(){
    strokeWeight(1);
    stroke(c);

    line(x1,y1,x2,y2);
    ellipse(x1,y1,5,5);
  }
  
  
}