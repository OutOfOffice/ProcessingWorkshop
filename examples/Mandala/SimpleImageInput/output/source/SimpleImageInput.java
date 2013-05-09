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

public class SimpleImageInput extends PApplet {

public void setup() {
  PImage img = loadImage("macarons.jpg");
  img.loadPixels();

  size(img.width, img.height); 
  int colWidth = 10;
  int rowHeight = 10;
  int numCols = PApplet.parseInt(width/colWidth);
  int numRows = PApplet.parseInt(height/rowHeight);

  for (int row=0; row<numRows; row++) {
    for(int col=0; col<numCols; col++) {
      int pixelIdx = row*rowHeight*width + col*colWidth;
      fill(img.pixels[pixelIdx]);
      rect(col*colWidth, row*rowHeight, colWidth, rowHeight);
    }
  }
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "SimpleImageInput" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
