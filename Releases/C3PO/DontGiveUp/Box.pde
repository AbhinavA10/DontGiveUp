class Box {
  float  fX, fY;
  color c;
  PImage imgBox;
  Box( float fTempX, float fTempY) {
    fX = fTempX;
    fY = fTempY;
    imgBox=loadImage("Box_give-up_8Bit_2.png");
  }
  void display() {
    image(imgBox, fX, fY);
  }
}