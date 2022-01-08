

ArrayList<SpaceObject> space_objects;

int timeMultiplier = 3000;
float zoom;
float xpt = 0,ypt = 0;
//2360620.8 secs or frames
void setup(){
  
  size(500,500, OPENGL);
  frameRate(60);
  zoom = 0.05;
  
  space_objects = new ArrayList();
  
  float earth_mass = 5.972*(pow(10,24));
  float earth_radius = 6378137;
  
  float moon_mass = 7.35*(pow(10,22));
  float moon_radius = 1737000;
  float moon_vel = 1022;
  
  float distancee = 384400000;
  
  space_objects.add(new SpaceObject(0,0, earth_mass, earth_radius,0,0));
  space_objects.add(new SpaceObject(0,-distancee,moon_mass,moon_radius, moon_vel,PI/2));
  
}




void draw(){
  background(0);
  textSize(12);
  textAlign(CENTER);
  text(second()+"\n Time: "+(frameCount*timeMultiplier)/86400+" days \n FPS: "+(int)frameRate+"\n Zoom: "+zoom,50,20);
  
  translate((width/2)+xpt, (height/2)+ypt);
  scale(zoom);
  fill(255);
  stroke (255);
  strokeWeight(1);
  
  line(0, -999999999, 0, 999999999);
  line(-999999999, 0, 999999999, 0);
  
  
  for(int i=0;i<timeMultiplier;i++){
    for(int j = 0; j < space_objects.size(); j++){
      space_objects.get(j).applyForce(space_objects, j);
      space_objects.get(j).update();
    }
  }
  for(int l = 0; l < space_objects.size(); l++){
    space_objects.get(l).show();
    space_objects.get(l).showTrail();
  }
  //if(sat.att_direction>0) noLoop();
}


void mouseDragged(){
  xpt -= pmouseX -mouseX;
  ypt -= pmouseY -mouseY;
}
void keyPressed(){
  if(key == '='){
    zoom += 0.005;
  } else if(key == '-') {
    zoom = zoom-0.005>0 ? zoom-0.005:zoom;
  }
}
