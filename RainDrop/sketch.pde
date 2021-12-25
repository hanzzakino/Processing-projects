
Droplet[] drp;
int dropCount = 50;
float xSiz = 1080;
float ySiz = 1920;

void setup(){
  size(1080,1920, OPENGL);
  drp = new Droplet[dropCount];
  for(int i=0;i<dropCount;i++){
    drp[i] = new Droplet(random(1,xSiz-1),random(-ySiz,ySiz),random(3,5),random(15,150),random(3,5));
  }
}

int drops=0;
double liq=0;
float h=0;

void draw(){
  background (200,180,240);
  for(int j=0; j<dropCount;j++){
    if(drp[j].y>=height){
      liq+=0.001;
      drp[j].hitG();
      drops++;
      }
    drp[j].fall();
    drp[j].show("0011");
  }
  h=((float)Math.floor(liq));
  if(h>=height) liq=0;
  fill(150,100,200);
  rect(0,ySiz,xSiz,-h);
  println(drops+"      "+h);
}