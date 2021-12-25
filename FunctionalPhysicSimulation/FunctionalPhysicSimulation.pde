//By: Hanz
//Realtime physics simulator

final float gravity = -9.8;
float zoom;
float xpt = 0,ypt = 0;


Object o1;
RocketController rc;

void setup(){
  frameRate(120);
  size(500,500);
  zoom = 1;
  
  
  o1 = new Object(width/2, 50);
  rc = new RocketController();
  
  
  float ABTime = rc.getAirborneTime(o1.altitude,o1.vy, o1.acc.y);
  print(ABTime);
  
}

void draw(){
  background(0);
  o1.showMetrics();
  translate(xpt,ypt);
  scale(zoom);
  
  o1.update((float) millis()/1000);
  o1.show();
  o1.manualControl(key); 
  o1.setBoundary(height,0,width);
}




void mouseDragged(){
  xpt -= pmouseX -mouseX;
  ypt -= pmouseY -mouseY;
}
void keyPressed(){
  if(key == '='){
    zoom += 0.5;
  } else if(key == '-') {
    zoom -= 0.5;
  }
}
