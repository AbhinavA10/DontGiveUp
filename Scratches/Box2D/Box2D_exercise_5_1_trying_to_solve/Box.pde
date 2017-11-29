// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// A rectangular box
class Box {

  Body body;
  //float x,y; // - dont need anymore
  float w, h;

  // Constructor
  Box() {
    w = 16;
    h = 16;

    // Build body.
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(mouseX, mouseY));
    body = box2d.createBody(bd);

    // Build shape.
    PolygonShape ps = new PolygonShape();
    //[full] Box2D considers the width and height of a rectangle to be the distance from the center to the edge (so half of what we normally think of as width or height).
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    //[end]
    ps.setAsBox(box2dW, box2dH);

    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.density = 1;
    // Set physics parameters.
    fd.friction = 0.3;
    fd.restitution = 0.5;

    // Attach the Shape to the Body with the Fixture.
    body.createFixture(fd);
  }

  // Drawing the box
  void display() {
    //[full] We need the Body’s location and angle.
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    //[end]

    pushMatrix();
    // Using the Vec2 position and float angle to translate and rotate the rectangle
    translate(pos.x, pos.y);
    rotate(-a);
    fill(175);
    stroke(0);
    rectMode(CENTER);
    rect(0, 0, w, h);
    popMatrix();
  }  
  // This function removes a body from the Box2D world.
  void killBody() {
    box2d.destroyBody(body);
  }
}