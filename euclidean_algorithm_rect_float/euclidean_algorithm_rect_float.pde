int WIDTH_MARGIN  = 10;
int HEIGHT_MARGIN = 10;

void setup(){
  size(1000, 1000);
  background(255);
  frameRate(40/60.0);
}

void draw(){
  background(255);
  float threshold = random(2,8);
  float w = random(5, 1000);
  float h = random(5, 1000);
  println("w:" + w);
  println("h:" + h);
  println("ratio:" + w/h);
  println("thre:" + threshold + "\n");

   float mw = float(width -WIDTH_MARGIN *2)/w;
   float mh = float(height-HEIGHT_MARGIN*2)/h;

   float xPos = WIDTH_MARGIN;
   float yPos = HEIGHT_MARGIN;
   if(mw<mh){
     w*=mw;
     h*=mw;
     yPos = (height-h)/2;
   }else{
     w*=mh;
     h*=mh;
     xPos = (width-w)/2;
   }
 // w = (width-2*WIDTH_MARGIN)
  divRect_float(xPos, yPos, w, h, threshold);
}

void divRect_float(float xPos, float yPos, float w, float h, float threshold){
  float tmp;
  if(w == h){
    fill(myColor());
    rect(xPos,yPos,w,h);
    return;
  }

  for(int i=0;;i++){
    tmp = w%h;
    if(w<threshold || h<threshold){
      fill(myColor());
      if(i%2 == 0){
        rect(xPos, yPos, w, h);
      }else{
        rect(xPos, yPos, h, w);
      }
      return;
    }
      for(int j=0;j<int(w/h);j++){
        fill(myColor());
        rect(xPos, yPos, h, h);
        if(i%2 == 0){
          xPos+=h;
        }else{
          yPos+=h;
        }
      }
    w = h;
    h = tmp;
  }
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
