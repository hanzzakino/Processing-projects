int[] pixelsrep;
int size = 80;
boolean playing;

void setup() {
  size(720,720,OPENGL);
  frameRate(60);
  pixelsrep = new int[size*size];
  playing = true;
}



void draw() {
  background(0);
  fill(255);
  drawGrid(pixelsrep);
  if(playing)pixelsrep = newGeneration(pixelsrep);
}

void drawGrid(int[] arr){
  float boxside = width/size;
  for(int i = 0; i<size; i++){
    for(int j = 0; j<size; j++){
      if(arr[(i*size)+j]==1) fill(255);
      else fill(0);
      quad(i*boxside,j*boxside , (i*boxside)+(boxside),j*boxside, (i*boxside)+(boxside),(j*boxside)+(boxside),  i*boxside,(j*boxside)+(boxside));
    }
  }
}

int[] newGeneration(int[] arr){
  int generated[] = new int[size*size];
  for(int i = 0; i<arr.length; i++){
    generated[i] = life(i, arr);
  }
  return generated;
}

int life(int i, int pixl[]){
  int alive = 0;
  int cur_width_lower = floor(i/size)*size;
  int cur_width_upper = floor(i/size)*size+(size-1);
  
  if(i+1 < pixl.length){if(pixl[i+1]==1 && (i+1) <= cur_width_upper) alive++;}
  if(i-1 > -1){if(pixl[i-1]==1 && (i-1) >= cur_width_lower) alive++;}
 
  int top_ = (cur_width_lower-size)>-1 ? (cur_width_lower-size)+(i-cur_width_lower):-1;
  int top_lower = (cur_width_lower-size);
  int top_upper = (cur_width_lower-size)+(size-1);
  if(top_>-1){
    if(top_>-1){if(pixl[top_]==1) alive++;}
    if(top_+1 < pixl.length){if(pixl[top_+1]==1 && (top_+1)<=top_upper) alive++;}
    if(top_-1 > -1){if(pixl[top_-1]==1 && (top_-1)>=top_lower) alive++;}
  }
  
  int bot_ = (cur_width_lower+size)<pixl.length ? (cur_width_lower+size)+(i-cur_width_lower):-1;
  int bot_lower = (cur_width_lower+size);
  int bot_upper = (cur_width_lower+size)+(size-1);
  if(bot_>-1){
    if(bot_>-1){if(pixl[bot_]==1) alive++;}
    if(bot_+1 < pixl.length){if(pixl[bot_+1]==1 && (bot_+1)<=bot_upper) alive++;}
    if(bot_-1 > -1){if(pixl[bot_-1]==1 && (bot_-1)>=bot_lower) alive++;}
  }
  
  if(pixl[i] == 1){
    if(alive==2 || alive==3) return 1;
    else return 0;
  } else {
    if(alive == 3) return 1;
    else return 0;
  }
}

void keyPressed(){
  if(key == ' '){
    playing = !playing;
  } else if (key == 'r'){
    for(int i = 0; i<pixelsrep.length; i++){
      pixelsrep[i] = 0;
    }
  }
}

void mousePressed(){
  pixelsrep[mouseLoc2index(mouseX,mouseY)] = 1;
}
void mouseDragged(){
  pixelsrep[mouseLoc2index(mouseX,mouseY)] = 1;
}

int mouseLoc2index(float mx, float my){
  float boxside = width/size;
  int xi = floor(mx/boxside);
  int yi = floor(my/boxside);
  return (xi*size)+yi;
}
