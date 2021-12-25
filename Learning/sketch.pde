Object o;

void setup(){
  o=new Object(width/2, height);
}
int frame=0;
void draw(){
  background (0);
  
  textSize(35);
  fill(0,255,20);
  textAlign(LEFT);
  text("Angular Direction: " + o.angleDir*(180/PI)+"°"+"\n"+"x_velocity: "
  +round(o.vel.x)+"\n"+"y_velocity: " + round(o.vel.y)+"\n",50,50);
  o.move();
  if(frame%10==0){
    o.angleDir=random(0,2*PI);
  }
  o.show();
  frame++;
}


void mouseDragged(){
  o.angleDir=map(mouseX,0,width,0,2*PI);
}