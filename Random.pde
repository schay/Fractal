class Random {
  float value = 0;
  float r;
  boolean refresh = false;
  
  void set(float s) {
    value = s;
  }
  float get(int rr) {
    if(value == 0 || r != rr) {
      value = random(1 - r/100., 1 + r/100.);
    }
    r = rr;
    println("random : " + r);
    return value;
  }
}