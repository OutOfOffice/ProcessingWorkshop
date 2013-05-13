int startColors[];
int sortedColors[];
int numMovers;
int zRange;

int colWidth, rowHeight;
int numRows, numCols;

PImage img;

void drawColors(int colors[]) {
  int colorIdx = 0;

  for (int row=0; row<numRows; row++) {
    for(int col=0; col<numCols; col++) {      
      colorIdx = row*numCols + col;
      color rectColor = (color)colors[colorIdx];
      fill(rectColor);
      // rect(col*colWidth, row*rowHeight, colWidth, rowHeight);
      pushMatrix();
      float z = map(red(rectColor), 0, 255, -zRange/2, zRange/2);
      translate(col*colWidth, row*rowHeight, z);
      rotateX(-PI/6);
      rotateY(PI/3 + mouseY/float(height) * PI);

      box(colWidth);
      popMatrix();
    }
  }
}

void setup() {
  zRange = 1000;

  img = loadImage("macarons.jpg");
  img.loadPixels();

  size(img.width, img.height, P3D); 
  colWidth = 10;
  rowHeight = 10;
  numCols = int(width/colWidth);
  numRows = int(height/rowHeight);
  
  numMovers = numCols*numRows;
  startColors = new int[numMovers];
}

void draw() {
  noStroke();

  lights();
  background(0);
  float cameraY = height/2.0;
  float fov = mouseX/float(width) * PI/2 * 2;
  float cameraZ = cameraY / tan(fov / 2.0);
  float aspect = float(width)/float(height);
  if (mousePressed) {
    aspect = aspect / 2.0;
  }
  perspective(fov, aspect, cameraZ/10.0, cameraZ*10.0);

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
