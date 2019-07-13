class Fibonacci {
  private int now = 1;
  private int ago = 0;
  
  int val(){
    return now;
  }

  int agoVal(){
    return ago;
  }

  int next(){
    int next = now + ago;
    ago = now;
    now = next;
    return next;
  }
}
