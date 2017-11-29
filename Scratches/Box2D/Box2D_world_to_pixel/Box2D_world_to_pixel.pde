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

void setup() {
  size(300, 300);
  box2d = new Box2DProcessing(this);
  // Initializes a Box2D world with default settings
  box2d.createWorld();
  // To demonstrate, let’s just make up a world position.
  Vec2 worldPos = new Vec2(-10, 2);

  // Convert to pixel space.
  // This is necessary because ultimately we
  // are going to want to draw the elements in our window.
  Vec2 pixelPos = box2d.coordWorldToPixels(worldPos);
  println(pixelPos.x, pixelPos.y);
  ellipse(pixelPos.x, pixelPos.y, 16, 16);
}