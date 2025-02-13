/*

Name : KATE KEIROZ
Student Number: W20114857.
---------------------------



Brief description:
=================

The night and day city is a illustrate draw I've developed for my Programming Fundamentals  module in my Hidp in Computer Science course. I developed this illustrate draw using processing software sketchbook .



Instructions:
=============

To run the program ;
- dowload the zip file 
- unzip  KateKeiroz folder 
- open processing software
- go to file > Open > "folder KateKeiroz" > code.pde > open
- hit run bottom on top left 

The interactive features in the program is toggle between dat/night, with  the mousePressed event that activate whether a mouse button has been pressed. So when you click within the draw image it changes scene from day to night.



Known bugs/problems:
====================

Problem :

During the development of this work I came across an execution problem when I used the stars method through a loop, it was causing the stars. Every time drawStars() was called (which happens inside drawNight()), new random positions were generated for all 50 stars.
This happens every frame (since draw() runs continuously in Processing).(according to processing documentation https://processing.org/reference/draw_.html).

As a result, the stars appear to be flickering in a fast speed or "moving" because their positions are different every frame.

void drawStars() {
  fill(255);
  for (int i = 0; i < 50; i++) {
    ellipse(random(width), random(height), 2, 2);
  }
}

Fixing the problem :

Stars are now generated once in createStars() inside setup(). Which runs only once at the beginning of the program.
The star positions are stored in an array (stars[][]) instead of being recalculated every frame and when drawStars() method is called, it now uses the positions from the stars array.


float[][] stars = new float[50][2]; // Array to store star positions

void createStars() {
  for (int i = 0; i < stars.length; i++) {
    stars[i][0] = random(width);  // X position
    stars[i][1] = random(height); // Y position
  }
}

void drawStars() {
  fill(255);
  for (float[] star : stars) {
    ellipse(star[0], star[1], 2, 2);
  }
}


Conclusion :

By storing the stars’ positions once and reusing them in drawStars(), the stars become static instead of randomly appearing in different places every frame.




References / sources :
====================
To assist me during the development of this assigment , I have used the following resources :

Resources used to help me in the proper use of arrays : https://www.youtube.com/watch?v=4JzDttgdILQ , https://www.w3schools.com/java/java_arrays.asp and
https://processing.org/reference/Array.html 

Resources used to add random method : https://processing.org/reference/random_.html

Resources used to check how to acess arrays values : https://processing.org/reference/arrayaccess.html

Resources used to check shortcut for writing an if and else structure : https://processing.org/reference/conditional.html

Resources used to help me create gradient color : https://stackoverflow.com/questions/67829059/how-can-i-create-proper-gradient-using-processing and https://processing.org/reference/lerpColor_.html

Resource used to help me to have a good overview of how to code using processing : https://www.youtube.com/watch?v=4JzDttgdILQ 

Resources used to help me understand the sintax od mousePressed method: https://processing.org/reference/mousePressed.html

Resources used to help me have a version control of the changes in my code : https://www.reddit.com/r/github/comments/jufg52/how_can_i_put_a_program_i_made_in_processing_into/

Resources used to create Switch and Ternary operator: https://www.geeksforgeeks.org/java-ternary-operator-with-examples/ and https://dev.to/kaviyak/switch-and-ternary-operator-2cme

Resources used to create a flowchart of the assignment: https://whimsical.com/assignment-1-programming-GHSjE8tsXAALzHXvXaAqAn@3QU9HnCUztRKQYLEJabmaFkVUcfLKXnz8iRYiTD





*/