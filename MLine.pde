class MLine {  
  Point bMouse, aMouse;
  
  void setmp(float x, float y) {
    bMouse = new Point(x, y);
  }
  void setmr(float x, float y) {
    aMouse = new Point(x, y);
  }
  Vector getv() {
    Vector v = new Vector(bMouse, aMouse);
    return v;
  }
}