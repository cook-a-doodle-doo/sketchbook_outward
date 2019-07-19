
size(1000, 1000);

int n = 277;

if(args != null){
  n = int(args[0]);
}

float step = float(width) / (n+1);
float x,y,rad;
float text_size = step/2.0;

fill(0);
if(text_size < 2)text_size = 1;
textSize(text_size);

for(int k=0;k<n;k++){
  text(k, step*(k+1) - text_size/2.0, step + text_size/2.0);
}
for(int i=1;i<n;i++){
  for(int k=0;k<n;k++){
    text(k, step - text_size/2.0, step*(k+1) + text_size/2.0);
  }
  for(int j=1;j<n;j++){
    x = step*(j+1);
    y = step*(i+1);
    float important = i * j;
    rad = step*(5.0/5) * (important%n + 1) / n;
    ellipse(x, y, rad, rad);
  }
}


