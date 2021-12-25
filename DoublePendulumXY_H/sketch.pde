float x1,y1,x2,y2;
float x1v,x2v,y1v,y2v;
float x1a,x2a,y2a,y1a;
float A1;
float A2;
float L1=260;
float L2=260;
float m1=50;
float m2=50;

float A1v,A2v;
int trailLength = 1000;

ArrayList<Trail> t = new ArrayList<Trail>();


void setup(){
  size(1080,1920, OPENGL);
  A1v=0.2;
  A2v=0.01;
  
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
  x1=L1*sin(A1);
  y1=L1*cos(A1);
  line(0,0,x1,y1);
  ellipse(x1,y1,m1,m1);
  //pendulum 2
  x2=x1+L2*sin(A2);
  y2=y1+L2*cos(A2);
  line(x1,y1,x2,y2);
  ellipse(x2,y2,m2,m2);
  
  A1+=A1v;
  A2-=A2v;
  
  
  move();
  
  if(mousePressed){
    
    A1v= map(mouseX,0,width,-0.5,0.5);
    A2v= map(mouseY,0,height,-0.5,0.5);
  
    t.clear();
    
  }
  
  
  
  //Displays Angles
  textSize(45);
  textAlign(CENTER);
  fill(0,0,180);
  float Aa = round(asin(x1/L1)*(180/PI));
  float Ab = round(asin((x2-x1)/L2)*(180/PI));
  text((int)Aa+"°"+"\n"+(int)Ab+"°",0,800);
  
}

void move(){
   
  
  
  //Adds new trail object
  t.add(new Trail(x2,y2));
  
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

  
  
}
