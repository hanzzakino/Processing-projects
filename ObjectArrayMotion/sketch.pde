Block[] block;

void setup(){
  
  
  block = new Block[0];
  
  
}

int frame = 0;

void draw(){
  background (0);
  
  if(frame%20==0){
    block = (Block[]) append(block, new Block());
    block[block.length-1]=new Block();
  }
  
  
  for(int i=0; i<block.length; i++){
    block[i].show(); 
    block[i].move();
    if(block[i].x<width/2){
     block[i].x=width;
    }
  }
  
  
  frame++;
  
}

