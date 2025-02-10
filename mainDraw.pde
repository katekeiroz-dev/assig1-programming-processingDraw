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
  }
}
