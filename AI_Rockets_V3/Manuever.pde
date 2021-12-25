class Manuever{
  
  float timeStamp;
  float direction;
  
  Manuever(float t, float d){
    timeStamp=t;
    direction=d;
  }
  
  
  
  float getDirection(){
    return direction;
  }
  
  void replaceManv(Manuever v){
    timeStamp=v.timeStamp;
    direction=v.direction;
  }
}