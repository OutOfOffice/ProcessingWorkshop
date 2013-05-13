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

public class ThreeDeeMacarons extends PApplet {

int startColors[];
int sortedColors[];
int numMovers;
int zRange;

int colWidth, rowHeight;
int numRows, numCols;

PImage img;

public void drawColors(int colors[]) {
  int colorIdx = 0;

  for (int row=0; row<numRows; row++) {
    for(int col=0; col<numCols; col++) {      
      colorIdx = row*numCols + col;
      int rectColor = (int)colors[colorIdx];
      fill(rectColor);
      // rect(col*colWidth, row*rowHeight, colWidth, rowHeight);
      pushMatrix();
      float z = map(red(rectColor), 0, 255, -zRange/2, zRange/2);
      translate(col*colWidth, row*rowHeight, z);
      rotateX(-PI/6);
      rotateY(PI/3 + mouseY/PApplet.parseFloat(height) * PI);

      box(colWidth);
      popMatrix();
    }
  }
}

public void keyPressed() {
  if (key == 'j' && key == 'J') {
    zRange = max(0, zRange - 100);
  } else if (key == 'l' && key == 'L') {
    zRange = min(1000, zRange + 100);
  }
}

public void setup() {
  zRange = 1000;

  img = loadImage("macarons.jpg");
  img.loadPixels();

  size(img.width, img.height, P3D); 
  colWidth = 10;
  rowHeight = 10;
  numCols = PApplet.parseInt(width/colWidth);
  numRows = PApplet.parseInt(height/rowHeight);
  
  numMovers = numCols*numRows;
  startColors = new int[numMovers];
}

public void draw() {
  noStroke();

  lights();
  background(0);
  float cameraY = height/2.0f;
  float fov = mouseX/PApplet.parseFloat(width) * PI/2 * 2;
  float cameraZ = cameraY / tan(fov / 2.0f);
  float aspect = PApplet.parseFloat(width)/PApplet.parseFloat(height);
  if (mousePressed) {
    aspect = aspect / 2.0f;
  }
  perspective(fov, aspect, cameraZ/10.0f, cameraZ*10.0f);

  int pixelIdx, colorIdx;
  for (int row=0; row<numRows; row++) {
    for(int col=0; col<numCols; col++) {
      pixelIdx = row*rowHeight*width + col*colWidth;
      colorIdx = row*numCols + col;
      startColors[colorIdx] = img.pixels[pixelIdx];
    }
  }

  // Draw unsorted colors:
  drawColors(startColors);

  // Draw naively sorted colors:
  // sortedColors = sort(startColors);
  // drawColors(sortedColors);
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "ThreeDeeMacarons" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
