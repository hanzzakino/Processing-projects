int wallC=9;
Wall w[];
Car c;
void setup(){
 size(1080,1920, OPENGL); 
  c= new Car(80, 1000, 15);
  
  w = new Wall[wallC];

  w[0] = new Wall(0, 180, 800,180*2);
  w[5] = new Wall(200, 180*2, width, 180*3);
  w[6] = new Wall(0, 180*3, 800,180*4 );
  w[7] = new Wall(200,180*4, width, 180*5);
  w[8] = new Wall(0, 180*5, 800, 180*6);
  
  w[1] = new Wall(0,0,width,0);
  w[2] = new Wall(0,0,0, height);
  w[3] = new Wall(0, height, width, height);
  w[4] = new Wall(width, height,width,0);
  
}


void draw(){
  background(150);
  fill(255);
  textSize(25);
  textAlign(CENTER);
  text(c.l[0]+"\n"+c.l[1]+"\n"+c.l[2]+"\n"+c.l[3]+"\n"+c.path+"\n"+c.dir, width-100, 100);
 if(!mousePressed){
   
  c.move();
  
  }
  c.getPrxL_(w,wallC);
  
  for(int i=0; i<wallC; i++){
   
    
    
    w[i].show();
    
    
    
  }
  c.show();
  
}

void mouseDragged(){
 
 c.rePos(mouseX,mouseY);
 
}