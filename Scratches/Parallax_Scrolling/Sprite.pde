class Sprite {
  String sImgName;
  float fX, fY, fYstart, fXstart;
  float fAccel; //0.8 seems real /// never changes
  float fVelocity, fVelocityLimit;
  int nDirec;
  int nJumpCount = 0;  
  float fMax, fMin;
  int nSpeed;

  PVector vPos;  
  PVector[] vD = new PVector[9];
  PImage img;
  // ============== CONSTRUCTOR =============================================
  Sprite(float fTempX, float fTempY, float fTempAccel, float fTempVelocity, int nTempVelocityLimit, int nTempDirec, String sTempImgName, int nTempSpeed) {
    fX = fTempX;
    fY = fTempY;    
    fXstart = fX;
    fYstart = fY;
    vPos = new PVector(fX, fY);
    fAccel = fTempAccel; 
    fVelocity = fTempVelocity;
    fVelocityLimit = nTempVelocityLimit;
    nDirec = nTempDirec;
    sImgName = sTempImgName;
    img=loadImage(sImgName);
    if (sImgName == "PixelCrab.png") {
      img.resize(60, 33);
    }
    nSpeed= abs(nTempSpeed);

    vD[0] = new PVector(0, 0);
    vD[1] = new PVector(nSpeed, 0);
    vD[2] = new PVector(-nSpeed, 0);
    // below is for saws
    // u,d
    vD[3] = new PVector(0, nSpeed);
    vD[4] = new PVector(0, -nSpeed);
    //rd,lu
    vD[5] = new PVector(nSpeed, nSpeed);
    vD[6] = new PVector(-nSpeed, -nSpeed);
    //ru,ld
    vD[7] = new PVector(nSpeed, -nSpeed);
    vD[8] = new PVector(-nSpeed, nSpeed);
  }
  // ============== DISPLAY =============================================
  void display() {
    pushMatrix();
    translate(vPos.x, vPos.y);
    image(img, 0, 0);
    popMatrix();
  }
  // ============== UPDATE=============================================
  void update() {
    move();
    LvlBase.checkLeftRight();
    gravity();
    LvlBase.checkUpDown();
    display();
  } 
  // ============== MOVE =============================================
  void move() {
    fXstart = vPos.x;
    fYstart = vPos.y;
    vPos.add(vD[nDirec]);
    refreshCoord();
  } 
  // ============== GRAVITY =============================================
  void gravity() {
    fVelocity+=fAccel;
    if (fVelocity>=fVelocityLimit) {
      fVelocity=fVelocityLimit;
    }
    vPos.y+=fVelocity;
    refreshCoord();
  }
  // ============== JUMP =============================================
  void jump() {
    if (nJumpCount==0) { // only let's you jump if you haven't jumped yet
      fVelocity = -21.49; // jump // to fix the lag had to change from 15 to 21.49
    }
  }
  // ============== REFRESH COORDINATES =============================================
  void refreshCoord() {
    fX = vPos.x;
    fY = vPos.y;
  }
}