PVector[] vecs = new PVector[4];

void setup(){
  size(1000, 1000);
  frameRate(5);
}

void draw(){
  background(255);
  resetVec(vecs);
  for(;;){
    drawSpuare(vecs);
    vecs = nextVecs(vecs, 0.5/(frameCount+1));
    if(PVector.dist(vecs[1], vecs[0]) < 10)break;
  }
}

void resetVec(PVector[] vecs){
  vecs[0] = new PVector(10,       10);
  vecs[1] = new PVector(width-10, 10);
  vecs[2] = new PVector(width-10, height-10);
  vecs[3] = new PVector(10,       height-10);
}

void drawSpuare(PVector[] vecs){
  for(int i=0;i<3;i++){
    line(vecs[i].x, vecs[i].y, vecs[i+1].x, vecs[i+1].y);
  }
  line(vecs[3].x, vecs[3].y, vecs[0].x, vecs[0].y);
}

PVector[] nextVecs(PVector[] ovs, float gap){
  PVector[] nvs = new PVector[4];
  for(int i=0;i<3;i++){
    nvs[i] = PVector.sub(ovs[i+1], ovs[i]);
    nvs[i].mult(gap);
    nvs[i] = PVector.add(ovs[i], nvs[i]);
  }
  nvs[3] = PVector.sub(ovs[0], ovs[3]);
  nvs[3].mult(gap);
  nvs[3] = PVector.add(ovs[3], nvs[3]);

  return nvs;
}
