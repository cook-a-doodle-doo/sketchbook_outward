Branch root;
float hoge = 1.0/5;

void setup(){
  size(1000, 800);
  root = new Branch(
      new PVector(width/2, height),
      height*hoge,
      radians(90),
      sqrt(height/5.0),
      color(random(255), random(255), random(255)));
  grow(root, height - root.len);
}

void draw(){
  drawRecurs(root);
  stop();
}

void drawRecurs(Branch b){
  if(b == null)return;
  b.draw();
  drawRecurs(b.l);
  drawRecurs(b.r);
}

void grow(Branch b, float acc){
  float radius = b.radius*4.0/5.0;
  float len    = acc*hoge;
  if(radius < 0.4)return;
  float bpx = b.bp.x+b.len*cos(b.radian);
  float bpy = b.bp.y-b.len*sin(b.radian);
  b.l = new Branch(
      new PVector(bpx, bpy),
      len,// * (random(1)+0.5),
      b.radian+radians(12),//+random(5)),
      radius,
//      color(random(255), random(255), random(255)));
      color(0x80, 0xff, 0x00));
  grow(b.l, acc-b.l.len);
  b.r = new Branch(
      new PVector(bpx, bpy),
      len,// * (random(1)+0.5),
      b.radian-radians(12),//+random(5)),
      radius,
      color(random(255), random(255), random(255)));
  grow(b.r, acc-b.r.len);
}
