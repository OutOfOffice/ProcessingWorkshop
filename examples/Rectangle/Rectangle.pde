int rectWidth, rectHeight;
int delta;

void setup() {
  size(200, 200);
  fill(237, 33, 124); // Pink!

  rectWidth = 100;
  rectHeight = 100;
  delta = 1;
}

void draw() {
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
