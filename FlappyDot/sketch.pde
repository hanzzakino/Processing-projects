Dot dot;


ArrayList<Obstacle> obs = new ArrayList<Obstacle>();
void setup(){
  size(1080,1920, OPENGL);
  dot = new Dot();
 //obs.add(new Obstacle ());
}

int frame=0;

int score = 0;


void draw(){
  background (200,200,255);
  
  /**
  line(width/3.2,0,width/3.2,height);
  line(0,height/2, width, height/2);
  line(0,50+height/2, width,50+ height/2);
  **/
  
  play();
  
  fill(255);
  ellipse(width-150,150,160,160);
  fill(15,15,200);
  textSize(100);
  textAlign(CENTER);
  text(score/6, width-150,185);
  
  println(obs.size());
  
  
  frame++;
}







void play(){
  
  
  //Adding obstacles according to frame
  if(frame%55==0){
    obs.add(new Obstacle(floor(score/6)));
    
  }
  
  
  //Dot Functions
  dot.move();
  dot.show();
  

  //Obstacles functions
  for(int j=0; j<obs.size(); j++){
    
    
    obs.get(j).move();
    obs.get(j).show();
    
    if(obs.get(j).x<-width){
      obs.remove(j);
    }
    
    
      
    
    
    if(dot.x>obs.get(j).x&&dot.x<obs.get(j).x+obs.get(j).w){
      if(dot.y-dot.rad<obs.get(j).mainLen - obs.get(j).opensize || dot.y+dot.rad>obs.get(j).mainLen){
        obs.get(j).hit();
        score=0;
      }
      score++;
    }
      
  }
  

 
  
}


void mousePressed(){
  dot.jump();
}