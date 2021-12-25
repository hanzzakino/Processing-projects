
// Fractals using recursive function
// by: Hanz Aquino
// 04/24/20


void setup(){
  size(720,1440, OPENGL);
  background (0);
}

float aa=rad(180);

float dif=0;
int frame=0;
float size =115;


void draw(){
  background (0);
  fill(255);
  strokeWeight(1);
  
  stroke(0,255,0);
  
  fractal(width/2,height/2,0,size,rad(dif));
  fractal(width/2,height/2,rad(90),size,rad(dif));
  fractal(width/2,height/2,rad(270),size,rad(dif));
  fractal(width/2,height/2,aa,size,rad(dif));
  
      if(!mousePressed) dif+=1.5;
       
  frame++;
}

//fractal recursion
void fractal(float xx, float yy, float an, float l, float aDiff){
 
 //aDiff is the angular distance between lines
 //variable 'an' is the starting angle
 //2Lines
  line(xx,yy,xx+l*sin(an+aDiff),yy+l*cos(an+aDiff));
  line(xx,yy,xx+l*sin(an-aDiff),yy+l*cos(an-aDiff));
  
  //recursion if length is less than 10
  //l will be reduced to 60% each function call
  if(l>10){
    fractal(xx+l*sin(an+aDiff),yy+l*cos(an+aDiff),an+aDiff,l*0.6,aDiff);
    fractal(xx+l*sin(an-aDiff),yy+l*cos(an-aDiff),an-aDiff,l*0.6,aDiff);
  }
  
}


//converts degrees to radians
float rad(float d){
  return d*(PI/180);
}