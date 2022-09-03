color green = #63E06B;
color dgreen = #217424;
color yellow = #FFD05E;
color blue = #40B0E2;
color white = #FFFFFF;
color sun = #FDB813;

int x1 = -200; // big hills
int x2 = 200;
int x3 = 600;

int x4 = 400; // nuvem

int x5 = -200; // small hills
int x6 = 0;
int x7 = 200;
int x8 = 400;
int x9 = 600;
int x10 = 800;
int x11 = 1000;

float sunY = 200;

void night(){
  if(mousePressed == true){
    blue = #0c1445;
    sun = #dcdcdc;
  }
  else{
    blue = #40B0E2;
    sun = #FDB813;
  }
}
void make(){

  background(blue);
  noStroke();
  
  pushMatrix();
  fill(white);
  translate(x4,50,0);
  sphere(50);
  translate(0,50,0);
  sphere(50);
    translate(40,0,0);
  sphere(50);
  translate(-80,0,0);
  sphere(50);
  popMatrix();
   
  
  pushMatrix();
  translate(530,690,-200);
  fill(yellow); //ground
  box(900,300,600);
  popMatrix();
  
  pushMatrix();
  fill(sun);
  translate(mouseX,sunY,-150);
  sphere(60);
  
  popMatrix();
  

  
  
  
  //move cloud
  x4 = x4 + 1;
  if (x4 == 1280) x4 = -200;
  
  //move back hills
  x1 = x1 + 2;
  x2 = x2 + 2;
  x3 = x3 + 2;
  
    //move hills
  x5 = x5 + 3;
  x6 = x6 + 3;
  x7 = x7 + 3;
  x8 = x8 + 3;
  x9 = x9 + 3;
  x10 = x10 + 3;
  x11 = x11 + 3;

  if (x1 == 1280) x1 = -200;
  if (x2 == 1280) x2 = -200;
  if (x3 == 1280) x3 = -200;
  if (x5 > 1280) x5 = -200;
  if (x6 > 1280) x6 = -200;
  if (x7 > 1280) x7 = -200;
  if (x8 > 1280) x8 = -200;
  if (x9 > 1280) x9 = -200;
  if (x10 > 1280) x10 = -200;
  if (x11 > 1280) x11 = -200;

  
}
