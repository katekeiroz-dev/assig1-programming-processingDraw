boolean isNight = false;  // Boolean to check if it's night time
int[] buildingHeights = new int[15]; // Array to store building heights
float[][] clouds = new float[5][4]; // Arrays to store cloud positions and sizes: x, y, width, height


void setup() {
  fullScreen();
  createBuildings();
  createClouds();
}

void draw() {
  if (isNight) {
    drawNight();
  } else {
    drawDay();
  }
  drawBuildings(); // either night or day 
}

void createBuildings() {
  for (int i = 0; i < buildingHeights.length; i++) {
    buildingHeights[i] = int(random(350, 600)); // for the buildings don't be all at same level
  }
}

void createClouds() {
  for (int i = 0; i < clouds.length; i++) {
    clouds[i][0] = random(width); // x position
    clouds[i][1] = random(100, 150); // y position (higher in the sky)
    clouds[i][2] = random(80, 150); // width
    clouds[i][3] = clouds[i][2] * 0.5; // Height is half of the width
  }
}

void drawNight() {
  background(0); // Black background
  drawStars();
  drawMoon();
}

void drawDay() {
  drawGradient();
  drawClouds();
}

void drawBuildings() {
  int buildingWidth = width / 15;  // Width of each building
  for (int i = 0; i < buildingHeights.length; i++) {
    drawBuilding(i, buildingWidth);
  }
  if (!isNight) { //not night
    drawSun();
  }
}

void drawBuilding(int index, int buildingWidth) {
  int xPosition = index * buildingWidth;
  int buildingHeight = buildingHeights[index]; // Use stored height for buildings
  int yPosition = height - buildingHeight; // Position the building on the bottom of the screen

  stroke(167);
  strokeWeight(3);
  fill(209, 212, 209); // Light gray
  rect(xPosition, yPosition, buildingWidth, buildingHeight);
  drawWindows(xPosition, yPosition, buildingHeight);
}

void drawWindows(int xPosition, int yPosition, int buildingHeight) {
  int windowSize = 20;   // Size of each window
  int windowMargin = 15;  // Margin (gap) between windows
  int numRows = min(15, buildingHeight / (windowSize + windowMargin));
  fill(isNight ? color(255, 255, 102) : color(255)); // Light yellow for night, white fior the day

  for (int row = 0; row < numRows; row++) {
    for (int col = 0; col < 3; col++) {
      int windowX = xPosition + col * (windowSize + windowMargin) + windowMargin;
      int windowY = yPosition + row * (windowSize + windowMargin) + windowMargin;
      rect(windowX, windowY, windowSize, windowSize);
    }
  }
}

void drawClouds() {
  fill(255);
  noStroke();
  for (float[] cloud : clouds) { // Draw clouds using stored positions and sizes
    ellipse(cloud[0], cloud[1], cloud[2], cloud[3]);
    shapeCloudsPuffs(cloud);
  }
}

void shapeCloudsPuffs(float[] cloud) { // The left and right smaller ellipses add roundness, to creating a fluffy effect 
  float puffWidth = cloud[2] * 0.7;
  float puffHeight = cloud[3] * 0.7;
  ellipse(cloud[0] + cloud[2] * 0.3, cloud[1] - cloud[3] * 0.2, puffWidth, puffHeight);
  ellipse(cloud[0] - cloud[2] * 0.3, cloud[1] - cloud[3] * 0.2, puffWidth, puffHeight);
}

void drawGradient() {
  for (int y = 0; y < height; y++) {
    stroke(lerpColor(color(255, 255, 153), color(173, 216, 230), (float)y / height));//light yellow to blue
    line(0, y, width, y); //from top to bottom
  }
}

void drawMoon() {
  fill(255); //white color
  noStroke();
  ellipse(width - 100, 100, 300, 300);
}

void drawStars() {
  fill(255);
  for (int i = 0; i < 50; i++) {
    ellipse(random(width), random(height), 2, 2);
  }
}

void drawSun() {
  noStroke();
  fill(255, 204, 0);
  ellipse(width - 75, 100, 300, 300); 
}

void mousePressed() {
  isNight = !isNight; // Toggle the isNight variable when the mouse is pressed

}