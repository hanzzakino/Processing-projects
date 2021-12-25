

class Node {

  PVector loc;
  
  String nodeID;
  float nodeSize = 30;

//random node for square frame size
  Node(float fsize){
    
  loc = new PVector(random(nodeSize,fsize - nodeSize), random(nodeSize,fsize - nodeSize));
  }

//specific node location
  Node(float x, float y){
  loc = new PVector(x, y);
  }
  
  void setNodeLabel(String L){
     nodeID = L;
  }

//Show Node
  void show_node(){
   
    fill(255);
   
    
    ellipse(loc.x , loc.y, nodeSize, nodeSize);
    
    fill(100,75,255);
    textSize(20);
    text(nodeID, loc.x-5, loc.y+7);
    
   
  }




}
