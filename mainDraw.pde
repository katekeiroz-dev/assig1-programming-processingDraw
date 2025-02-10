void setup() {
 fullScreen();
 noLoop();
 stroke(153);

}


void draw() {
    // ----------------------- DRAW BUILDINGS -------------------------
  background(157, 209 ,244); //by defaut , light blue 
  int buildingwidth = width / 15; //width of each building

   // -----------------------   DRAWING 15 BUILDINGS INTO A LOOP -------------------------
  for(int i = 0; i <15 ; i++){ //incremeting
  int xPosition = i * buildingwidth; // calculate x (horizontal) position of each building
  int buildingHeight = int(random(350,600)); // for the buildings do not be at same level height , so a random height between 350 and 600
  int yPosition = height - buildingHeight;  // Position the building on the bottom of the screen
  fill(209 ,212 ,209);  // light gray color for buildings - defaut day
  rect(xPosition, yPosition, buildingWidth, buildingHeight);
  
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
