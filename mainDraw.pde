void setup() {
 fullScreen();
 noLoop();

}


void draw() {
  background(157, 209 ,244); //by defaut , light blue 

  // DRAW BUILDINGS
  int buildingwidth = width / 15; //width of each building

  // DRAWING 15 BUILDINGS INTO A LOOP
  for(int i = 0; i <15 ; i++){ //incremeting
  int xPosition = i * buildingwidth; // calculate x (horizontal) position of each building
  int buildingHeight = int(random(350,600)); // for the buildings do not be at same level height , so a random height between 350 and 600
  int yPosition = height - buildingHeight;  // Position the building on the bottom of the screen

  }
}