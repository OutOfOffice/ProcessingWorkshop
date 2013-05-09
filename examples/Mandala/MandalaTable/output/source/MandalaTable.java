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

public class MandalaTable extends PApplet {

// Adapted from:
// Processing, Creative Coding and Generative Art in Processing 2
// Chapter 3, Create a Mandala Table, pg 102

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
  size(1000, 1000);
  background(255);

  // presets 
  int rows = 10;
  int cols = 10;
  float outerRadius = width/cols;

  // randomly generated
  int pointCount;
  int steps;
  float innerRadius;
  float innerRadiusRatio;
  float outerRadiusRatio;
  float shadeRatio;
  float rotationRatio;

  translate(outerRadius/2, outerRadius/2);
  for (int i=0; i<rows; i++) {
    for (int j=0; j<cols; j++) {
      pointCount = PApplet.parseInt(random(5, 15));
      steps = PApplet.parseInt(random(3, 20));
      innerRadius = outerRadius*random(0.3f, 0.9f);
      innerRadiusRatio = innerRadius/steps;
      outerRadiusRatio = outerRadius/steps;

      float randColor = random(225, 255);
      shadeRatio = randColor/steps;
      rotationRatio = random(90, 200)/steps;

      pushMatrix();
      translate(outerRadius*j, outerRadius*i);
      for (int k=0; k<steps; k++) {
        float shade = shadeRatio*k;
        fill(shade);
        stroke(randColor-shade, 100);
        pushMatrix();
        scale(0.4f);
        rotate(rotationRatio*k*PI/180);
        star(pointCount,
             outerRadius-outerRadiusRatio*k,
             innerRadius-innerRadiusRatio*k);
        popMatrix();
      }
      popMatrix();
    }
  }
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "MandalaTable" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
