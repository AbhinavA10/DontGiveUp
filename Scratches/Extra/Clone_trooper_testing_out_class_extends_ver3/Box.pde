// the main obstacle - boxes
class Box {
  float  fX, fY;
  color c;
  PImage imgBox;
  // ============== CONSTRUCTOR =============================================
  Box( float fTempX, float fTempY) {
    fX = fTempX;
    fY = fTempY;
    imgBox=loadImage("Box_give-up_8Bit_2.png");
  }
  // ============== DISPLAY =============================================
  void display() {
    image(imgBox, fX, fY);
  }
}