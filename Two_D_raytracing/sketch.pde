

ArrayList<RaySource> r = new ArrayList<RaySource>();
int barCount = 5;
Barrier b[] = new Barrier[barCount];
int rayCount =400;
float sourceX;
float sourceY;
void setup(){
  size(1080,1920, OPENGL);
  sourceX=width/2;
  sourceY=400;
  for(int i=0;i<rayCount; i++){
    r.add(new RaySource(sourceX,sourceY, i*((2*PI)/rayCount)));
  }
  for(int j=0; j<barCount; j++){
      b[j] = new Barrier(random(0,width),random(0,height),random(0,width),random(0,height));
  }
}


void draw(){
  background(30);
  
  
  for(int i=0;i<rayCount; i++){
    
    
    
    if(mousePressed){
      r.get(i).rePos(sourceX,sourceY);
    }
    
   for(int j=0; j<barCount; j++){
     
    if(r.get(i).hitsBar(b[j])){
        r.get(i).inter(r.get(i).x1,r.get(i).y1,r.get(i).x2,r.get(i).y2,b[j].x1,b[j].y1,b[j].x2,b[j].y2);
    }
    b[j].show();
   }
    
    
    
    
    r.get(i).show();
    
    //r.get(i).move();
    
    
  }
  
  
}

void mouseDragged(){
  sourceX=mouseX;
  sourceY=mouseY;
}