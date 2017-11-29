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
    imgWall=loadImage("Box_give-up_8Bit_2.png");
  }
  void display() {
    image(imgWall, fX, fY);
    // fill(c);
    // rect( fX, fY, 50, 50);
  }
  void createBoxes() {
    int nAmount = 80;
    int fX=0, fY=-50;
    String sDrawDirec = "Right";
    if (bDrawn == false) {  
      alWall.add(new Wall (width/2, height/2));
      if (nLevel == 1) {
        for (int i= 0; i<nAmount; i++) {
          if (sDrawDirec == "Right") {
            alWall.add(new Wall (fX, fY));
            fX+=50;        
            if (fX>=width+width/2) {
              sDrawDirec="Down";
            }
          } else if (sDrawDirec == "Down") {
            alWall.add(new Wall (fX, fY));
            fY+=50;        
            if (fY>=height-50) {
              sDrawDirec="Left";
            }
          } else if (sDrawDirec == "Left") {
            alWall.add(new Wall (fX, fY));
            fX-=50;        
            if (fX<=0) {
              sDrawDirec="Up";
            }
          } else if (sDrawDirec == "Up") {
            alWall.add(new Wall (fX, fY));
            fY-=50;        
            if (fY<=0) {
              sDrawDirec="none";
            }
          }
        }
      }
      bDrawn = true;
    }
  }
}