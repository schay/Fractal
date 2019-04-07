class Vector {
  Point a, b;
  
  Vector(Point aa, Point bb){
    a = aa;
    b = bb;
  }
  void drawLine() {
    line(a.x, a.y, b.x, b.y);
  }
}