PVector[] vecs;
int gon = int(random(3, 11));

void setup(){
  size(1000, 1000);
  frameRate(60);
  background(255);
}

void draw(){
  fill(0, 2);
  rect(0, 0, width, height);
  vecs = newVecs(gon);
  for(int i=0;i<30;i++){
    stroke(255.0/i+1, 100, 100);
    drawSpuare(vecs);
    vecs = nextVecs(vecs, 1 - 1*exp(-0.005*frameCount));
  }
  if(frameCount > 60*13){
    background(255);
    gon = int(random(3, 11));
    frameCount = 0;
  }
}

PVector[] newVecs(int gon){
  PVector[] nvs = new PVector[gon];
  float theta   = 2*PI/gon;
  float rad     = (width<height) ? (width/2.0) : (height/2.0);
  for(int i=0;i<gon;i++){
    nvs[i] = new PVector(width/2.0 + rad*cos(theta*i), height/2.0 + rad*sin(theta*i));
  }
  return nvs;
}

void drawSpuare(PVector[] vecs){
  int gon = vecs.length;
  for(int i=0;i<(gon-1);i++){
    line(vecs[i].x, vecs[i].y, vecs[i+1].x, vecs[i+1].y);
  }
  line(vecs[gon-1].x, vecs[gon-1].y, vecs[0].x, vecs[0].y);
}

PVector[] nextVecs(PVector[] ovs, float gap){
  int gon = ovs.length;
  PVector[] nvs = new PVector[gon];
  for(int i=0;i<(gon-1);i++){
    nvs[i] = PVector.sub(ovs[i+1], ovs[i]);
    nvs[i].mult(gap);
    nvs[i] = PVector.add(ovs[i], nvs[i]);
  }
  nvs[gon-1] = PVector.sub(ovs[0], ovs[gon-1]);
  nvs[gon-1].mult(gap);
  nvs[gon-1] = PVector.add(ovs[gon-1], nvs[gon-1]);

  return nvs;
}
