

class RocketPop {
  
  int population;
  int generation;
  
  ArrayList<Rocket> rockets = new ArrayList<Rocket>();

  ArrayList<ArrayList<Manuever>> PARENTSET= new ArrayList<ArrayList<Manuever>>();
  
  int coInt;
  
  RocketPop(int popCount){
   population=popCount;
   for(int i=0; i<population; i++){
     rockets.add(new Rocket(width/2, height-70));
   }
  }
  
  void evolve(){
    float tm;
    for(int i=0; i<population; i++){
    tm=floor(rockets.get(i).timeOfDeath);
   if(tm!=0) tm = floor(random(tm-20,tm-5));
    if(!rockets.get(i).doneAlgo){
   rockets.get(i).addManv(new Manuever(random(PI/2,3*(PI/2)),tm));
   // rockets.get(i).addManv(new Manuever(random(0,TWO_PI),tm));
   
   }
   }
  }
  
  void show(){
    for(int i=0; i<population; i++){
     rockets.get(i).show();
   }
  }
  
  
  void move(float time, Obstacle o1[], Target t1){
    for(int k =0; k<o1.length;k++){
      
      
      for(int i=0; i<population; i++){
   
    
    rockets.get(i).Manuevers(time);//do set of Manuevers
    
    rockets.get(i).update();//move rockets
   
    if(!rockets.get(i).dead) rockets.get(i).show();//only show rockets if it's alive
    
    if(rockets.get(i).distToTarget(t1)<t1.size/2){
      rockets.get(i).doneAlgo=true;
      rockets.get(i).pathTime=time;
    }
    
    if(rockets.get(i).hit(o1[k])){
       rockets.get(i).kill(time,t1);
    }
    
  }
      
      
      
    }
  }
  
  void findBestPath(){
    int pss=0;
    float tmp=0;
    for(int i=0; i<population; i++){
      if(rockets.get(i).pathTime>tmp){
      tmp=rockets.get(i).pathTime;
      pss=i;
      }
    }
    for(int j=0; j<population; j++){
      if(j==pss){
      rockets.get(j).bestPath=true;
      } else{
        rockets.get(j).bestPath=false;
      }
    }
    
  }
  
  
  
  void resetRockets(){
    for(int i=0; i<population; i++){
      rockets.get(i).reset(width/2,height-70);
  }
  }
     
  
  void newGeneration(){
    int plen=PARENTSET.size() - 1;
     int rand=0;
     int rand2=0;
    for(int i=0; i<population; i++){
     rand=(int) random(0,plen);
     rand2=(int) random(0,plen);
    //rockets.get(i).setManuever(PARENTSET.get(rand),PARENTSET.get(rand).size());
    if(rand==0) rand=1;
    
    if(!rockets.get(i).doneAlgo){
    //Parent Picking
    //rockets.get(i).setManuever(crossover(PARENTSET.get(rand),secondParent(PARENTSET.get(rand))),coInt);
    rockets.get(i).setManuever(crossover(PARENTSET.get(rand2),PARENTSET.get(rand)),coInt);
    }
    }
    evolve();
    generation++;
  }
  
  ArrayList<Manuever> secondParent(ArrayList<Manuever> par1){
    int lastpos=0;
    int posc=0;
    for(int i=0;i<PARENTSET.size();i++){
      if(PARENTSET.get(i).equals(par1)){
         lastpos=i;
         posc++;
      }
    }
    if((lastpos-posc)<=0){
      return PARENTSET.get(lastpos);
    }
    return PARENTSET.get(lastpos-posc);
  }
  
  
  
  
  void calcFitness(){
  float minProxToTarget=0;
  float max=0;
  
  int temp=0;
  for(int i=0; i<population; i++){
    
   if(rockets.get(i).dTarget>max){
     max=rockets.get(i).dTarget;
   }
   if(rockets.get(i).dTarget<minProxToTarget){
     minProxToTarget=rockets.get(i).dTarget;
     temp=i;
   }
  }
 
  for(int i=0; i<population; i++){
    if(rockets.get(i).dTarget>30){
      rockets.get(i).geneProbability=map(rockets.get(i).dTarget,minProxToTarget,max,10,0);
    } 
    if(rockets.get(i).doneAlgo){
      rockets.get(i).geneProbability=12;
    }
  }
  
  
 
  for(int i=0; i<population; i++){
   if((int)rockets.get(i).geneProbability>0){
     for(int j=0; j<(int)rockets.get(i).geneProbability; j++){
      
      PARENTSET.add(rockets.get(i).thisManv);
    }
  }
  }
  }
  
  

  
  float doneAlgoCount(){
    float c=0;
    for(int i=0;i<population;i++){
      if(rockets.get(i).doneAlgo){
        c++;
      }
    }
    return c;
  }
  
  
  
  
  ArrayList<Manuever> ncrossover(ArrayList<Manuever> p1,ArrayList<Manuever> p2){
  ArrayList<Manuever> outpt = new ArrayList<Manuever>();
  float dir,tme;
  if(p1.size()>p2.size()){
    for(int i=0; i<p1.size(); i++){
    
    if(i<p2.size()){
      dir=(p1.get(i).direction+p2.get(i).direction)/2;
      tme=(p1.get(i).timeStamp+p2.get(i).timeStamp)/2;
      outpt.add(new Manuever(dir,tme));
    }else{
      outpt.add(p1.get(i));
    }
    }
  }else{
    for(int i=0; i<p2.size(); i++){
    
    if(i<p1.size()){
      dir=(p1.get(i).direction+p2.get(i).direction)/2;
      tme=(p1.get(i).timeStamp+p2.get(i).timeStamp)/2;
      outpt.add(new Manuever(dir,tme));
    }else{
      outpt.add(p2.get(i));
    }
  }
  }
  coInt=outpt.size();
  return outpt;
  }
  
  
  
  
  
  
  
  ArrayList<Manuever> crossover(ArrayList<Manuever> p1,ArrayList<Manuever> p2){
  ArrayList<Manuever> output = new ArrayList<Manuever>();
  float tp;
  if(p1.size()<=p2.size()){
    for(int i=0; i<p1.size();i++){
      tp = floor((p1.get(i).timeStamp+p2.get(i).timeStamp)/2);   
      if(p1.get(i).direction>p2.get(i).direction){
            output.add(new Manuever(random(p2.get(i).direction,p1.get(i).direction),tp));
      } else{
            output.add(new Manuever(random(p1.get(i).direction,p2.get(i).direction),tp));
      }
      
    }
    }else{
    for(int i=0; i<p2.size();i++){
       tp = floor((p1.get(i).timeStamp+p2.get(i).timeStamp)/2);   
    if(p1.get(i).direction>p2.get(i).direction){
            output.add(new Manuever(random(p2.get(i).direction,p1.get(i).direction),tp));
      } else{
            output.add(new Manuever(random(p1.get(i).direction,p2.get(i).direction),tp));
      }
    }
   }
   coInt=output.size();
   return output;
   }

}