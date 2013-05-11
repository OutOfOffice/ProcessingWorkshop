import java.util.Arrays;

PImage img;
int i;

float color_to_theta(color c) {
  float avg_color = (red(c) + green(c) + blue(c)) / 3;
  return ((avg_color / 256.0) * TWO_PI);
}

void setup() {
  size(1024,768);
  img = loadImage("C:\\Users\\Kevin\\Downloads\\test.jpg");
  img.loadPixels();
  i = 0;
}

void drawLine(color[] line) {
  float cx = width/2;
  float cy = height/2;
  for (int j=0; j<line.length; j++) {
    color pixel = line[j];
    stroke(pixel);
    float theta = color_to_theta(pixel);
    float nx = cx + cos(theta);
    float ny = cy + sin(theta);
    line(cx, cy, nx, ny);
    cx = nx;
    cy = ny;
  }
}


void draw() {
  int line_start = i * img.width;
  int line_end = (i+1) * img.width;
  if (line_end >= img.pixels.length) {
    return;
  }
  color[] line = Arrays.copyOfRange(img.pixels, line_start, line_end);
  drawLine(line);
  i+=1;
}
