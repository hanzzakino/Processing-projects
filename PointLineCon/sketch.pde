Point p[];
int pCount=20;
int ss=10;
boolean touch=true;

void setup(){
  
  p= new Point [pCount];
  
  
  
}
int fr=0;
int N=0;
int S=0;
void draw(){
  background (0);
  N=0;
  if(touch&&(fr%1==0)){
    pCount=(int) random(4,20);
  for(int i=0; i<pCount; i++){
    p[i] = new Point (random (ss,width-ss),random (ss, height-ss),p,pCount);
    
  }
  }
    p[0].pos(ss,ss);
    p[1].pos(width-ss,ss);
    p[2].pos(ss, height-ss);
    p[3].pos(width-ss, height-ss);
  
  for(int i=0; i<pCount; i++){
    p[i].con();
    p[i].show();
  }
  fr++;
  N=(pCount*(pCount-1))/2;
  fill(255,254,255);
  textSize(45);
  textAlign(CENTER);
  text(N, width/2, 100);
  
}

void mousePressed(){
  touch=false;
}
void mouseReleased(){
  touch=true;
}