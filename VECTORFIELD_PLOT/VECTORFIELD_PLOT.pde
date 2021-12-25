

float square = 500;
float half_sqr = square/2;
int scale_px = 25;
float step = 0.01;
float vfStep = 0.5;
float lsc = 1;

void setup(){
  size(500,500); 
  println(half_sqr/scale_px);
}

float ct = 0;
void draw(){  
  
  background(255);
  translate(square/2, square/2);
  fill(0); stroke(0);
  show_axis();
  //show_curve_gx();
  //integrate_gx(ct,0,4);
  show_vectorField();
 
   ct++;
}

void integrate_gx(float s, float xa, float xb){
  stroke(0,70);
  fill(0,0,255,100);
  
  float dx = (xb - xa) / s;
  
  for(float x = xa; x <= xb && x+dx <= xb; x = x + dx){
     
      quad(x*scale_px,g(x)*scale_px,x*scale_px,0*scale_px,(x+dx)*scale_px,0*scale_px,(x+dx)*scale_px,g(x)*scale_px);
    
  }
  
}

float g(float x){
  return -( sqrt(36-(x*x))   );
}
float f(float x){
  return -(sin(x)*x);
}

void show_curve_fx(){
  fill(0); stroke(0,10,150);
  for(float x=-half_sqr/scale_px; x<=(half_sqr/scale_px); x+=step){
    line((x-step)*scale_px,f(x-step)*scale_px,x*scale_px,f(x)*scale_px);
    point(x*scale_px,f(x)*scale_px);  
  }
}

void show_vectorField(){
  float x1,y1,A,len;
  
  stroke(13,122,252,200);
  
    for(float y=-half_sqr/scale_px; y<=(half_sqr/scale_px); y+=vfStep){
      
      for(float x=-half_sqr/scale_px; x<=(half_sqr/scale_px); x+=vfStep){
        //textSize(8);
          //text(x*scale_px+","+-y*scale_px + "\n" + x + "," + y,x*scale_px,-y*scale_px);
             ellipse(x*scale_px,-y*scale_px,2,2);  
             
             
             //V >> <x1,y1>
             
             x1 = pow(y,3) - pow(0.51*y,2) - (y*2) + 8;
             y1 = - pow(x,3) + pow(0.51*x,2) + (x*2) - 8;
             
           
            
             
            A = atan2(-y1*scale_px+y*scale_px,x1*scale_px-x*scale_px);
            
            len = sqrt(pow(-y1*scale_px+y*scale_px,2) + pow(x1*scale_px-x*scale_px,2));
            
            //
            len = 10;
             
             line(x*scale_px,-y*scale_px,x*scale_px + (len * lsc)*cos(A) ,-y*scale_px + (len * lsc)*sin(A));
             
      }
    }
      
}

void show_curve_gx(){
  fill(0); stroke(150,10,0);
  for(float x=-half_sqr/scale_px; x<=(half_sqr/scale_px); x+=step){
    line((x-step)*scale_px,g(x-step)*scale_px,x*scale_px,g(x)*scale_px);
    point(x*scale_px,g(x)*scale_px);  
  }
}

void show_axis(){
  fill(0); stroke(0);
  textSize(15);
  line(-square/2,0,square/2,0);
  text("x",(square/2)-17,17);
  line(0,-square/2,0,square/2);
  text("y",17,(square/2)-17);
  for(int i=scale_px; i<square; i+=scale_px){
    line(i,-3,i,3); line(-i,-3,-i,3); line(-3,i,3,i); line(-3,-i,3,-i);
  }
}
