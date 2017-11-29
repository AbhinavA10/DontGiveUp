class Wall {
  float  fX, fY;
  color c;
  PImage img;
  Wall( float fTempX, float fTempY) {
    fX = fTempX;
    fY = fTempY;
    img=loadImage("Box_give-up_8Bit.png");
    ///    c = color(random(255), random(255), random(255), random(255));
  }
  void display() {
    image(img, fX, fY);
  }
}