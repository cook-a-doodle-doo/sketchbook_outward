size(1000, 1000);
background(0);

int MARGIN  = 10;
int WH_MAX  = (width<height) ? (width-2*MARGIN) : (height-2*MARGIN);

int w = 17;
int h = 29;

float mag_w = float(WH_MAX)/ w;
float mag_h = float(WH_MAX)/ h;

int xPos = MARGIN;
int yPos = MARGIN;

float xSquLen;
float ySquLen;

int tmp;
for(int i=0;;i++){
  tmp = w % h;
  println(i + ":(w:" + w + ", h:" + h + ")");
  xSquLen = mag_w*h;
  ySquLen = mag_h*h;
  for(int j=0;j<w/h;j++){
    switch(int(random(0,3))){
      case 0:
        fill(255, 255*exp(-0.2*i), 255*exp(-0.2*i));
        break;
      case 1:
        fill(255*exp(-0.2*i), 255, 255*exp(-0.2*i));
        break;
      case 2:
        fill(255*exp(-0.2*i), 255*exp(-0.2*i), 255);
        break;
    }
    rect(xPos,yPos, xSquLen, ySquLen);
    if(i%2 == 0){
      xPos += xSquLen;
    }else{
      yPos += ySquLen;
    }
  }
  if(tmp == 0)break;
  w = h;
  h = tmp;
}

println("最大公約数" + h);

