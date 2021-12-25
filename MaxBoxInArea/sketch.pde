
void setup(){
  background(random(0,255),random(0,255),random(0,255));
}

int size = 56;
int f_sizeX=1080;
int f_sizeY=1920;

void draw(){
  
  
  strokeWeight(1);
 
  for(int i=0;i<f_sizeY;i+=size){
      if(i+size>f_sizeY) break;   
    for(int j=0;j<f_sizeX;j+=size){
      if(j+size>f_sizeX) break;
      rect(j,i,size,size);
      ellipse(j+size/2,i+size/2,size*0.7,size*0.7);
      
    }
  }
  

}
