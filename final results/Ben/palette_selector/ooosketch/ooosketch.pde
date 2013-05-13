PImage img;
int BOX_DIM = 100;
int BOX_SPACE = 10;
int ROWS = 4;
int COLS = 10;
int ANIMATE_LIMIT = 90;

int box_height = BOX_DIM + BOX_SPACE;
int current_animate_step = 0;
int[] random_pixels = new int[ROWS * COLS];

float scale_cut( float color_val, int span_distance) {
  return (color_val / 255.0) * span_distance;
}


void draw_subdivided_box(int x,int y, int pixel_val) {
  int step = current_animate_step % ANIMATE_LIMIT;
  int cycle = current_animate_step / ANIMATE_LIMIT % 3;
 
  translate(x,y);
  fill(pixel_val);
  stroke(pixel_val);
  rect(0, 0, BOX_DIM, BOX_DIM);
  float red_cut;
  float green_cut;
  float blue_cut;
  
  stroke(255);
  if (cycle == 0) {
    red_cut = scale_cut(red(pixel_val), BOX_DIM) * (float(step) / ANIMATE_LIMIT);    
    blue_cut = scale_cut(blue(pixel_val), , BOX_DIM) * ((ANIMATE_LIMIT - float(step)) / ANIMATE_LIMIT);

    line(0, red_cut, BOX_DIM, red_cut);
  }
  if (cycle == 1) {
    red_cut = scale_cut(red(pixel_val), BOX_DIM) * ((ANIMATE_LIMIT - float(step)) / ANIMATE_LIMIT);
    green_cut = scale_cut(green(pixel_val), BOX_DIM) * (float(step) / ANIMATE_LIMIT);
    line(0, red_cut, BOX_DIM, red_cut);
    line(green_cut, red_cut, green_cut, BOX_DIM);    
  }
  if (cycle == 2) {
    red_cut = 0;
    green_cut = scale_cut(green(pixel_val), BOX_DIM) * ((ANIMATE_LIMIT - float(step)) / ANIMATE_LIMIT);
    blue_cut = scale_cut(blue(pixel_val), BOX_DIM) * (float(step) / ANIMATE_LIMIT);

    line(green_cut, red_cut, green_cut, BOX_DIM);        
  }
  
//  fill(red(pixel_val), 0, 0);
//  rect(0, 0, BOX_DIM, red_cut);
//  fill(0, green(pixel_val), 0);  
//  rect(0, red_cut, green_cut, BOX_DIM - red_cut);

  
//  line(green_cut, red_cut, green_cut, BOX_DIM);     
}


void setup() {
  size((BOX_DIM+BOX_SPACE) * COLS, (BOX_DIM+BOX_SPACE) * ROWS);
  img = loadImage("cineideal_small.jpg");

  //print(green(img.pixels[100]));

  int dimension = img.width * img.height;
 
  img.loadPixels();
  for (int i = 0; i < ROWS * COLS; i++) {
    random_pixels[i] = img.pixels[int(random(dimension))];
  }  
}

void draw() {
  current_animate_step++;
  for (int i = 0; i < ROWS * COLS; i++) {
    pushMatrix();
    draw_subdivided_box((i % COLS) * box_height, (i / COLS) * box_height, random_pixels[i]);
    popMatrix();    
  } 

}
