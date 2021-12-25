//DNA

class ManueverSet{
  
  ArrayList<Manuever> manuever;
  
  float geneFitness;
  
  ManueverSet(Manuever initManuever){
    manuever=new ArrayList<Manuever>();
    manuever.add(initManuever);
    geneFitness=0;
  }
  float getFitness(){
    return geneFitness;
  }
  
  void setManvFitness(float f){
    geneFitness=f;
  }
  
  void addManuever(Manuever newManv){
    manuever.add(newManv);
  }
  
  void replaceSet(ArrayList<Manuever> rep){
    manuever.clear();
    manuever=rep;
    //geneFitness=0;
  }
  
}