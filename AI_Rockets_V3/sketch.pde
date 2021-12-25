//AI Rockets v3.1
//by Hanz Aquino
// Start date: May 1,2020
// Day 1 improved rocket Physics
// Added population class
// Day 2 Added Obstacles and Target
// ...adding auto manuever based on timeOfDeath in Rockets
// Day 3 Added Manuever to Rockets
// added evolve functions that adds new manuever based on their
//      time of death every generation
// ...adding new Generation function and Parent selection
// needs to fix Gene distribution
// Day 4 the code kinda works. There still somethings has to be
//      fix though. But it works good in the first obstacle.
// ...make complex obstacles to test the efficiency of the algorithm.
// ...Failed on complex obstacles, Discontinued project.

RPopulation population;
Target tar;

ArrayList<Obstacle> obs;
float time;

void setup(){
  size(720, 1440, OPENGL);
  population = new RPopulation(width/2,height-100,20);
  obs = new ArrayList<Obstacle>();
  time=0;
  //obs.add(new Obstacle( 0,(-50+height/2)-100,150+width/2, (height/2)-100));
  obs.add(new Obstacle( 300,(-50+height/2)+300,width-200, (height/2)+300));
  
  
  
  obs.add(new Obstacle(-50,0,0,height));
  obs.add(new Obstacle(width,0,width+50,height));
  obs.add(new Obstacle(-50,-50,width+50,0));
  obs.add(new Obstacle(-50, height,width+50, height+50));
  
  tar = new Target(width/2,100,100);
}

void draw(){
  background (0);
  fill(255);
  stroke(255);
  tar.show();
  for(int o = 0; o<obs.size(); o++){
    obs.get(o).show();
  }
  
  textSize(32);
  text("Success Rate: \n"+population.successRate()+"%", 100,100);
  
  population.move(time,tar,obs);
  population.show();
  population.checkLives();
  if(population.allDead){
    time=0;
    population.newGeneration();
  }
  
  time++;
}


void mousePressed(){
  if(population.allDead){
    time=0;
    population.newGeneration();
    println(population.ParentSet.size());
    println(population.ev);
  //population.evolveRockets();
   }
}
