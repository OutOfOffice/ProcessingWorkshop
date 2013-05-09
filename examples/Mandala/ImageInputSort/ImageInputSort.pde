int startColors[];
int sortedColors[];
int numMovers;

int colWidth, rowHeight;
int numRows, numCols;

void drawColors(int colors[]) {
  int colorIdx = 0;

  for (int row=0; row<numRows; row++) {
    for(int col=0; col<numCols; col++) {      
      colorIdx = row*numCols + col;
      color rectColor = (color)colors[colorIdx];
      fill(rectColor);
      rect(col*colWidth, row*rowHeight, colWidth, rowHeight);
    }
  }
}

void setup() {
  PImage img = loadImage("macarons.jpg");
  img.loadPixels();

  size(img.width, img.height); 
  colWidth = 10;
  rowHeight = 10;
  numCols = int(width/colWidth);
  numRows = int(height/rowHeight);
  
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
  sortedColors = sort(startColors);

  // drawColors(startColors);
  drawColors(sortedColors);
}
