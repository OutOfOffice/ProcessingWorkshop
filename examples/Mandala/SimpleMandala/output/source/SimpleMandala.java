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

public class SimpleMandala extends PApplet {

// Adapted from:
// Processing, Creative Coding and Generative Art in Processing 2
// Chapter 3, Simple Mandala, pg 99

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
  int NUM_POINTS = 8;
  int STEPS = 50;
  float RAD_IN_FACTOR = 0.7f;

  size(1000, 1000);
  background(0);
  noStroke();
  translate(width/2, height/2);

  float outerRadius = width*0.5f;
  float innerRadius = outerRadius*RAD_IN_FACTOR;
  float outerRadiusRatio = outerRadius/STEPS;
  float innerRadiusRatio = innerRadius/STEPS;
  float shadeRatio = 255.0f/STEPS;
  float rotationRatio = 45.0f/STEPS;

  for (int i=0; i<STEPS; i++) {
    stroke(255-shadeRatio*i, 100);
    fill(shadeRatio*i);
    pushMatrix();
    rotate(rotationRatio*i*PI/180);
    star(NUM_POINTS, outerRadius-outerRadiusRatio*i, innerRadius-innerRadiusRatio*i);
    popMatrix();
  }
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "SimpleMandala" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
