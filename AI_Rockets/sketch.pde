
//AI_rockets
//Hanz Aquino
//start date: April 26, 2020
//wip 
// 04.28 nothing really works well in new Generations, maybe I need a better code for that

Target t1;
Obstacle o1;

ArrayList<Manuever> parents[];

int rocketNum=10;
ArrayList<Rocket> rc = new ArrayList<Rocket>();

void setup(){
  
  //initial Population
  for(int i=0; i<rocketNum; i++){
    
    rc.add(new Rocket(width/2,height-70));
    rc.get(i).addManv(new Manuever(random(PI/2,3*(PI/2)),0));
  }
  //Obstacles
  o1= new Obstacle(0,height/2, 750, height/2);
  //Target
  t1= new Target(100,100);
  
}


float time=0;
float manvCount;

void newGeneration(){
  time=0;

  //Create the new Generation
  for(int i=0; i<rocketNum; i++){
    rc.get(i).reset(width/2,height-70);
  }
 
  
}

int generation;
int currentGen=0;

void draw(){
  background (0);
  fill(255);
  textSize(32);
  
  if(currentGen!=generation){
    evolveRockets();
    currentGen++;
  }
  
  
  text(time+"\n"+generation+"\n"+rc.get(0).distToTarget(t1),width/2,70);
  
  
  //iterations on each rockets
  for(int i=0; i<rc.size(); i++){
   
    
    rc.get(i).Manuevers(time);//do set of Manuevers
    
    rc.get(i).update();//move rockets
   
    if(!rc.get(i).dead) rc.get(i).show();//only show rockets if it's alive
    
    if(rc.get(i).hit(o1)){
       rc.get(i).kill(time,t1);
    }
    
  }
  
  checkLives();//if all is dead create new Generation
  
  
  //show obstacles
  t1.show();
  o1.show();
 
  time++;
}

void mouseDragged(){
  //Manual Control rocket 0
  rc.get(0).thrust(map(mouseX,0,width,0,2*PI));
}


void evolveRockets(){
  float tm;
  for(int i=0; i<rocketNum; i++){
    tm=rc.get(i).timeOfDeath;
    tm = floor(random(tm-30,tm));
    rc.get(i).addManv(new Manuever(random(PI/2,3*(PI/2)),tm));
  }
}
//NEW GENERATION
//Function that creates an array of ManueverList from rockets
//Crossover or Combination of ManueverList from 2 Parent List will be
//Distibrted to the new generation with the probability being
//Calculated from how near the rocket is from the target
//EVOLUTION ON EACH GENERATION
//After each gene transfer , each rocket will evolve and create
//new genes themselves. Then the new generation will happen over and over again. 
void passGenes(){
  float minProxToTarget=0;
  float max=0;
  
  int temp=0;
  for(int i=0; i<rocketNum; i++){
    
   if(rc.get(i).dTarget>max){
     max=rc.get(i).dTarget;
   }
   if(rc.get(i).dTarget<minProxToTarget){
     minProxToTarget=rc.get(i).dTarget;
     temp=i;
   }
  }
  
  for(int i=0; i<rocketNum; i++){
    rc.get(i).geneProbability=map(rc.get(i).dTarget,minProxToTarget,max,0.7,0);
  }
  
  for(int i=0; i<rocketNum; i++){
    rc.get(i).resetManuevers();
    rc.get(i).thisManv=parents();
   
    rc.get(i).geneProbability=0;
  }
}

ArrayList<Manuever> parents(){
  int p1= (int) floor(random(0,rocketNum-1));
  int p2= (int) floor(random(0,rocketNum-1));
  int p3= (int) floor(random(0,rocketNum-1));
  int p4= (int) floor(random(0,rocketNum-1));
  int P1,P2;
  if(rc.get(p1).geneProbability>rc.get(p2).geneProbability){
    P1=p1;
  } else{
    P1=p1;
  }
  if(rc.get(p3).geneProbability>rc.get(p4).geneProbability){
    P2=p3;
  } else{
    P2=p4;
  }
  return crossover(rc.get(P1).thisManv,rc.get(P2).thisManv);
}

ArrayList<Manuever> crossover(ArrayList<Manuever> p1,ArrayList<Manuever> p2){
  ArrayList<Manuever> output = new ArrayList<Manuever>();
  float tp;
  if(p1.size()<=p2.size()){
    for(int i=0; i<p1.size();i++){
      tp = floor((p2.get(i).timeStamp+p1.get(i).timeStamp)/2);
        
      if(p1.get(i).direction>p2.get(i).direction){
            output.add(new Manuever(random(p2.get(i).direction,p1.get(i).direction),tp));
      } else{
            output.add(new Manuever(random(p2.get(i).direction,p1.get(i).direction),tp));
      }
      
    }
  } else if(p2.size()<p1.size()){
    for(int i=0; i<p2.size();i++){
      tp = floor((p2.get(i).timeStamp+p1.get(i).timeStamp)/2);
        
      if(p1.get(i).direction>p2.get(i).direction){
            output.add(new Manuever(random(p2.get(i).direction,p1.get(i).direction),tp));
      } else{
            output.add(new Manuever(random(p2.get(i).direction,p1.get(i).direction),tp));
      }
    }
  }
  
  return output;
}

void checkLives(){
  boolean active = true;
  // check if all is dead
  for(int i=0; i<rocketNum; i++){
    if(!rc.get(i).dead){
      active = false;
    }
  }
  //proceed to new generation if all is dead
  if(active){
    generation++;
    newGeneration();
  }
  
}