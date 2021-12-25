Object obj = new Object();

void setup(){
  
}


void draw(){
  background (100,0,100);
  fill(255,255,255);
  frameRate(144);
  //rect(0, height, width, -150);
  obj.show(0);
  obj.fall();
  obj.reset(obj.hitG);
  obj.grDr();
}