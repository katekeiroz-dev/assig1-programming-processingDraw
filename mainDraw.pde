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


  // -----------------------  DRAW WINDOWNS -------------------------
    int windowSize = 20;    // Size of each windows
    int windowMargin = 15;  // Margin (gap) between windows
    
    fill(255); // White color for inside windows - defaut
    drawWindows(xPosition, yPosition, buildingHeight, windowSize, windowMargin);// call method drawingWindow, passing parameters

      //draw sun
   fill(255, 204, 0);
   int sunDiameter = 400;  // Diameter of the sun
   int sunX = width - sunDiameter / 4 - 20;  // Position the sun near the right edge
   int sunY = 100;  // Position of the sun from the top
   ellipse(sunX, sunY, sunDiameter, sunDiameter);  // Draw the sun

  }
}


// ----------------------- METHOD/function TO DRAW THE WINDOWS IN EACH BUILDING  -------------------------
void drawWindows(int xPosition, int yPosition, int buildingHeight, int windowSize, int windowMargin) {
  int numRows = 15; // Rows of windows
  int numCols = 3; // Columns of windows

  int maxRows = buildingHeight ;  // Calculate the maximum number of rows that fit inside the building height
    if (numRows >= maxRows) {
     numRows = maxRows; // Adjustingh rows if there are too many windows for the building height
   }
// -----------------------   DRAWING WINDOWNS INTO A LOOP (through rows and columns) -------------------------

  for (int row = 0; row < numRows; row++) {
    for (int col = 0; col < numCols; col++) {
      int windowX = xPosition + col * (windowSize + windowMargin) + windowMargin;  // X(horizontal) position of window + margin gap
      int windowY = yPosition + row * (windowSize + windowMargin) + windowMargin; // Y(vertical) position of window + margin gap
      rect(windowX, windowY, windowSize, windowSize);  // Draw each square window
    }
  }
}
