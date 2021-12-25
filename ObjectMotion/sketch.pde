Object obj[];
int objectCount=4;

void setup(){
  //size(720,1280);
  obj = new Object[objectCount];
  for(int i=0;i<objectCount;i++){
    obj[i] = new Object(random(0,width), random(0,height),random(-20,20),random(-20,20),obj,objectCount);
  }
  
}

void draw(){
  background (0,0,50);
  for(int i=0;i<objectCount;i++){
  obj[i].onMotion();
  obj[i].collide(i);
  obj[i].onBounce();
  obj[i].show();
  }
  
}

void mousePressed(){
  obj[0].move((mouseX-obj[0].x)*0.2,(mouseY-obj[0].y)*0.2);
}