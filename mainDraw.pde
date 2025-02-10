void setup() {
 fullScreen();
 noLoop();

}


void draw() {
  background(157, 209 ,244); //by defaut , light blue 

  // DRAW BUILDINGS
  int buildingWidth = width / 15;  // Width of each building
  int windowSize = 20;             // Size of each windows
  int windowMargin = 15;            // Margin between windows
  
  // Loop to draw 15 buildings
  for (int i = 0; i < 15; i++) {
    int xPos = i * buildingWidth;  // Calculate x position of each building
    int buildingHeight = int(random(250, 550));  // Random height between 250 and 550
    int yPos = height - buildingHeight;  // Position the building on the bottom of the canvas
    
    // Draw building (rectangular block)
    fill(209 ,212 ,209);  // light gray color for buildings - defaut day
    rect(xPos, yPos, buildingWidth, buildingHeight);
    
    // Draw windows using a separate loop for better clarity and control
    fill(255);
    // White color for windows
    drawWindows(xPos, yPos, buildingHeight, windowSize, windowMargin);
  }
}

// Function to draw windows in each building
void drawWindows(int xPos, int yPos, int buildingHeight, int windowSize, int windowMargin) {
  int numRows = 15; // Rows of windows
  int numCols = 3; // Columns of windows
  
  // Calculate the maximum number of rows that fit inside the building height
  int maxRows = buildingHeight / (windowSize + windowMargin);
  if (numRows > maxRows) {
    numRows = maxRows; // Adjust rows if there are too many windows for the building height
  }

  // Loop through rows and columns to draw the windows
  for (int row = 0; row < numRows; row++) {
    for (int col = 0; col < numCols; col++) {
      int windowX = xPos + col * (windowSize + windowMargin) + windowMargin;  // X position of window
      int windowY = yPos + row * (windowSize + windowMargin) + windowMargin; // Y position of window
      rect(windowX, windowY, windowSize, windowSize);  // Draw each window
    }
  }
}
