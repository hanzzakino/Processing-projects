SpaceObject earth;
SpaceObject sat;

void setup(){
  
  size(1080,1920,OPENGL);
  
  float earth_mass = 5.972*(pow(10,24));
  float earth_radius = 6378137;
  float moon_mass = 7.342*(pow(10,16));
  float moon_radius = 1737100;
  earth = new SpaceObject(0,0, earth_mass, earth_radius,0,0);
  sat = new SpaceObject(0,-38440000,moon_mass,moon_radius,3220.1,PI/2);
}

int curSec;
int frame = 0;
int hi=0;

void draw(){
  background(0);
  translate(width/2, height/2);
  fill(255);
  stroke (255);
  strokeWeight(1);
  if(curSec!=second()){
    curSec=second();
    hi=frame;
    frame=0;
  }
  
  for(int i=0;i<200;i++){
    
    //code here
    sat.applyForce(earth);
    earth.applyForce(sat);
  
    sat.update();
    earth.update();
  }
  
  sat.show();
  earth.show();
  
  textSize(25);
  textAlign(CENTER);
  text(second()+"\n Frame: "+frame+"\n FPS: "+hi,(-width/2)+100,(-height/2)+100);
  
  frame++;
}