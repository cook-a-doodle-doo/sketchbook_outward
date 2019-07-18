float B_CONS   = 3435;
float RES      = 8002;
float ANY_TEMP = 25 + 273.15;
float ANY_TEMP_RES  = 10000;

void setup(){
  frameRate(2);
}

//部分抵抗と全体抵抗,全体電圧から部分電圧を求める
//未テスト
float volts_partial(float res_partial, float res_all, float v_all){
  return v_all * res_partial/(res_partial + res_all);
}

//戻り値，引数共にセ氏
float temp_to_res(float temp, float any_temp, float any_temp_res, float B_cons){
  return any_temp_res * exp(B_cons * (1/temp - 1/any_temp));
}

//戻り値，引数共にセ氏
float res_to_temp(float res, float any_temp, float any_temp_res, float B_cons){
  return 1/(1/B_cons*log(res/any_temp_res) + 1/any_temp);
}

void draw(){
  // なんか悔しいから求めた
  float temp      = res_to_temp(RES, ANY_TEMP, ANY_TEMP_RES, B_CONS);

  temp += frameCount;
  //課題では下２つを温度30+273.15に対して使えばいい
  //素子が任意の温度の時の 素子の抵抗を返す
  float res       = temp_to_res(temp, ANY_TEMP, ANY_TEMP_RES, B_CONS);
  //素子が任意の抵抗の時の 観測電圧を返す
  float v_partial = volts_partial(res, res+1000, 5);

  println("temp     : " + (temp) + " (" + (temp - 273.15) + ")");
  println("res      : " + (res));
  println("v(比較用): " + (v_partial));

  println("\n");
}
