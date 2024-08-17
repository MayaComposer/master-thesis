import processing.sound.*;


int maxIterations = 50;  // Reduced number of iterations
float zoom = 1;
float moveX = 0, moveY = 0;
float cRe = -0.7, cIm = 0.27015; // Initial parameters for the Julia set
int skip = 2;  // Skip every 2 pixels to reduce computations

float angle = 0.0;

void setup() {
  size(800, 800);
  noCursor(); // Hide the cursor for a cleaner view
  noSmooth(); // Disable anti-aliasing for performance
  frameRate(10); // Set frame rate to control the speed of the animation
  background(255); // Set the initial background to white
}

void draw() {
  cRe = sin(angle);
  cIm = cos(angle);
  
  angle += 0.005;
  
  drawJuliaSet(); // Redraw the Julia set with the updated constant
  
  // Display the current values of cRe and cIm on the screen
  fill(255);
  rect(10, 10, 300, 20); // Background for the text
  fill(0);
  text("cRe: " + nf(cRe, 1, 3) + ", cIm: " + nf(cIm, 1, 3), 15, 25);
  
}

void drawJuliaSet() {
  loadPixels(); // Load pixel data for manipulation
  for (int x = 0; x < width; x += skip) {  // Skip every 'skip' pixels
    for (int y = 0; y < height; y += skip) {
      float zx = 1.5f * (x - width / 2) / (0.5f * zoom * width) + moveX;
      float zy = (y - height / 2) / (0.5f * zoom * height) + moveY;
      int i = maxIterations;
      
      while (zx * zx + zy * zy < 4 && i > 0) {
        float tmp = zx * zx - zy * zy + cRe;
        zy = 2.0f * zx * zy + cIm;
        zx = tmp;
        i--;
      }
      
      int pixelIndex = x + y * width;
      if (i > 0) {
        pixels[pixelIndex] = color(0); // Set pixel color to black for fractal points
      } else {
        pixels[pixelIndex] = color(255); // Set pixel color to white for background
      }
    }
  }
  updatePixels(); // Update pixel data on the screen
}
