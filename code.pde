boolean isNight = false;  // Boolean to check if it's night time
boolean isRaining = false; // Boolean to check if it's raining
int[] buildingHeights = new int[15]; // Array to store building heights
float[][] clouds = new float[5][4]; // Arrays to store cloud positions and sizes: x, y, width, height
float[][] stars = new float[150][2]; // Static stars positions
float[][] raindrops = new float[100][2]; // static array to store raindrops


void setup() {
  fullScreen();
  createBuildings();
  createClouds();
  createStars(); // Generate stars only once
  createRaindrops();
}

void draw() {
  switch (isNight ? 0 : (isRaining ? 1 : 2)) { 
    case 0:// If isNight is true, the expression execute t 0 (night scene) "default".
      drawNight();
      break; // now check if isNight is false, then it checks isRaining
    case 1: // if isNight is false and isRaining true then execute scene 1
      drawDay();
      drawRain();
      break;
    case 2: // then If isRaining is false, execute  2 (normal day scene).
      drawDay();
      break;
  }
  drawBuildings(); // either night or day 
  drawTextOver(); // Draw text overlay on top of everything
}

void drawTextOver() {
  fill(168, 194 ,158); 
  textSize(40);
  textAlign(CENTER, CENTER);
  
  // at the top - my full name
  text("KATE KEIROZ", width / 2, 50);
  
  // at the bottom - my student ID
  fill(0);
  text("W20114857", width / 2, height - 50);
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

void createStars() {
  for (int i = 0; i < stars.length; i++) {
    stars[i][0] = random(width); // x position
    stars[i][1] = random(height); // y position
  }
}

void createRaindrops() {
  for (int i = 0; i < raindrops.length; i++) {
    raindrops[i][0] = random(width);
    raindrops[i][1] = random(100, 200);
  }
}


void drawNight() {
  background(0); // Black background
  drawStars();
  drawMoon();
}

void drawDay() {
  if (isRaining) {
    background(105, 105, 105); // Dark gray background when raining
  } else {
    drawGradient();
  }
  drawClouds();
}

void drawBuildings() {
  int buildingWidth = width / 15;  // Width of each building
  for (int i = 0; i < buildingHeights.length; i++) {
    drawBuilding(i, buildingWidth);
  }
  if (!isNight && !isRaining) { //not night
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
  for (float[] star : stars) {
    ellipse(star[0], star[1], 2, 2);
  }
}

void drawSun() {
  noStroke();
  fill(255, 204, 0);
  ellipse(width - 75, 100, 300, 300); 
}

void drawRain() {
  fill(0, 0, 255);
  for (int i = 0; i < raindrops.length; i++) {
    ellipse(raindrops[i][0], raindrops[i][1], 3, 10);
    raindrops[i][1] += random(4, 10);
    if (raindrops[i][1] > height) {
      raindrops[i][0] = random(width);
      raindrops[i][1] = random(100, 200);
    }
  }
}


void mousePressed() {
  isNight = !isNight; // Toggle the isNight variable when the mouse is pressed
  redraw();

}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    isNight = false;
    isRaining = !isRaining;
  }
}
