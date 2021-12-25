

ArrayList<Node> NodeSet;
kruskalAlgorithm ALGO = new kruskalAlgorithm();
int n = 4;

void setup(){
  size(500,500); 
  
  NodeSet = new ArrayList<Node>();
  
  
   background(0); fill(255); stroke(0,255,0);  //default colors
   strokeWeight(3);
  

    for(int i = 0; i < n; i++){
      NodeSet.add(new Node(500));
      NodeSet.get(i).setNodeLabel(String.valueOf(i+1));
    }
  
  
    
    
  
  ALGO.createLinkSet(NodeSet);
  ALGO.optimalpath(n);
  ALGO.showAllLink();
  ALGO.showOpLink();
  ALGO.printLinkSet();
  
  
  for(int i = 0; i < n; i++){
    NodeSet.get(i).show_node();
  }
 
}
