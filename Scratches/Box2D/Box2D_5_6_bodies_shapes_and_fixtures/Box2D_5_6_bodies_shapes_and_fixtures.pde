// Building a Body in Box2D
//natureofcode.com/book/chapter-5-physics-libraries/

/*" A  body on its own doesn’t physically exist in the world. 
 It’s like a soul with no human form to inhabit. For a body to 
 have mass, we must first define a shape and attach that shape 
 to the body with something known as a fixture"*/

import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
// A reference to our box2d world
Box2DProcessing box2d;
// Make a body definition before making a Body.
BodyDef bd = new BodyDef();
// Define the shape: a polygon.
PolygonShape ps = new PolygonShape(); // Step 1: Define Shape
FixtureDef fd = new FixtureDef(); //Step 2: Define Fixture

void setup() {
  size(300, 300);
  box2d = new Box2DProcessing(this);
  // Initializes a Box2D world with default settings
  box2d.createWorld();
  // A Vec2 in the center of the
  // Processing window converted to Box2D World coordinates!
  Vec2 center = box2d.coordPixelsToWorld(width/2, height/2);
  // Setting the position attribute of the Box2D body definition
  bd.position.set(center);
  // The Body object is created by passing in the Body
  // Definition. (This allows for making multiple bodies from
  // one definition.)
  Body body = box2d.createBody(bd);
  // Setting an arbitrary initial velocity
  body.setLinearVelocity(new Vec2(0, 3));
  // Setting an arbitrary initial angular velocity
  body.setAngularVelocity(1.2);
  //Scale dimensions from pixels to Box2D world.
  float box2Dw = box2d.scalarPixelsToWorld(150);  // Step 1: Define Shape
  float box2Dh = box2d.scalarPixelsToWorld(100);  // Step 1: Define Shape
  // Use setAsBox() function to define shape as a rectangle.
  ps.setAsBox(box2Dw, box2Dh);  // Step 1: Define Shape
  // The fixture is assigned the PolygonShape we just made.
  fd.shape = ps;//Step 2: Define Fixture
  // The coefficient of friction for the
  // shape, typically between 0 and 1
  fd.friction = 0.3;
  // The Shape’s restitution (i.e. elasticity),
  // typically between 0 and 1
  fd.restitution = 0.5;
  // The Shape’s density, measured in
  // kilograms per meter squared
  fd.density = 1.0;

  /* You could also do it this way instead of defining things before setup
   // Step 1. Define the body.
   BodyDef bd = new BodyDef();
   bd.position.set(box2d.coordPixelsToWorld(width/2,height/2));
   // Step 2. Create the body.
   Body body = box2d.createBody(bd);
   // Step 3. Define the shape.
   PolygonShape ps = new PolygonShape();
   float w = box2d.scalarPixelsToWorld(150);
   float h = box2d.scalarPixelsToWorld(100);
   ps.setAsBox(w, h);
   // Step 4. Define the fixture.
   FixtureDef fd = new FixtureDef();
   fd.shape = ps;
   fd.density = 1;
   fd.friction = 0.3;
   fd.restitution = 0.5;
   // Step 5. Attach the shape to the body with the Fixture.
   body.createFixture(fd);*/
}