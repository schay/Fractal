class CRandom {
  color c = color(0, 0, 0);
  boolean flag = false;
  
  color get() {
    if(flag == false) c = color(random(0, 255), random(0,255), random(0, 255));
    flag = true;
    return c;
  }
}