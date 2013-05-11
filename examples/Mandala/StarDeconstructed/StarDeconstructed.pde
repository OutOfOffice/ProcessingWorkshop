void star(int pointCount, float innerRadius, float outerRadius) {
  float theta = 0.0;
  // point count is 1/2 of total vertex count
  int vertCount = pointCount*2;
  float thetaRot = TWO_PI/vertCount;
  float tempRadius = 0.0;
  float x = 0.0, y = 0.0;

  for (int i=0; i<pointCount; i++) {
    for (int j=0; j<2; j++) {
      tempRadius = innerRadius;

      // true if j is even
      if (j%2==0) {
        tempRadius = outerRadius;
        fill(255, 0, 0);
      } else {
        fill(0, 0, 255);
      }

      x = cos(theta)*tempRadius;
      y = sin(theta)*tempRadius;

      ellipse(x, y, 20, 20);
      textSize(32);
      text("i:"+i+" j:"+j, x-50, y+50);

      theta += thetaRot;
    }
  }
} // end star

void setup() {
  int pointCount = 5;
  float radiusRatio = 0.5;

  size(1000, 1000);
  translate(width/2, height/2);
  background(255);

  float radOut = height/2.3;
  float radIn = radOut*radiusRatio;
  star(pointCount, radIn, radOut);
}
