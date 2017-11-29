class Sprite {
  String sImgName;
  float fX, fY, fYstart, fXstart;
  float fAccel; //0.8 seems real /// never changes
  float fVelocity, fVelocityLimit;
  int nDirec;
  PImage img;
  int nJumpCount = 0;
  boolean bHasTimerStarted;
  PVector vPos;  

  PVector vDirBullet;
  // ============== CONSTRUCTOR =============================================
  Sprite(float fTempX, float fTempY, float fTempAccel, float fTempVelocity, int nTempVelocityLimit, int nTempDirec, String sTempImgName) {
    fX = fTempX;
    fY = fTempY;    
    fXstart = fX;
    fYstart = fY;
    fAccel = fTempAccel; 
    fVelocity = fTempVelocity;
    fVelocityLimit = nTempVelocityLimit;
    nDirec = nTempDirec;
    sImgName = sTempImgName;
    img=loadImage(sImgName);
    if (sImgName == "PixelCrab.png") {
      img.resize(60, 33);
    }
  }
  // ============== CONSTRUCTOR FOR BULLETS =============================================
  Sprite(String sTempImgName, PVector _vPos, PVector _vDirBullet) {
    sImgName = sTempImgName;
    img = loadImage(sImgName);
    img.resize(10, 10);
    vPos = _vPos.copy();

    vDirBullet = _vDirBullet.copy();
  }
  // ============== RESET =============================================
  void reset() {
    background(20);
    bHasTimerStarted=false; 
    LvlBase.bDrawn=false;    
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
    LvlBase.checkSpikes();
    LvlBase.checkLeftRight();
    LvlBase.checkForHitDoors();
    gravity();
    LvlBase.checkSpikes();
    LvlBase.checkUpDown();
    LvlBase.checkForHitDoors();
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
      soundJump.trigger();
      fVelocity = -21.49; // jump // to fix the lag had to change from 15 to 20
    }
  }
  // ============== UPDATE SPRITE WITH VECTORS =============================================
  void updateV() {
    vPos.add(vDirBullet);
    //rotate(radians(fDir));
    image(img, vPos.x, vPos.y);
    // update nX and nY for collision detection
    fX = vPos.x;
    fY = vPos.y;
    //println("Bullet X: "+fX+" Bullet Y: "+fY);
  }
}