color[] buckets;

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
  PImage img = loadImage("IMG_2537.jpg");
  img.loadPixels();
  for (int i=0; i< img.pixels.length; i++) {
    img.pixels[i] = get_closest(img.pixels[i]);
  }
  size(img.width, img.height);
  image(img, 0, 0);
  
}
