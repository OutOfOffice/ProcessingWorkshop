// Adapted from:
// Processing, Creative Coding and Generative Art in Processing 2
// Chapter 3, Simple Mandala, pg 99
float RAD_IN_FACTOR = 0.7;

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
  size(1000, 1000);
  noStroke();
}

void draw() {
  int pointCount = int(map(mouseX, 0, width, 3, 100));
  int steps = int(map(mouseY, 0, height, 5, 100));

  float outerRadius = width*0.5;
  float innerRadius = outerRadius*RAD_IN_FACTOR;
  float outerRadiusRatio = outerRadius/steps;
  float innerRadiusRatio = innerRadius/steps;
  float shadeRatio = 255.0/steps;
  float rotationRatio = 45.0/steps;

  background(255);
  translate(width/2, height/2);

  for (int i=0; i<steps; i++) {
    stroke(255-shadeRatio*i, 100);
    fill(shadeRatio*i);
    pushMatrix();
    rotate(rotationRatio*i*PI/180);
    star(pointCount, outerRadius-outerRadiusRatio*i, innerRadius-innerRadiusRatio*i);
    popMatrix();
  }
}
