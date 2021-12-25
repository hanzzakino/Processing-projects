

float p1x;
float p1y;
float p2x;
float p2y;
float L1=180;
float L2=180;
float A1=PI/3;
float A2=PI/2;
float A1v;
float A1a;
float A2v;
float A2a;
float m1=30;
float m2=30;
float g=1;
float air=1;

int trailLength = 500;

ArrayList<Trail> t = new ArrayList<Trail>();


void setup(){
  
  size(720,1440, OPENGL);
}

void draw(){
  background (255);
  fill(0);
  smooth();
  stroke(0);
  strokeWeight(2);
  translate(width/2,height/3);
  ellipse(0,0,25,25);
  
  //pendulum 1
  p1x=L1*sin(A1);
  p1y=L1*cos(A1);
  line(0,0,p1x,p1y);
  ellipse(p1x,p1y,m1,m1);
  //pendulum 2
  p2x = p1x + L2*sin(A2);
  p2y = p1y + L2*cos(A2);
  line(p1x,p1y,p2x,p2y);
  ellipse(p2x,p2y,m2,m2);
  
  if(!mousePressed){
  move();
  } else {
    float mapAngle = map(mouseX,0,width,2*PI,0);
    float mapAngle2 = map(mouseY,0,height,0,2*PI);
    A1=mapAngle;
    A2=mapAngle2;
    A1v=0;
    A2v=0;
    A1a=0;
    A2a=0;
    t.clear();
  }
  //Displays Angles
  textSize(45);
  textAlign(CENTER);
  fill(0,0,180);
  float Aa = round(asin(p1x/L1)*(180/PI));
  float Ab = round(asin((p2x-p1x)/L2)*(180/PI));
  text((int)Aa+"°"+"\n"+(int)Ab+"°",0,800);
  
}

void move(){
  /////////////////
  //Angular Acceleration of Pendulums
  float n1=(-g*(2*m1+m2)*sin(A1));
  float n2=-m2*g*sin(A1-(2*A2));
  float n3=-2*sin(A1-A2);
  float n4=m2*(A2v*A2v*L2 + A1v*A1v*L1*cos(A1-A2));
  float den= L1*(2*m1 + m2 - m2*cos(2*A1 - 2*A2));
  
  A1a= (n1+n2+(n3*n4))/den;
  
  n1 = 2*sin(A1-A2);
  n2 = A1v*A1v*L1*(m1+m2);
  n3 = g*(m1+m2)*cos(A1);
  n4 = A2v*A2v*L2*m2*cos(A1-A2);
  
  A2a= (n1*(n2+n3+n4))/den;
  
  ////////////////////////
  
  //Adds new trail object
  t.add(new Trail(p2x,p2y));
  
  //Iterates on every point
  for(int i=0; i<t.size(); i++){
    //Adds new trail point
    t.get(i).addTrail();
    if(i>0){
      stroke(0);
      //Trail line (Connects every point)
      line(t.get(i).x,t.get(i).y,t.get(i-1).x,t.get(i-1).y);
      }
      
    if(t.size()>trailLength){
      t.remove(i);
    }
  }
 
  //Angle velocity and Angular Acceleration
  A1v+=A1a;
  A2v+=A2a;
  A1+=A1v*air;
  A2+=A2v*air;
  
  
  
  //hack to stop infinte velocity
  if(A2v<-1){
    A2v=0;
    A1a=0;
    A2a=0;
  }
  if(A2v>1){
    A2v=0;
    A1a=0;
    A2a=0;
  }
 
  
}
