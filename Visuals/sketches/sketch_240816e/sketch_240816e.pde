int angle = 0;

// Maximum number of iterations for each point on the complex plane
final int maxIterations = 100;

// Colors to be used for each possible iteration count
color[] colors = new color[maxIterations];

void setup() {
  size(640, 360);
  colorMode(HSB, 1);
  
  // Create the colors to be used for each possible iteration count
  for (int n = 0; n < maxIterations; n++) {
    float hu = sqrt(n / float(maxIterations));
    colors[n] = color(hu, 1, 0.59); // Adjusted brightness and saturation for better visibility
  }
}

void draw() {
  float ca = cos(angle * 3.213);
  float cb = sin(angle);

  angle += 0.005;

  background(255);

  float w = 5;
  float h = (w * height) / width;

  float xmin = -w / 2;
  float ymin = -h / 2;

  loadPixels();

  float xmax = xmin + w;
  float ymax = ymin + h;

  float dx = (xmax - xmin) / width;
  float dy = (ymax - ymin) / height;

  float y = ymin;
  for (int j = 0; j < height; j++) {
    float x = xmin;
    for (int i = 0; i < width; i++) {
      float a = x;
      float b = y;
      int n = 0;
      while (n < maxIterations) {
        float aa = a * a;
        float bb = b * b;
        if (aa + bb > 4.0) {
          break; // Bail
        }
        float twoab = 2.0 * a * b;
        a = aa - bb + ca;
        b = twoab + cb;
        n++;
      }

      int pixelIndex = x + y * width;
      if (i > 0) {
        pixels[pixelIndex] = color(255); // Set pixel color to black for fractal points
      } else {
        pixels[pixelIndex] = color(0); // Set pixel color to white for background
      }
    }
    y += dy;
  }

  updatePixels();
}
