import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class StarDeconstructed extends PApplet {

public void starLeg(int pointNum, int pointCount, float innerRadius, float outerRadius) {
  float theta = 0.0f;
  // point count is 1/2 of total vertex count
  int vertCount = pointCount*2;
  float thetaRot = TWO_PI/vertCount;
  float tempRadius = 0.0f;
  float x = 0.0f, y = 0.0f;

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

public void setup() {
  pointCount = 5;
  radiusRatio = 0.5f;

  size(1000, 1000);
  background(255);

  radOut = height/2.3f;
  radIn = radOut*radiusRatio;
  counter = 0;
}



public void draw() {
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
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "StarDeconstructed" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
