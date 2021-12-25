Drop d;

void setup (){
  smooth();
  d=new Drop();
}

void draw(){
  background (240,180,230);
  if(d.y+50>=height){
    d.y=height-50;
  } else{
  d.fall();
  }
  
  d.show();
}