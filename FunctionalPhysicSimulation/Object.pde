
class Object{
  
  final float size = 4;
  final float bounce = 0;
  
  float yThrusterForce;
  float xThrusterForce;
  
  PVector loc,acc;
  float x0,y0;
  float vx0, vy0;
  
  float vx,vy;
  float altitude;
  
  float tSub = 0;
  float Global_T;
  
  
  
  Object(float xx, float yy){
    x0 = xx;
    y0 = yy;
    vx0 = 0;
    vy0 = 0;
    vx = 0;
    vy = 0;
    yThrusterForce = 0;
    xThrusterForce = 0;
    Global_T = 0;
    loc  = new PVector(x0,y0);
    acc = new PVector(0,9.8);
    altitude = height - yy;
  }
  
  //applying forces reset the LOC function initial variables
  void applyForce(float ax, float ay){
    tSub = Global_T;
    y0 = loc.y;
    x0 = loc.x;
    vx0 = vx;
    vy0 = vy;
    acc = new PVector(ax,-(ay+gravity));
  }
  
  void LOC(float t){
    // function time needs to be 0 in each force application
    // That's why Current Time needs to be subtracted by the final time of the last function
    t -= tSub;
    
    // Instantaneous velocity
    vx = vx0 + (acc.x*t);
    vy = vy0 + (acc.y*t);
    
    //location vector function
    float lx = x0 + (vx0*t) + ((acc.x*t*t)/2);
    float ly = y0 + (vy0*t) + ((acc.y*t*t)/2);
    loc = new PVector(lx,ly);
    
    altitude = height - loc.y;
  }
  
  void manualControl(char k){
    if(keyPressed){
        if(k == 'w'){
        yThrusterForce = 30;
        groundhitSet = false;
      } else if(k == 's'){
        yThrusterForce = -30;
      } else if(k == 'a'){
        xThrusterForce = -30;
      } else if(k == 'd'){
        xThrusterForce = 30;
      }
    } else {
      xThrusterForce = 0;
      yThrusterForce = 0;
    }
  }
  
  
  boolean groundhitSet = false;
  float groundHitVel = 0;
  
  void setBoundary(float bottom,float left, float right){
    strokeWeight(2);
    stroke(255);
    line(left,bottom,right,bottom);
    line(left,bottom,left,-100000000);
    line(right,bottom,right,-100000000);
    
    if(loc.y >= bottom){
      
      if(!groundhitSet){
        groundHitVel = vy;
        groundhitSet = true;
      }
      
      loc.y = bottom;
      vy0 *= -bounce;
      vy *= -bounce;
      applyForce(0,9.8);
      
    } else if(loc.x <= left){
      loc.x = left;
      vx0 *= -bounce;
      vx *= -bounce;
      applyForce(0,9.8);
    } else if(loc.x >= right){
      loc.x = right;
      vx0 *= -bounce;
      vx *= -bounce;
      applyForce(0,0);
    }
  }
  
  
  void update(float t){
    applyForce(xThrusterForce,yThrusterForce);
    Global_T = t;
    LOC(t);
  }
  
  void show(){
    fill(255);
    strokeWeight(size);
    stroke(255);
    line(loc.x,loc.y-((size/2)+1),loc.x,loc.y-(size*5));
  }
  
  void showMetrics(){
    textAlign(LEFT);
    textSize(12);
    fill(0,200,255);
    text("Altitude: "+ round(altitude)+ " m", 10, height - 130);
    fill(0,255,55);
    text("Y-Acceleration: "+(-acc.y)+ " m/s^2",10,height - 50);
    text("X-Acceleration: "+(acc.x)+ " m/s^2", 10,height - 70);
    fill(0,255,200);
    text("Y-Velocity: "+(-vy)+ " m/s", 10,height - 90);
    text("X-Velocity: "+vx+ " m/s", 10,height - 110);
    fill(0,255,255);
    
    fill(0,200,255);
    text("Time: "+((float) millis()/1000)+ " s", 10, 20);
    fill(250,250,255);
    text("FPS: "+round(frameRate), (width)-60, 20);
    
    
    float redTemp = map(groundHitVel,0,20,0,255);
    float greenTemp = map(groundHitVel,0,20,255,0);
    fill(redTemp,greenTemp,0);
    text("Touchdown Velocity: "+(groundHitVel) + " m/s", 10, height - 30);
    //text("Thrust Level: "+(thrustPercentage*100), 10,height - 130);
    
  }

}
