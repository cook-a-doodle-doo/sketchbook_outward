size(1000, 1000);

int WIDTH_MARGIN  = 10;
int HEIGHT_MARGIN = 10;
int WIDTH_MAX  = width  - 2*WIDTH_MARGIN;
int HEIGHT_MAX = height - 2*HEIGHT_MARGIN;

int w = 7;
int h = 9;

float mag_w = float(WIDTH_MAX) / w;
float mag_h = float(HEIGHT_MAX)/ h;

float mag;
float xPos;
float yPos;
float squLen;

if(mag_w < mag_h){
//if(WIDTH_MAX*h < HEIGHT_MAX*w){
  mag    = mag_w;
  xPos   = WIDTH_MARGIN;
  yPos   = (height - h*mag)/2.0;
}else{
  mag    = mag_h;
  xPos   = (width  - w*mag)/2.0;
  yPos   = HEIGHT_MARGIN;
}

//rect(xPos, yPos, mag*w, mag*h);

int tmp;
for(int i=0;;i++,i%=2){
  tmp = w % h;
  println(i + ":(w:" + w + ", h:" + h + ")");
  squLen = mag*h;
  for(int j=0;j<w/h;j++){
    rect(xPos,yPos, squLen, squLen);
    if(i==0){
      xPos += squLen;
    }else{
      yPos += squLen;
    }
  }
  if(tmp == 0)break;
  w = h;
  h = tmp;
}
println("最大公約数" + h);

/*

const int width


void draw(){

}
*/
