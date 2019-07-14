float step = 2*PI / 60.0;
float CON  = 1.02;

void setup(){
  size(1000, 1000);
}

void draw(){
  float rad = frameCount * step;
  float bpx = width /2.0 + pow(CON, rad)     *cos(rad);
  float bpy = height/2.0 + pow(CON, rad)     *sin(rad);
  float epx = width /2.0 + pow(CON, rad+step)*cos(rad + step);
  float epy = height/2.0 + pow(CON, rad+step)*sin(rad + step);
  line(bpx, bpy, epx, epy);
}

