void starLeg(int pointNum, int pointCount, float innerRadius, float outerRadius) {
  float theta = 0.0;
  // point count is 1/2 of total vertex count
  int vertCount = pointCount*2;
  float thetaRot = TWO_PI/vertCount;
  float tempRadius = 0.0;
  float x = 0.0, y = 0.0;

  for (int j=0; j<2; j++) {
    theta = thetaRot * (2*pointNum+j);
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
    line (0, 0, x, y);
    // textSize(32);
    // text("i:"+i+" j:"+j, x-50, y+50);
  }
} // end star

int pointCount;
float radiusRatio;
float radOut;
float radIn;
int counter;

void setup() {
  pointCount = 5;
  radiusRatio = 0.5;

  size(1000, 1000);
  background(255);

  radOut = height/2.3;
  radIn = radOut*radiusRatio;
  counter = 0;
}



void draw() {
  translate(width/2, height/2);
  for (int i=0; i<counter; i++) {
    starLeg(i, pointCount, radIn, radOut);
  }  
  
  pushStyle();
  noFill();
  if (counter == pointCount+1) {
    stroke(0,0,255);
    ellipse(0, 0, radIn*2, radIn*2);
  } else if (counter == pointCount+2) {
    stroke(255,0,0);
    ellipse(0, 0, radOut*2, radOut*2);
  }
  popStyle();

  if (millis() > (counter + 1) * 1000) {
    counter++;
  }

}
