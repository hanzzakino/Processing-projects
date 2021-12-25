
class Link {
  
  boolean loop; 
  String LinkID;
  Node a, b;
  float LinkWeight;
  
  Link(Node A, Node B){
    loop = false;
    a = A; 
    b = B;
    LinkID = B.nodeID + A.nodeID;
    
    LinkWeight = PVector.dist(A.loc, B.loc);
  }
  
  void isLoop(){
    loop = true;
  }
  
  
  void showLink(){
    
    line(a.loc.x, a.loc.y, b.loc.x, b.loc.y);
    
  }
  
  
  
  
}
