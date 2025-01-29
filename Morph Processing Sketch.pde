/* 
 * Date: December 23, 2024
 * Author: Jawad F. Naik
 * Class/Professor: Elements of Media / Fred Wolflink
 * Institution: Massachusetts College of Art and Design
 * Location: Boston, Massachusetts, USA
 * 
 * Description:
 * This program demonstrates a morphing effect in Processing. 
 * Multiple shapes (circle, star, triangle, and square) transition 
 * smoothly into each other. Clicking the canvas toggles between 
 * these shapes. 
 * 
 * Features:
 * 1. Click to toggle between morphing shapes (circle, star, triangle, square).
 * 2. Press SPACEBAR to save the current canvas as a screenshot.
 * 3. Press 'R' to record a 10-second GIF of the morphing animation.
 * 
 * The program uses the GifAnimation library for GIF recording. Install the library 
 * through Sketch > Import Library > Add Library > Search for "GifAnimation."
 */

import gifAnimation.*;

// Shape components
ArrayList<PVector> circle = new ArrayList<>();
ArrayList<PVector> star = new ArrayList<>();
ArrayList<PVector> triangle = new ArrayList<>();
ArrayList<PVector> square = new ArrayList<>();
ArrayList<PVector> morph = new ArrayList<>();
int currentShape = 0; // 0: Circle, 1: Star, 2: Triangle, 3: Square
boolean isRecording = false; // Track if recording is active

GifMaker gifExport;
int recordFrames = 0;

void setup() {
  size(800, 800);
  background(0);

  int totalPoints = 200; // Total points for the shapes
  float radius = 300;    // Radius of the shapes

  // Define the circle
  for (int i = 0; i < totalPoints; i++) {
    float angle = map(i, 0, totalPoints, 0, TWO_PI);
    float x = width / 2 + cos(angle) * radius;
    float y = height / 2 + sin(angle) * radius;
    circle.add(new PVector(x, y));
    morph.add(new PVector(x, y)); // Start morphing points as the circle
  }

  // Define the star
  for (int i = 0; i < totalPoints; i++) {
    float angle = map(i, 0, totalPoints, 0, TWO_PI);
    float r = (i % 2 == 0) ? radius : radius / 2; // Alternate outer and inner points
    float x = width / 2 + cos(angle) * r;
    float y = height / 2 + sin(angle) * r;
    star.add(new PVector(x, y));
  }

  // Define the triangle
  for (int i = 0; i < totalPoints; i++) {
    float angle = map(i % 3, 0, 3, 0, TWO_PI); // Use only 3 angles for triangle
    float x = width / 2 + cos(angle) * radius;
    float y = height / 2 + sin(angle) * radius;
    triangle.add(new PVector(x, y));
  }

  // Define the square
  for (int i = 0; i < totalPoints; i++) {
    float segment = totalPoints / 4.0; // Divide into 4 equal sides
    if (i < segment) { // Top side
      float x = map(i, 0, segment, width / 2 - radius, width / 2 + radius);
      float y = height / 2 - radius;
      square.add(new PVector(x, y));
    } else if (i < 2 * segment) { // Right side
      float x = width / 2 + radius;
      float y = map(i, segment, 2 * segment, height / 2 - radius, height / 2 + radius);
      square.add(new PVector(x, y));
    } else if (i < 3 * segment) { // Bottom side
      float x = map(i, 2 * segment, 3 * segment, width / 2 + radius, width / 2 - radius);
      float y = height / 2 + radius;
      square.add(new PVector(x, y));
    } else { // Left side
      float x = width / 2 - radius;
      float y = map(i, 3 * segment, totalPoints, height / 2 + radius, height / 2 - radius);
      square.add(new PVector(x, y));
    }
  }
}

void draw() {
  background(0);

  // Draw the morphing shape
  fill(255, 100, 150);
  noStroke();
  beginShape();
  for (int i = 0; i < morph.size(); i++) {
    PVector v = morph.get(i);
    vertex(v.x, v.y);
  }
  endShape(CLOSE);

  // Update morphing points
  ArrayList<PVector> target;
  switch (currentShape) {
    case 0: target = circle; break;
    case 1: target = star; break;
    case 2: target = triangle; break;
    case 3: target = square; break;
    default: target = circle; break;
  }
  
  for (int i = 0; i < morph.size(); i++) {
    PVector v1 = morph.get(i);
    PVector v2 = target.get(i);
    v1.lerp(v2, 0.1); // Smoothly transition between points
  }

  // Add frames to GIF if recording
  if (isRecording) {
    gifExport.addFrame();
    recordFrames++;
    if (recordFrames >= 300) { // Stop recording after 300 frames (~10 seconds at 30 FPS)
      gifExport.finish();
      isRecording = false;
      println("GIF saved.");
    }
  }

  // Display instructions
  fill(255);
  textAlign(CENTER);
  text("Click to toggle shapes, SPACEBAR to save a screenshot, 'R' to record 10 seconds.", width / 2, height - 20);
}

void mousePressed() {
  // Cycle through shapes
  currentShape = (currentShape + 1) % 4;
}

void keyPressed() {
  if (key == ' ') { // Save screenshot
    saveFrame("screenshot-####.png");
  } else if (key == 'r' || key == 'R') { // Start recording
    if (!isRecording) {
      isRecording = true;
      gifExport = new GifMaker(this, "morph-animation.gif");
      gifExport.setRepeat(0); // Loop forever
      recordFrames = 0;
    }
  }
}
