  /*
  Point s = new Point(0, 0);
  Point g = new Point(1, 0);
  */
  
  /*dragon
  Point vc[] = new Point[1];
  vc[0] = new Point(0.5, 0.5);
    
  Vector v[] = new Vector[2];
  v[0]= new Vector(s, vc[0]);
  v[1]= new Vector(g, vc[0]);
  */
  
  /*koch
  Point vc[] = new Point[3];
  vc[0] = new Point(1./3., 0);
  vc[1] = new Point(1./2., sqrt(3.)/6.);
  vc[2] = new Point(2./3., 0);
  
  Vector v[] = new Vector[4];
  v[0] = new Vector(s, vc[0]);
  v[1] = new Vector(vc[0], vc[1]);
  v[2] = new Vector(vc[1], vc[2]);
  v[3] = new Vector(vc[2], g);
  */
  
  /*tree
  Point vc[] = new Point[3];
  vc[0] = new Point(0.5, 0);
  vc[1] = new Point(1., 1./sqrt(3.)/2.);
  vc[2] = new Point(1., -1./sqrt(3.)/2.);
    
  Vector v[] = new Vector[3];
  v[0]= new Vector(s, g);
  v[1]= new Vector(vc[0], vc[1]);
  v[2]= new Vector(vc[0], vc[2]);
  */