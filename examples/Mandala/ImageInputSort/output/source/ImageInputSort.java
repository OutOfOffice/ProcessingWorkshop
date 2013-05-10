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

public class ImageInputSort extends PApplet {

int startColors[];
int sortedColors[];
int numMovers;

int colWidth, rowHeight;
int numRows, numCols;

public void drawColors(int colors[]) {
  int colorIdx = 0;

  for (int row=0; row<numRows; row++) {
    for(int col=0; col<numCols; col++) {      
      colorIdx = row*numCols + col;
      int rectColor = (int)colors[colorIdx];
      fill(rectColor);
      rect(col*colWidth, row*rowHeight, colWidth, rowHeight);
    }
  }
}

public void setup() {
  PImage img = loadImage("macarons.jpg");
  img.loadPixels();

  size(img.width, img.height); 
  colWidth = 10;
  rowHeight = 10;
  numCols = PApplet.parseInt(width/colWidth);
  numRows = PApplet.parseInt(height/rowHeight);
  
  int numMovers = numCols*numRows;
  startColors = new int[numMovers];

  int pixelIdx, colorIdx;
  for (int row=0; row<numRows; row++) {
    for(int col=0; col<numCols; col++) {
      pixelIdx = row*rowHeight*width + col*colWidth;
      colorIdx = row*numCols + col;
      startColors[colorIdx] = img.pixels[pixelIdx];
    }
  }

  // Draw unsorted colors:
  // drawColors(startColors);

  // Draw naively sorted colors:
  sortedColors = sort(startColors);
  drawColors(sortedColors);
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "ImageInputSort" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
