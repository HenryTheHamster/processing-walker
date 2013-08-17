import point2line.*;




int x = 400;
int y = 300;
float d = 0;
void setup() {
  size(800, 600);
}


void draw() {
  background(255);
  translate(x, y);
  
  Vect2 foot;
  Vect2 hip = new Vect2(0, -150 + (8 * sin(radians(2 * d))));
  Vect2 knee, test;
  
  Vect2 leftFoot, rightFoot, leftKnee, rightKnee, leftMid, rightMid;
  
  if(d > 180) {
    foot = new Vect2(70 * cos(radians(d)), 20 * sin(radians(d)));
  } else {
    foot = new Vect2(70 * cos(radians(d)), 0);
  }
  
  if(d > 180) {
    leftFoot = new Vect2(60 * cos(radians(d)), 20 * sin(radians(d)));
    rightFoot = new Vect2(60 * cos(radians(d + 180)), 0);
  } else {
    leftFoot = new Vect2(60 * cos(radians(d)), 0);
    rightFoot = new Vect2(60 * cos(radians(d + 180)), 20 * sin(radians(d + 180)));
  }
  
  
  knee = Vect2.midpoint(hip, foot);

  leftMid = Vect2.midpoint(hip, leftFoot);
  leftKnee = leftMid.subtracted(hip);
  leftKnee = new Vect2(leftKnee.y, -leftKnee.x);
  leftKnee.setMagnitude(sqrt(pow(83, 2) - pow(Vect2.distance(hip, leftMid), 2)));
  leftKnee = leftMid.added(leftKnee);
  
  rightMid = Vect2.midpoint(hip, rightFoot);
  rightKnee = rightMid.subtracted(hip);
  rightKnee = new Vect2(rightKnee.y, -rightKnee.x);
  rightKnee.setMagnitude(sqrt(pow(83, 2) - pow(Vect2.distance(hip, rightMid), 2)));
  rightKnee = rightMid.added(rightKnee);
  
  stroke(255, 0, 0);
  line(hip.x, hip.y, leftKnee.x, leftKnee.y);
  line(leftKnee.x, leftKnee.y, leftFoot.x, leftFoot.y);
  stroke(0,0,255);
  line(hip.x, hip.y, rightKnee.x, rightKnee.y);
  line(rightKnee.x, rightKnee.y, rightFoot.x, rightFoot.y);
  stroke(0,255,0);
  line(-100, 0, 100, 0);

  if(d == 360) {
    d = 0;
  } else {
    d += 3;
  }
}
