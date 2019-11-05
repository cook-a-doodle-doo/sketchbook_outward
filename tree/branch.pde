class Branch {
  PVector bp;
  float len;
  float radian;
  float radius;
  color c;
  Branch l;
  Branch r;

  public Branch(PVector bp, float len, float radian, float radius, color c){
    this.bp = bp;
    this.len = len;
    this.radian = radian;
    this.radius = radius;
    this.c = c;
    this.l = null;
    this.r = null;
  }
  
  public void draw(){
    strokeWeight(radius*2);
    stroke(c);
    line(bp.x, bp.y, bp.x+len*cos(radian), bp.y-len*sin(radian));
  }
}


