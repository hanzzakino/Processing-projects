
//From April 26-30 2020
//Hanz Aquino

RocketPop popul1;

Target t1;
Obstacle o1;
Obstacle o2;
Obstacle obs[];
void setup(){
  //Obstacles
  size(1080,1920, OPENGL);
  obs= new Obstacle[2];
  
  obs[0]= new Obstacle(0,(height/2), 750, (height/2));
  //obs[0]= new Obstacle(0,0,0,0);
  obs[1]= new Obstacle(250,500+height/2,width,500+ height/2);
  //Target
  t1= new Target(width/2,150);

  popul1=new RocketPop(357);
  
}

float time;
float t;
void draw(){
  background (0);
  fill(255);
  textSize(45);
  text("Correct Paths: "+(int)popul1.doneAlgoCount()+"\n"+"Generations: "+(int)popul1.generation+"\n"+"Time: "+time
  , 700,100);
  
  t1.show();
  checkLives();
  
  if(time==0&&t==0) popul1.evolve();
  
 
    popul1.move(time,obs,t1);
  
    
  
  t++;
  
  obs[0].show();
  obs[1].show();
  time++;
}

void checkLives(){
  boolean active = true;
  // check if all is dead
  for(int i=0; i<popul1.population; i++){
    if(!popul1.rockets.get(i).dead){
      active = false;
    }
  }
  //proceed to new generation if all is dead
  if(active){
    time=0;
    popul1.calcFitness();
    popul1.newGeneration();
  //  popul1.evolve();
  //  popul1.findBestPath();
    popul1.resetRockets();
  }
}