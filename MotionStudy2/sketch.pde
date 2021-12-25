Ball[] ball;
int ballNum=10;
float s = random(-5,5);
void setup(){
  
  
  ball = new Ball[ballNum];
  
  for(int i=0; i<ballNum;i++){
    s = random(-5,5);
    ball[i]= new Ball(30,random(0,width),random(0, height),s,s, ball, ballNum, i);
  }
  
}

void draw(){
  background (0);
  smooth();
  for(int i=0; i<ballNum;i++){
    ball[i].collide(i);
    ball[i].move();
    ball[i].show();
  }
}