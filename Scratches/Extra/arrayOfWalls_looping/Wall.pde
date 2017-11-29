boolean bDrawn = false;
int nLevel = 1;
ArrayList <Wall> alWall = new ArrayList<Wall>();
int i;
class Wall {
  float  fX, fY;
  // color c;
  PImage imgWall;
  Wall( float fTempX, float fTempY) {
    fX = fTempX;
    fY = fTempY;
    imgWall=loadImage("Box_give-up2.png");
    //imgWall=loadImage("Box_blue_stripes.png");
    //imgWall=loadImage("Box_fractal.png");
    //imgWall=loadImage("Box_trippy_checkers.png");    
    //imgWall=loadImage("Box_trippy_square-spiral.png");
    // c = color(random(255), random(255), random(255), random(255));
  }
  void display() {
    image(imgWall, fX, fY);
    // fill(c);
    // rect( fX, fY, 50, 50);
  }
}