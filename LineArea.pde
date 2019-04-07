class LineArea {
  Vector v;
  float size = 10;
  
  LineArea(Vector vv) {
    v = vv;
  }
  void draw() {
    fill(255, 0, 0);
    rect(v.a.x - size, v.a.y - size, v.a.x + size, v.a.y + size);
    rect(v.b.x - size, v.b.y - size, v.b.x + size, v.b.y + size);
    fill(0);
    textSize(16);
    textAlign(CENTER, CENTER);
    text("S", v.a.x, v.a.y);
    text("G", v.b.x, v.b.y);
  }
  int getPos(Point p) {
    if(p.x > v.a.x - size && p.y > v.a.y - size && p.x < v.a.x + size && p.y < v.a.y + size) {
      return -1;
    }
    else if(p.x > v.b.x - size && p.y > v.b.y - size && p.x < v.b.x + size && p.y < v.b.y + size) {
      return 1;
    }
    return 0;
  }
}