void star(int pointCount, float innerRadius, float outerRadius) {
  float theta = 0.0;
  // point count is 1/2 of total vertex count
  int vertCount = pointCount*2;
  float thetaRot = TWO_PI/vertCount;
  float tempRadius = 0.0;
  float x = 0.0, y = 0.0;

  beginShape();
  for (int i=0; i<pointCount; i++) {
    for (int j=0; j<2; j++) {
      tempRadius = innerRadius;

      // true if j is even
      if (j%2==0) {
        tempRadius = outerRadius;
      }

      x = cos(theta)*tempRadius;
      y = sin(theta)*tempRadius;
      vertex(x, y);
      theta += thetaRot;
    }
  }
  endShape(CLOSE);
} // end star

void setup() {
  int NUM_POINTS = 80;
  float RAD_IN_PCT = 0.2;

  size(1000, 1000);
  translate(width/2, height/2);
  background(0);
  float radOut = height/2.3;
  float radIn = radOut*RAD_IN_PCT;
  star(NUM_POINTS, radIn, radOut);
}
