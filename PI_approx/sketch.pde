void setup(){
 size(1080,1080, OPENGL);
 translate (width/2, height/2);
 background(0);
}
double pCircle = 0;
double total = 0;
double ppi = 0;
void draw(){
  background (0);
  translate (width/2, height/2);
  float sx=0;
  float sy=0;
    
  
  strokeWeight(5);
  for(int i=0;i<10000;i++){
    stroke(100, 255, 0, 100);
    sx= (random(-1080,1080));
    sy= (random(-1080,1080));
    total++;
    
    if((sx*sx)+(sy*sy)<540*540){
      stroke(0, 0, 255, 100);
      point(sx,sy);
      pCircle++;
    } else{
      point(sx,sy);
    }
    
  }
  ppi = 4*(4*pCircle)/(total);
  println(ppi);
 }