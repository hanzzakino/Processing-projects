Objectt earth;
Objectt sat;

void setup(){
  
  float eMass =(5.972*(pow(10,19)));
  float eRad = 63.78137;
  
  earth = new Objectt(width/2, height/2, eMass, eRad, 0,0);
  sat = new Objectt(width/2+2, height/2-300, 10000, 5, scaled(115000),toRad(90));
  
}
int f=0;
int t=0;
void draw(){
  background(0);
  stroke(255);
  fill(255);
  //frameRate(120);
  
  if(f%30==0){
    t++;
    sat.applyForce(earth);
    earth.applyForce(sat);
    earth.update();
    sat.update();
  }
  
  textSize(40);
  text(t,150,150);
  
  earth.show();
  sat.show();
  f++;
}



float scaled(float v){
  return v*(pow(10,-5));
}

float toRad(float d){
  return d*(PI/180);
}