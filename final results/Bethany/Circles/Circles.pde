color[] buckets;
float[] counter;
float max_count;
float radius;

color get_closest(color input) {
  color closest;
  float closest_dist = 9999999;
  color current;
  
  closest = buckets[0];
  
  for(int i=0;i<buckets.length;i++) {
    current = buckets[i];
    float d = dist(red(current), green(current), blue(current), red(input), green(input), blue(input));
    if (d < closest_dist) {
      closest_dist = d;
      closest = current;
    }
  }
  return closest;
}

void get_count(color input) {
  color current_color;
  for(int i=0;i<buckets.length;i++) {
    current_color = buckets[i];
    if (red(current_color)==red(input) && green(current_color)==green(input) && blue(current_color)==blue(input)) {
      counter[i] = counter[i] + 1;
    }
  }
}


void setup() {
  buckets = new color[14];
  buckets[0] = color(0,0,0);
  buckets[1] = color(255,255,255);
  buckets[2] = color(255,0,0);
  buckets[3] = color(0,255,0);
  buckets[4] = color(0,0,255);
  buckets[5] = color(255,255,0);
  buckets[6] = color(0,255,255);
  buckets[7] = color(128,0,255);
  buckets[8] = color(255,0,255);
  buckets[9] = color(255,0,128);
  buckets[10] = color(255,128,0);
  buckets[11] = color(128,255,0);
  buckets[12] = color(0,233,128);
  buckets[13] = color(0,128,255);
  
  counter = new float[14];
  counter[0] = 0;
  counter[1] = 0;
  counter[2] = 0;
  counter[3] = 0;
  counter[4] = 0;
  counter[5] = 0;
  counter[6] = 0;
  counter[7] = 0;
  counter[8] = 0;
  counter[9] = 0;
  counter[10] = 0;
  counter[11] = 0;
  counter[12] = 0;
  counter[13] = 0;

  PImage img = loadImage("IMG_4775.JPG");
  img.loadPixels();
  for (int i=0; i< img.pixels.length; i++) {
    img.pixels[i] = get_closest(img.pixels[i]);
  }
  
  for (int i=0; i< img.pixels.length; i++) {
    get_count(img.pixels[i]);
  }
  
  size(1000, 1000);
  background(255);
  print(counter[2]);
  max_count = max(counter);
  //for (int i=0; i< 14; i++) {
  //    stroke(buckets[i]);
  //    radius = log(counter[i]/max_count)*10.;
  //    ellipse(500, 500, radius, radius);
  //}
}
