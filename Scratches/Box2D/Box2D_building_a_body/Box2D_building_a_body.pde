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

/*// A Vec2 in the center of the Processing window
 Vec2 center = new Vec2(width/2, height/2);*/
 
 
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
  
  
  /*// To demonstrate, let’s just make up a world position.
   Vec2 worldPos = new Vec2(-10, 2);
   // Convert to pixel space.
   // This is necessary because ultimately we
   // are going to want to draw the elements in our window.
   Vec2 pixelPos = box2d.coordWorldToPixels(worldPos);
   println(pixelPos.x, pixelPos.y);
   ellipse(pixelPos.x, pixelPos.y, 16, 16);*/
}