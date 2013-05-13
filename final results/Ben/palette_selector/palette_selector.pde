PImage img;



void draw_subdivided_box(int x,int y, int pixel_val) {
  fill(red(pixel_val),green(pixel_val),blue(pixel_val));
  noStroke();
  rect(x, y, 100, 100);  
}




void setup() {
  size(600, 600);
  img = loadImage("cineideal_small.jpg");

  //print(green(img.pixels[100]));

  int dimension = img.width * img.height;
  int box_height = 110;
 
  img.loadPixels();
  for (int i = 0; i < 25; i++) {
    draw_subdivided_box((i % 5) * box_height, (i / 5) * box_height, img.pixels[int(random(dimension))]);    
  }  
}

void draw() {
 // image(img, 0, 0);
// img.pixels
}
