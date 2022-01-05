SpaceObject earth;
SpaceObject sat;
int timeMultiplier = 600;
float zoom;
float xpt = 0,ypt = 0;
//2360620.8 secs or frames
void setup(){
  
  size(500,500);
  frameRate(60);
  zoom = 1;
  
  float earth_mass = 5.972*(pow(10,24));
  float earth_radius = 6378137;
  float moon_mass = 7.342*(pow(10,22));
  float moon_radius = 1737100;
  earth = new SpaceObject(0,0, earth_mass, earth_radius,0,0);
  sat = new SpaceObject(0,-384467000,moon_mass,moon_radius, 1022,PI/2);
}




void draw(){
  background(0);
  
  textSize(12);
  textAlign(CENTER);
  text(second()+"\n Time: "+(frameCount*timeMultiplier)+" s \n FPS: "+frameRate,50,20);
  
  translate((width/2)+xpt, (height/2)+ypt);
  scale(zoom);
  fill(255);
  stroke (255);
  strokeWeight(1);
  
  for(int i=0;i<timeMultiplier;i++){
    
    //code here
    sat.applyForce(earth);
    earth.applyForce(sat);
    
    sat.update();
    earth.update();
  }
  
  sat.showTrail();
  earth.showTrail();
  sat.show();
  earth.show();
  
}


void mouseDragged(){
  xpt -= pmouseX -mouseX;
  ypt -= pmouseY -mouseY;
}
void keyPressed(){
  if(key == '='){
    zoom += 0.005;
  } else if(key == '-') {
    zoom -= 0.005;
  }
}
