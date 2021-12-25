
// By: Hanz Aquino



float fx,fy,lx,ly;
Arrows arr; Object obj;
boolean p = false;
int arrC=10;

boolean gO=false;
void setup(){
  obj = new Object ();
  arr = new Arrows();
}
int Score = 0;

void draw(){
  smooth ();
  play();
  noStroke();
  //rect(10,10,100,75);
  
 if(arrC<0){
    background (0,0,0);
    textSize(200);
    fill(255,255,255);
    textAlign(CENTER);
    text (" Game \n Over ", width/2,-200+height/2);
    textSize(40);
    text("(Tap Anywhere to continue)",width/2,450+ height/2);
    if(mousePressed){
      obj.reset();
      arrC=11; Score=0;
    }
    
  }
}



void play(){
  background (240,220,210);
  fill(250,235,225);
  noStroke();
  rect(0, height, width, -height/3);
  textSize(40);
  fill(200,180,170);
  textAlign(CENTER);
  text("SCORE:",width/2,500);
  text("Arrows: "+arrC,150,100);
  textSize(200);
  text(Score,width/2,700);
  stroke(0,0,0);
  arr.move();
  strokeWeight(3);
 if(p)line(fx,fy,lx,ly);
  arr.showArrow();
  
  obj.move();
  obj.show();
  
  if((obj.x-arr.x)*(obj.x-arr.x)+(obj.y-arr.y)*(obj.y-arr.y)<(obj.size-50)*(obj.size-50)){
    arr.hit();
    obj.hit();
    arrC++;
    Score++;
  }
 
  
  
   
}

void mousePressed(){
  if(!gO){
  fx = mouseX;
  fy = mouseY;
  if(fy<(height-(height/3))) fy=height-(height/3);
  arr.pos(fx,fy);
  p=true;
  }
}

void mouseDragged(){
  if(!gO){
  lx = mouseX;
  ly = mouseY;
  arr.aim(fx,fy,lx,ly);
  }
}

void mouseReleased(){
  p=false;
  if(arrC>0){
  arr.shoot();
  }
  arrC--;
}