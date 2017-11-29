// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com
import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
// A list for all of our rectangles
ArrayList<Box> boxes;
Box2DProcessing box2d;
void setup() {
  size(640, 360);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  // Create ArrayLists
  boxes = new ArrayList<Box>();
  box2d.setGravity(0, -30);
}

void draw() {
  background(255);
  box2d.step(); // Step through time
  // When the mouse is clicked, add a new Box object
  if (mousePressed) {
    Box p = new Box();
    boxes.add(p);
  }

  // Display all the boxes
  for (Box b : boxes) {
    b.display();
  }
}