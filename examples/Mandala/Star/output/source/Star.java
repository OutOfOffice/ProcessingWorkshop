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

public class Star extends PApplet {

public void star(int pointCount, float innerRadius, float outerRadius) {
  float theta = 0.0f;
  // point count is 1/2 of total vertex count
  int vertCount = pointCount*2;
  float thetaRot = TWO_PI/vertCount;
  float tempRadius = 0.0f;
  float x = 0.0f, y = 0.0f;

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

public void setup() {
  int pointCount = 5;
  float radiusRatio = 0.5f;

  size(1000, 1000);
  translate(width/2, height/2);
  background(255);
  fill(0);
  float radOut = height/2.3f;
  float radIn = radOut*radiusRatio;
  star(pointCount, radIn, radOut);
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Star" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
