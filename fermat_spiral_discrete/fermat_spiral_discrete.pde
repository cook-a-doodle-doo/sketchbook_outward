
void setup(){
  size(1000, 1000);
}

void draw(){
//  float rot   = 17/55.0;
  float rot   = (1 + sqrt(5)) / 2.0;

  float theta = frameCount * 2*PI * rot;
  float r     = 30 / rot;
  r/=4;
  float rad   = sqrt(theta / 2*r);
  strokeWeight(3);
  fill(0);
  ellipse(width/2.0 + rad*cos(theta), height/2.0 + rad*sin(theta), 4, 4);
}

