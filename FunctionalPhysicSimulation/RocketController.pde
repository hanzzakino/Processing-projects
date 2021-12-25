
class RocketController {
  
  final float gravity = -9.8;
  
  HashMap<Float, float[]> manuevers;
  float ManueverTime = 0;
  
  //<timeStamp , [duration,percentage]>
  
  RocketController(){
    manuevers = new HashMap();
  }
  RocketController(HashMap<Float, float[]> mnv){
    manuevers = mnv;
  }
  
  float fKey=0;
  float currentTime = 0;
  float thrustControl(float t){
    if(t>=fKey && t<=(fKey - ManueverTime)){
      return manuevers.get(fKey)[1];
    }
    return 0;
  }
  
  
  float getAirborneTime(float Alt, float initVel, float acc){
    return ((-initVel + sqrt((initVel*initVel)+(2*acc*Alt)))/acc);
  }
  
  void setManueverTime(float Alt, float initVel, float acc){
    float aTime = ((-initVel + sqrt((initVel*initVel)+(2*acc*Alt)))/acc);
    if(aTime>7){
      ManueverTime = 7;
    } else {
      ManueverTime = aTime;
    }
  }
  
  
  HashMap<Float, float[]> calculatedManuever(float AirborneTime, float initAltitude, float initVel){
    HashMap<Float, float[]> output = new HashMap();
    
    float startTime = (AirborneTime-ManueverTime);
    
    float fvel = ((startTime)*(-gravity)) + initVel;
    float alt = (initAltitude - (((-gravity)*((startTime)*(startTime)))/2));
    
    float acc = (fvel*fvel)/(2*alt);
       
    println(fvel);
    println(alt);
    println(acc);
    
    float newManueverTime = round(abs(fvel/acc));
    println(newManueverTime);
    
    float[] accDur = {newManueverTime, acc-gravity};
    output.put(AirborneTime-ManueverTime,accDur);
    fKey = AirborneTime-ManueverTime;
    return output;
  }
  
  
  
  
 
  
}
