int COL = 250;
int ROW = 250;
int MOD = 5;
int[][] state = new int[COL][ROW];

void setup(){
  size(1000, 1000);
  frameRate(5);
  initState();
  colorMode(HSB, MOD, 100, 100);
}

void draw(){
  drawCell();
  updateState();
}

void initState(){
  for(int c=0;c<COL;c++){
    for(int r=0;r<ROW;r++){
    }
  }
  state[COL/2][ROW/2] = 1;
}

void drawCell(){
  float sx = (float)width  / ROW;
  float sy = (float)height / COL;
  noStroke();

  float y=0;
  for(int c=0;c<COL;c++){
    float x = 0; 
    for(int r=0;r<ROW;r++){
      if(state[c][r] == 0){
        fill(state[c][r], 0, 89);
      }else{
        fill(state[c][r], 60, 89);
      }
      rect(x, y, sx, sy);
      x += sx;
    }
    y += sy;
  }
}

void updateState(){
  int[][] newState = new int[COL][ROW];

  for(int c=0;c<COL;c++){
    for(int r=0;r<ROW;r++){
      newState[c][r] = (
//          state[(c-1+COL)%COL][(r+1)    %ROW] +
          state[(c-1+COL)%COL][r            ] +
 //         state[(c-1+COL)%COL][(r-1+ROW)%ROW] +

          state[c]            [(r+1)    %ROW] +
          state[c]            [(r-1+ROW)%ROW] +

  //        state[(c+1)    %COL][(r+1)    %ROW] +
          state[(c+1)    %COL][r            ]
  //        state[(c+1)    %COL][(r-1+ROW)%ROW]
          ) % MOD;
    }
  }
  state = newState;
}
