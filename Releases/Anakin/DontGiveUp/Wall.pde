class Wall {
  float  fX, fY;
  color c;
  PImage imgWall;
  Wall( float fTempX, float fTempY) {
    fX = fTempX;
    fY = fTempY;
    imgWall=loadImage("Box_give-up2.png");
    ///    c = color(random(255), random(255), random(255), random(255));
  }
  void display() {
    image(imgWall, fX, fY);
    // fill(c);
    //rect( fX, fY, 50, 50);
  }
}