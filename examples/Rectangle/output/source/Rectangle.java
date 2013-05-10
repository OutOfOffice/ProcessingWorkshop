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

public class Rectangle extends PApplet {

int rectWidth, rectHeight;
int delta;

public void setup() {
  size(200, 200);
  fill(237, 33, 124); // Pink!

  rectWidth = 100;
  rectHeight = 100;
  delta = 1;
}

public void draw() {
  int x = 0;
  int y = 50;

  if (rectWidth >= width) {
    delta = -1;
  } else if (rectWidth <= 0) {
    delta = 1;
  }
  rectWidth = rectWidth + delta;

  background(255);
  rect(x, y, rectWidth, rectHeight); 
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Rectangle" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
