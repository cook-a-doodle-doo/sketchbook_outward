
int FRAME = 100;

void setup(){
  size(1000, 1000);
  frameRate(60);
  noFill();
}

void draw(){
  background(255);
  //float mag = (1 + 1.0/FRAME) * frameCount;
  float mag = (1 + float(frameCount)/FRAME);
  frameCount%=6*FRAME;
  scale(mag);

  strokeWeight(1/mag);
  fibonacciSpiral(width/mag/2.0, height/mag/2.0, 16);
}

void fibonacciSpiral(float xPos, float yPos, int num){
  Fibonacci fibo = new Fibonacci();
  int spiVec[][] = {{0,-1}, {1,0}, {0,1}, {-1,0}};
  for(int i=0;i<num;i++){
    rectAndArc(xPos, yPos, fibo.val(), 4-i%4);
    xPos += fibo.agoVal()*spiVec[i%4][0];
    yPos += fibo.agoVal()*spiVec[i%4][1];
    fibo.next();
  }
}

//quadrant is 1 ~ 4
void rectAndArc(float xPos, float yPos, int side, int quadrant){
  int vec[][] = {{0,-1}, {-1,-1}, {-1,0}, {0,0}};
  quadrant--;
  rect(xPos+side*vec[quadrant][0], yPos+side*vec[quadrant][1], side, side);
  arc (xPos, yPos, side*2, side*2, -(quadrant+1)*PI/2.0, -(quadrant)*PI/2.0);
}

color myColor(){
  float c = random(80, 255);
  switch(int(random(0,6))){
    case 0:
      return color(c, 255, 255);
    case 1:
      return color(255, c, 255);
    case 2:
      return color(255, 255, c);
    case 3:
      return color(255, c, c);
    case 4:
      return color(c, 255, c);
    default:
      return color(c, c, 250);
  }
}
