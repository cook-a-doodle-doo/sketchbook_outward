int WIDTH_MARGIN  = 10;
int HEIGHT_MARGIN = 10;

void setup(){
  size(1000, 1000);
  background(255);
  frameRate(40/60.0);
}

void draw(){
  int numX = int(random(5, 50));
  int numY = int(random(5, 50));
  float threshold = random(10,80);
  println("numX:" + numX);
  println("numY:" + numY);
  println("thre:" + threshold + "\n");
  divSquare(WIDTH_MARGIN, HEIGHT_MARGIN, numX, numY, width-2*WIDTH_MARGIN, threshold);
}


void divSquare(float xPos, float yPos ,int numX, int numY, float edge, float threshold){
  float mag_w  = edge/numX;
  float mag_h  = edge/numY;
  float edge_w;
  float edge_h;
  int tmp;
  int a = numX;
  int b = numY;

  if(numX == numY){
    fill(myColor());
    rect(xPos, yPos, edge, edge);
    return;
  }

  for(int i=0;;i++){
    tmp  = a % b;
    edge_w = mag_w*b;
    edge_h = mag_h*b;
    for(int j=0;j<a/b;j++){
      //draw rect or recursive call
      if(edge_w < threshold || edge_h < threshold){
        fill(myColor());
        rect(xPos, yPos, edge_w, edge_h);
      }else{
        divRect(xPos, yPos, numY, numX, edge_w, threshold);
      }

      if(i%2 == 0){
        xPos += edge_w;
      }else{
        yPos += edge_h;
      }
    }
    if(tmp == 0)break;
    a = b;
    b = tmp;
  }
}


void divRect(float xPos, float yPos ,int numX, int numY, float wSize, float threshold){
  float mag  = wSize/numX;
  float edge;
  int tmp;
  int a = numX;
  int b = numY;

  if(numX == numY){
    fill(myColor());
    rect(xPos, yPos, wSize, wSize);
    return;
  }


  for(int i=0;;i++){
    tmp  = a % b;
    edge = mag*b;
    for(int j=0;j<a/b;j++){
      if(edge < threshold){
        fill(myColor());
        rect(xPos, yPos, edge, edge);
      }else{
        divSquare(xPos, yPos, numX, numY, edge, threshold);
      }
      if(i%2 == 0){
        xPos += edge;
      }else{
        yPos += edge;
      }
    }
    if(tmp == 0)break;
    a = b;
    b = tmp;
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
