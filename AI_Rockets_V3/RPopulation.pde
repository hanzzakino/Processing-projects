

class RPopulation{
  
  boolean allDead;
  
  ArrayList<Rocket> rockets;
  
  ArrayList<ManueverSet> ParentSet;//not created
  
  RPopulation(float xx, float yy, float p){
    rockets = new ArrayList<Rocket>();
    for(int i=0; i<p; i++){
      rockets.add(new Rocket(xx,yy));
      rockets.get(i).setRocketNum(i);
    }
    allDead=false;
  }
  
  
  void resetRockets(){
    for(int i=0; i<rockets.size(); i++){
      rockets.get(i).reset();
    }
  }
  
  void initParents(){
    ParentSet = new ArrayList<ManueverSet>();
    for(int i=0; i<rockets.size(); i++){
      for(int j=0; j<(int) rockets.get(i).manueverSet.geneFitness; j++){
        ParentSet.add(rockets.get(i).manueverSet);
      }
    }
  }
  
  ArrayList<Manuever> crossover(ArrayList<Manuever> p1, ArrayList<Manuever> p2){
    ArrayList<Manuever> output = new ArrayList<Manuever>();
    
    ////////
    float tp;
    if(p1.size()<=p2.size()){
    for(int i=0; i<p1.size();i++){
      tp = floor((p1.get(i).timeStamp+p2.get(i).timeStamp)/2);   
      if(p1.get(i).direction>p2.get(i).direction){
            output.add(new Manuever(tp,random(p2.get(i).direction,p1.get(i).direction)));
      } else{
            output.add(new Manuever(tp, random(p1.get(i).direction,p2.get(i).direction)));
      }
      
    }
    }else{
    for(int i=0; i<p2.size();i++){
       tp = floor((p1.get(i).timeStamp+p2.get(i).timeStamp)/2);   
    if(p1.get(i).direction>p2.get(i).direction){
            output.add(new Manuever(tp,random(p2.get(i).direction,p1.get(i).direction)));
      } else{
            output.add(new Manuever(tp,random(p1.get(i).direction,p2.get(i).direction)));
      }
    }
   }
   ////////////
    
    return output;
  }
  
  void inheritParents(){
    int tmp1 = 0;
    int tmp2 = 0;
    for(int i=0; i<rockets.size(); i++){
      if(rockets.get(i).reachedTarget) continue;
      tmp1=(int) floor(random(0,ParentSet.size()));
      tmp2=(int) floor(random(0,ParentSet.size()));
      rockets.get(i).manueverSet.replaceSet(crossover(ParentSet.get(tmp1).manuever,ParentSet.get(tmp2).manuever));
    //  rockets.get(i).manueverSet.replaceSet(ParentSet.get(tmp1).manuever);
    }
  }
  
  void calculateFitness(){
    float temp;
    float nearestVal=0;
    float farthestVal=0;
    int maxI=0;
    for(int i=0; i<rockets.size(); i++){
      if(rockets.get(i).nearestDistToTarget>farthestVal){
        farthestVal=rockets.get(i).nearestDistToTarget;
      }
    }
    nearestVal=farthestVal;
    for(int i=0; i<rockets.size(); i++){
      if(rockets.get(i).nearestDistToTarget<nearestVal){
        nearestVal=rockets.get(i).nearestDistToTarget;
        maxI=i;
      }
    }
    for(int i=0; i<rockets.size(); i++){
      if(rockets.get(i).reachedTarget){
        rockets.get(i).manueverSet.setManvFitness(175);
        continue;
      }
      temp = map(rockets.get(i).nearestDistToTarget,nearestVal,farthestVal,100,-50);
      rockets.get(i).manueverSet.setManvFitness(floor(temp));
    }
  }
  
  void newGeneration(){
    
    calculateFitness();
    initParents();
    
    //test
    
    
    inheritParents();
    
    //test
    // replace timeOfDeath of each rocket based on their parents in inheritParents
   evolveRockets();
    allDead=false;
    resetRockets();
  }
  
  void checkLives(){
    boolean dead = true;
    for(int i=0; i<rockets.size(); i++){
      if(rockets.get(i).isAlive){
        dead = false;
        break;
      }
    }
    allDead=dead;
  }
  
  int ev=0;
  
  
  void evolveRockets(){
     for(int i=0; i<rockets.size(); i++){
      rockets.get(i).evolve();
    }
    ev++;
  }
  
  float successRate(){
    float sn=0;
    for(int i=0; i<rockets.size(); i++){
      if(rockets.get(i).reachedTarget) sn++;
    }
    return 100*(sn/((float)rockets.size()));
  }
   
   
  void move(float t, Target tr,ArrayList<Obstacle> obstac){
     for(int i=0; i<rockets.size(); i++){
      
      rockets.get(i).move(t,tr,obstac);
    }
  }
  
  void show(){
     for(int i=0; i<rockets.size(); i++){
      rockets.get(i).show();
    }
  }
  
}