

class kruskalAlgorithm{
  

  HashMap<Float, Link> LinkSet;
  
  float[] linkValues;
  
  String TEMPORARYTEST;
  
  
  void createLinkSet( ArrayList<Node> NodeSet_){
    LinkSet = new HashMap<Float, Link>();
    int valIndex = 0;
  for(int i = 0; i < NodeSet_.size(); i++){
      
  n2: for(int j = 0; j <  NodeSet_.size(); j++){
        if(i==j) break n2;
        
        for(Link k : LinkSet.values()){
          if(k.LinkID.contains(NodeSet_.get(i).nodeID) && k.LinkID.contains(NodeSet_.get(j).nodeID)){  //If nodeLinkset already has both nodes linked the loop continues to next pair
            break n2;
          }
        }
        
        LinkSet.put( PVector.dist(NodeSet_.get(i).loc, NodeSet_.get(j).loc), new Link(NodeSet_.get(i),NodeSet_.get(j)));
      }  
      
    }
    
      linkValues = new float[LinkSet.size()];
    
      int c = 0;
      for(float i : LinkSet.keySet()){
        linkValues[c] = i;
        c++;
      }
      
      linkValues = sort(linkValues);
    
  }
  
  ArrayList<Link> OP_PATH;
  
  void optimalpath(int n){
    n = n-1;// number of minimal link to connect all
    OP_PATH = new  ArrayList<Link>();
    boolean complete = false;
    for(int i = 0; !complete;i++){
      if(willLoop(LinkSet.get(linkValues[i])) && OP_PATH.size()!=0){ 
            continue;
      }  else {
            OP_PATH.add(LinkSet.get(linkValues[i]));
      }
      if(OP_PATH.size()==n) complete = true;
    }
  }
  

  boolean willLoop(Link L){    //Works well on 4-nodes below only
    String temp = "";
    String out = "";
    
    StringBuilder nOUT = new StringBuilder();
    

    for(int i = 0; i < OP_PATH.size(); i++){
      temp = "";
 l1:  for(int j = 0; j < OP_PATH.size(); j++){
        if(j==i) continue l1;
        temp = temp + OP_PATH.get(j).LinkID;
      }
      
      if(!temp.contains( String.valueOf( OP_PATH.get(i).LinkID.charAt(0))     )){
         out = out + String.valueOf( OP_PATH.get(i).LinkID.charAt(0));
         nOUT.append(String.valueOf( OP_PATH.get(i).LinkID.charAt(0)));
      } else if(!temp.contains(    String.valueOf( OP_PATH.get(i).LinkID.charAt(1))   )){
         out = out + String.valueOf( OP_PATH.get(i).LinkID.charAt(1));
         nOUT.append(String.valueOf( OP_PATH.get(i).LinkID.charAt(1)));
      }
     
    }
   
    
     
     try {
     if(  Integer.parseInt(nOUT.toString()) < Integer.parseInt(nOUT.reverse().toString())  ) nOUT.reverse();
     } catch(Exception e){
     
     }
     
     TEMPORARYTEST = "|"+nOUT.toString()+"|";
    return nOUT.toString().equals(L.LinkID);
    
  }
  
  
  
  
  
  
  
  void printLinkSet(){
    println("All Link Connection");
    println("Link ID:        Link Weight:");
    for(Link i : LinkSet.values()){
      println(i.LinkID + "         >>>  " + i.LinkWeight);
    }
    /*
    println("\n\n\n" + LinkSet.size()+"\n\n\n");
    
    for(float i : linkValues){
      println(i);
    }
    */
    println("\n");
    
    println("Optimal Link Connection");
    println("Link ID:        Link Weight:");
    for(Link l : OP_PATH){
      println(l.LinkID + "         >>>  " + l.LinkWeight);
    }
    
    println(TEMPORARYTEST);
    
  }
  
  
  void showOpLink(){
    stroke(0,255,0); strokeWeight(3);
    for(Link l : OP_PATH){
      l.showLink();
    }
  }
  
  void showAllLink(){
    stroke(255,0,0,150); strokeWeight(2);
    for(Link g : LinkSet.values()){
      g.showLink();
    }
  }

} 
