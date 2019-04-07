final int AllRandom = 100000;
MLine ml[] = new MLine[100];
Random r[] = new Random[AllRandom];
CRandom cr[] = new CRandom[AllRandom];
int count = 0, ccount = 0, rcount = 0;
int rflag = 0;
boolean flag = false;
int saikinum = 5;
LineArea la;
Point tp;
int tla = 0;
Point a, b;
int range = 10;

void setup(){
  size(1280, 800);
  smooth();
  frameRate(30);
  for(int i = 0; i < AllRandom; i++) {
    r[i] = new Random();
    cr[i] = new CRandom();
  }
  a = new Point(400., height/2.);
  b = new Point(800., height/2.);
  count = 2;
  ml[0] = new MLine();
  ml[1] = new MLine();
  ml[0].aMouse = new Point(600, 600);
  ml[0].bMouse = a;
  ml[1].aMouse = new Point(600, 600);
  ml[1].bMouse = b;
}

void draw(){
  background(255);
  smooth();
  ellipseMode(CENTER);
  rectMode(CORNERS);
  stroke(0);
  Vector v0 = new Vector(a, b);
  la = new LineArea(v0);

  if(rflag == 0 || rflag == 1) {
    v0.drawLine();
  }
  if(rflag == 0) {
    la.draw();
  }
  
  Vector v[] = new Vector[count];
  float theta = -atan2((b.y - a.y), (b.x - a.x));
  float m = sqrt(pow(b.x - a.x, 2.) + pow(b.y - a.y, 2.));
  Point tca, tcb, ca, cb;
  for(int i = 0; i < count; i++) {
    tca = new Point(ml[i].getv().a.x - a.x, ml[i].getv().a.y - a.y);
    tcb = new Point(ml[i].getv().b.x - a.x, ml[i].getv().b.y - a.y);
    ca = new Point((tca.x*cos(theta) - tca.y*sin(theta))/m, (tca.x*sin(theta) + tca.y*cos(theta))/m);
    cb = new Point((tcb.x*cos(theta) - tcb.y*sin(theta))/m, (tcb.x*sin(theta) + tcb.y*cos(theta))/m);
    v[i] = new Vector(ca, cb);
  }
  
  rcount = 0;
  if(rflag == 1 || rflag == 2) {
    drawFractal(a, b, saikinum, v);
  }
  
  for(int i = 0; i < count; i++) {
    if(rflag == 0) {
      ml[i].getv().drawLine();
    }
  }
  Point tm = new Point(mouseX, mouseY);
  if(flag) {
    Vector tv = new Vector(ml[count].bMouse, tm);
    tv.drawLine();
  }
  if(tla < 0) {
    a = tm;
  }
  if(tla > 0) {
    b = tm;
  }
  println("saiki : " + saikinum);
  println("random : " + range);
}
void drawFractal(Point a, Point b, int num, Vector v[]) {
  int n = v.length;
  Vector c[] = new Vector[n];
  Point ca, cb;
  
  float theta = atan2((b.y - a.y), (b.x - a.x));
  float m = sqrt(pow(b.x - a.x, 2.) + pow(b.y - a.y, 2.));
  for(int i = 0; i < n; i++) {
    float rr = 1;
    if(keyCode == SHIFT && keyPressed) {
      rr = r[rcount++].get(range);
    }
    else {
      r[rcount++].set(0);
    }
    ca = new Point((v[i].a.x*cos(theta) - v[i].a.y*sin(theta))*m + a.x, ((v[i].a.x*sin(theta) + v[i].a.y*cos(theta))*m + a.y));
    cb = new Point(((v[i].b.x*cos(theta) - v[i].b.y*sin(theta))*rr)*m + a.x, (((v[i].b.x*sin(theta) + v[i].b.y*cos(theta))*rr)*m + a.y));
    c[i] = new Vector(ca, cb);
  }
  if(num <= 0) {
    for(int i = 0; i < n; i++) {
      stroke(cr[rcount++].get());
      c[i].drawLine();
    }
  }
  else {
    for(int i = 0; i < n; i++) {
      if(rflag == 1) {
        stroke(cr[rcount++].get());
        c[i].drawLine();
      }
      drawFractal(c[i].a, c[i].b, num-1, v);
    }
  }
}
void mousePressed() {
  if(mouseButton == LEFT) {
    tla = la.getPos(new Point(mouseX, mouseY));
  }
}

void keyTyped() {
  if(key == TAB) {
    rflag = (rflag + 1)%3;
  }
}

void mouseReleased() {
  if(mouseButton == LEFT) {
    tla = 0;
  }
}

void mouseClicked() {
  if(mouseButton == LEFT) {
    if(flag) {
      ml[count].setmr(mouseX, mouseY);
      count++;
    }
    else {
      ml[count] = new MLine();
      ml[count].setmp(mouseX, mouseY);
    }
    flag = !flag;
  }
  if(mouseButton == RIGHT && count > 0) {
    count--;
  }
}

void mouseWheel(MouseEvent e) {
  if(keyCode != SHIFT || !keyPressed) {
    if(e.getAmount() < 0) {
      saikinum++;
    }
    else {
      if(saikinum > 0) saikinum--;
    }
  }
  else {
    if(e.getAmount() < 0) {
      if(range <= 95) range += 5;
    }
    else {
      if(range >= 5) range -= 5;
    }
  }
}