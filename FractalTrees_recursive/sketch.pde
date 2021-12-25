
// Fractal Trees using recursive function
// by: Hanz Aquino
// 


float angle=rad(45);

void setup(){
  size(1080,1920, OPENGL);
}


void draw(){
  background (0);
  fill(255);
  strokeWeight(20);
  
  stroke(170,155,100);
  
  line(width/2, height, width/2, height-600);
  fractal(width/2,height-600,rad(180),260,angle);
  //noLoop();
}

void mouseDragged(){
  angle = map(mouseX,0, width, 0, rad(180));
}

//fractal recursion
void fractal(float xx, float yy, float an, float l, float aDiff){
 
 //aDiff is the angular distance between lines
 //variable 'an' is the starting angle
 //2Lines
  stroke(170,155,100);
  strokeWeight(map(l,6,260,1,20));
  //aDiff=random(rad(10),rad(45));
 
  line(xx,yy,xx+l*sin(an+aDiff),yy+l*cos(an+aDiff));
  line(xx,yy,xx+l*sin(an-aDiff),yy+l*cos(an-aDiff));
  

  
  
  //recursion if length is less than 10
  //l will be reduced to 60% each function call
  if(l>3){
    fractal(xx+l*sin(an+aDiff),yy+l*cos(an+aDiff),an+aDiff,l*0.6,aDiff);
    fractal(xx+l*sin(an-aDiff),yy+l*cos(an-aDiff),an-aDiff,l*0.6,aDiff);
  } else{
    noStroke();
    ellipse(xx+l*sin(an+aDiff),yy+l*cos(an+aDiff),l,l);
    ellipse(xx+l*sin(an-aDiff),yy+l*cos(an-aDiff),l,l);
  }
  
}


//converts degrees to radians
float rad(float d){
  return d*(PI/180);
}