ArrayList<Block> block=new ArrayList<Block>();

void setup(){
 
  block.add(new Block());
  
}

int frame = 0;

void draw(){
 
  background (0);
  stroke (0,255,0);
  line((width/2),0,(width/2),height);
  stroke (0);
  
  if(mousePressed){
  block.add(new Block (mouseX,mouseY));
}
  
  
  if(frame%1==0){
    block.add(new Block ());
  }
  
  for(int i=0; i<(block.size()); i++){
    block.get(i).show();
    block.get(i).move();
    
    if(block.get(i).x<-50){
     block.remove(i);
    }
    
    
    if(block.get(i).x<width/2){
      block.get(i).setColor(0,255,0);
      block.get(i).vy=random (-20,20);
      block.get(i).vx=random (2,30);
    }
    
    
     
   }
  
  
  frame++;
  textSize(50);
  textAlign(CENTER);
  text(block.size(),width/2,100);
}

