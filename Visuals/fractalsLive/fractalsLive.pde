float zoom = 1.0;
PVector offset = new PVector(0, 0);
PVector c = new PVector(random(-2, 2), random(-2, 2)); // Initial c value
float changeRate = 0.05; //change over time
float targetC = c.x; // Initialize targetCX with current c.x value

float cMin = -2.0; // Minimum value for c.x and c.y
float cMax = 2.0;  // Maximum value for c.x and c.y


//c.x, c.y, hue, saturation, brightness

void setup() {
  size(800, 800);
  colorMode(HSB, 1.0, 1.0, 1.0);
}

void draw() {
  loadPixels();
  float w = (4.0 / zoom);
  float h = (4.0 / zoom);
  float xmin = offset.x - w / 2;
  float ymin = offset.y - h / 2;
  float xmax = xmin + w;
  float ymax = ymin + h;

  int maxIter = 100;
  
  // Check if c.x has reached targetCX
  if (abs(c.x - targetC) < 0.001) {
    // Update targetC to a new random value
    targetC = random(-2, 2);
    println("New target c.x: " + targetC);
  }
  
  // Update c.x and c.y over time
  c.x = lerp(c.x, targetC, changeRate);
  c.y = lerp(c.y, targetC, changeRate);
  
  // Limit c.x and c.y within specified range
  c.x = constrain(c.x, cMin, cMax);
  c.y = constrain(c.y, cMin, cMax);
  
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      float a = map(x, 0, width, xmin, xmax);
      float b = map(y, 0, height, ymin, ymax);
      int n = julia(a, b, maxIter, c.x, c.y);
      
      // Color mapping based on iteration count
      color col;
      if (n == maxIter) {
        col = color(0, 0.1, 1); // Set to black if n == maxIter (convergent)
      } else {
        float hue = map(n, 0, maxIter, 0.8, 0.8); // Map n to hue range (adjustable)
        float saturation = map(n, 0, maxIter, 0.3, 1.0); //saturation
        float brightness = map(sqrt(n / (float)maxIter), 0, 1, 0.1, 1.0); // Adjust brightness
        
        col = color(hue, saturation, brightness); // Set color based on hue and brightness
      }
      
      pixels[x + y * width] = col;
    }
  }

  updatePixels();
}

int julia(float a, float b, int maxIter, float ca, float cb) {
  int n;
  for (n = 0; n < maxIter; n++) {
    float aa = a * a - b * b;
    float bb = 2 * a * b;
    a = aa + ca;
    b = bb + cb;
    if (abs(a + b) > 16) {
      break;
    }
  }
  return n;
}

void keyPressed() {
  //x max 0.35, y as well, I guess
  
}

//void mouseWheel(MouseEvent event) {
//  float e = event.getCount();
//  zoom *= 1 + e * 0.05;
//  redraw();
//}

void mouseDragged() {
  offset.x += (mouseX - pmouseX) / zoom;
  offset.y += (mouseY - pmouseY) / zoom;
  redraw();
}
