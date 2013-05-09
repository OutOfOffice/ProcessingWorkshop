void setup() {
  PImage img = loadImage("macarons.jpg");
  img.loadPixels();

  size(img.width, img.height); 
  int colWidth = 10;
  int rowHeight = 10;
  int numCols = int(width/colWidth);
  int numRows = int(height/rowHeight);

  for (int row=0; row<numRows; row++) {
    for(int col=0; col<numCols; col++) {
      int pixelIdx = row*rowHeight*width + col*colWidth;
      fill(img.pixels[pixelIdx]);
      rect(col*colWidth, row*rowHeight, colWidth, rowHeight);
    }
  }
}
