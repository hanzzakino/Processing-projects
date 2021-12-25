class Droplet{
  
  float x;
  float y;
  float ySpeed;
  float gravity = 3;
  float strk;
  float len;
  float origSpeed;
  
  Droplet(float xx,float yy, float ss, float ll, float str){
    x=xx;
    y=yy;
    ySpeed=ss;
    origSpeed=ss;
    len=ll;
    strk=str;
  }
  
  void fall(){

    y+=ySpeed;
    ySpeed+=gravity;
  }
  
  float gHit=0;
  void hitG(){
    x=random(1,width-1);
    y=random(-100,0);
    ySpeed=random (8,16);
    gHit += 1;
  }
  
  
  void show(){
    stroke(150,100,200);
    strokeWeight(strk);
    line(x,y,x,y+len);
   
  }
  

  
  void show(String wrd){
    int ln = (int) random(0,wrd.length());
    stroke(150,100,200);
    fill(150,100,200);
    strokeWeight(strk);
    textAlign(CENTER);
    textSize(35);
    text(wrd.charAt(ln),x,y);
  }
  
  void reset (){
    y=0;
    ySpeed = 0;
  }
  
}