
size(500, 500);

int WIDTH_MARGIN  = 10;
int HEIGHT_MARGIN = 10;
int WIDTH_MAX  = width  - 2*WIDTH_MARGIN;
int HEIGHT_MAX = height - 2*HEIGHT_MARGIN;

rect(WIDTH_MARGIN, HEIGHT_MARGIN, 210, 324);

int a = 6;
int b = 10;
int tmp = 0;

for(;;){
   tmp = a % b;
   println(a,b,tmp);
   if(tmp == 0)break;
   a = b;
   b = tmp;
}
println("最大公約数" + b);


/*
const int width


void draw(){

}
*/
