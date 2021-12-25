
class Car{
  
  float x1, y1;
  float size;
  
  float vx;
  float vy;
  float ax;
  float ay;
  
  float[] x2;
  float[] y2;
  
  float[] l;
  
  float[] a;
  
  float dir;
  
  float min = 65;
  float vel = 20;
  
  Car(float xx, float yy, float ss){
    x1=xx;
    y1=yy;
    size=ss;
    x2=new float[4];
    y2=new float[4];
    l=new float[4];
    setDirect();
    path=0;
    choosePath();
    setVal();
  }
  void setVal(){
    l[0]=height*2;
    l[1]=height*2;
    l[2]=height*2;
    l[3]=height*2;
    x2[0] = x1+ l[0]*sin(0);
    x2[1] = x1+ l[1]*sin(PI/2);
    x2[2] = x1+ l[2]*sin(PI);
    x2[3] = x1+ l[3]*sin(1.5*PI);
    y2[0] = y1+ l[0]*cos(0);
    y2[1] = y1+ l[1]*cos(PI/2);
    y2[2] = y1+ l[2]*cos(PI);
    y2[3] = y1+ l[3]*cos(1.5*PI);
  }
  
  int path;
  
  
  void choosePath(){
    if(dir==0){
      if(l[0]>l[2]){
        vy=vel;
        path=0;
      } else {
        vy=-vel;
        path=2;
      }
    } else if(dir==1){
      if(l[1]>l[3]){
        vx=vel;
        path=1;
      } else{
        vx=-vel;
        path=3;
      }
    }
  }
  
  void onHold(){
     if(path==0){
       vy=0;
       dir=1;
       choosePath();
     } else if(path==2){
       vy=0;
       dir=1;
       choosePath();
     } else if(path==3){
       vx=0;
       dir=0;
       choosePath();
     } else if(path==1){
       vx=0;
       dir=0;
       choosePath();
     }
  }
  
  void move(){
    x1+=vx;
    y1+=vy;
    
   
    if(l[path]<min){
      onHold();
    }
   
    
    
    setVal();
  }
  
  void rePos(float xx, float yy){
    x1=xx;
    y1=yy;
    float temp=0;
    setDirect();
    setVal();
  }
 
  void setDirect(){
    if((l[0]+l[2]) > (l[1]+l[3])){
      dir=0;
    } else {
      dir=1;
    }
  }
  
  void  getPrxL_(Wall[] b , int wn){
    for(int i=0; i<4; i++){
      for(int j=0;j<wn;j++){
    float t,u;
    float n = (x1-b[j].x1)*(b[j].y1-b[j].y2);
    float n2 = (y1-b[j].y1)*(b[j].x1-b[j].x2);
    float d = (x1-x2[i])*(b[j].y1-b[j].y2);
    float d2 = (y1-y2[i])*(b[j].x1-b[j].x2);
    
    t=(n-n2)/(d-d2);
    
    n = (x1-x2[i])*(y1-b[j].y1);
    n2=(y1-y2[i])*(x1-b[j].x1);
    d = (x1-x2[i])*(b[j].y1-b[j].y2);
    d2=(y1-y2[i])*(b[j].x1-b[j].x2);
    
    u=-(n-n2)/(d-d2);
    
    if(t<=1&&t>=0&&u<=1&&u>=0){
       x2[i]= x1 + t*(x2[i]-x1);
       y2[i]= y1 + t*(y2[i]-y1);
       l[i] = sqrt((x2[i]-x1)*(x2[i]-x1) + (y2[i]-y1)*(y2[i]-y1)); 
    }
      }
    }
  }
  
  
  void show(){
   fill(0);
   strokeWeight(1);
   
   line(x1,y1,x2[0],y2[0]);
   line(x1,y1,x2[1],y2[1]);
   line(x1,y1,x2[2],y2[2]);
   line(x1,y1,x2[3],y2[3]);
   
   rectMode(CENTER);
   rect(x1,y1,size,size);
   
   
  }




}