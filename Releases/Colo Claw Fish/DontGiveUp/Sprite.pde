class Sprite {
  String sImgName;
  float fX, fY, fYstart, fXstart;
  float fAccel; //0.8 seems real /// never changes
  float fVelocity, fVelocityLimit;
  int nDirec;
  PImage img;
  int nJumpCount = 0;
  boolean bHasTimerStarted;
  // ============== CONSTRUCTOR =============================================
  Sprite(float fTempX, float fTempY, float fTempXstart, float fTempYstart, float fTempAccel, float fTempVelocity, int nTempVelocityLimit, int nTempDirec, String sTempImgName) {
    fX = fTempX;
    fY = fTempY;
    fYstart = fTempYstart;
    fXstart = fTempXstart;
    fAccel = fTempAccel; //0.8 seems real /// never changes
    fVelocity = fTempVelocity;
    fVelocityLimit = nTempVelocityLimit;
    nDirec = nTempDirec;
    sImgName = sTempImgName;
    img=loadImage(sImgName);
    if (sImgName == "PixelCrab.png") {
      img.resize(60, 33);
    }
  }
  // ============== RESET =============================================
  void reset() {
    background(20);
    bHasTimerStarted=false; 
    bDrawn=false;    
    fX = nBoxSize + 2;
    fY = nLevelHeight - nBoxSize - img.height - 2;
    fVelocity = 0;
    hero.nDirec=1;
    nJumpCount=0;
    if (nLevel==nMaxLevel) {
      stop();
    }
  }
  // ============== DISPLAY =============================================
  void display() {
    image(img, fX, fY);
  }
  // ============== UPDATE=============================================
  void update() {
    move();
    LvlBase.checkLeftRight();
    gravity();
    LvlBase.checkUpDown();
    display();
    // println(fY);
    // println(fVelocity);
  }
  // ============== MOVE =============================================
  void move() {
    fXstart = fX;
    fYstart = fY;
    if (nDirec==1) { //left
      fX-=6; // to fix the lag had to change from 3 to 6
    }
    if (nDirec==2) { //right
      fX+=6; // to fix the lag had to change from 3 to 6
    }
  }
  // ============== GRAVITY =============================================
  void gravity() {
    fVelocity+=fAccel;
    if (fVelocity>=fVelocityLimit) {
      fVelocity=fVelocityLimit;
    }
    fY+=fVelocity;
  }
  // ============== JUMP =============================================
  void jump() {
    if (nJumpCount==0) { // only let's you jump if you haven't jumped yet
      fVelocity = -21.49; // jump // to fix the lag had to change from 15 to 20
    }
  }
}