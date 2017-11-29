class Sprite {
  String sImgName;
  float fX, fY, fYstart, fXstart;
  float fAccel; //0.8 seems real /// never changes
  float fVelocity, fVelocityLimit;
  int nDirec;
  int nJumpCount = 0;  
  float fMax, fMin;
  int nMinX, nMaxX, nMinY, nMaxY, nSpeed;
  int nDeg = 0;
  PVector vPos;  
  PVector[] vD = new PVector[9];
  boolean bHasTimerStarted; // used to delay things (like falling platforms and moving onto the next level)
  boolean bChangeDir;
  PImage img;
  int nDeathCount;
  boolean bMasterMode=false;
  boolean bFlipGravity=false;

  boolean bReachedLR = true;
  boolean bReachedUD = true;  

  boolean bActivateGravity=false;
  int nTimeAtTimerStart, nTimeSinceTimerStarted;
  int nGravityDelay;

  PVector vDirBullet;
  // ============== CONSTRUCTOR =============================================
  Sprite(float fTempX, float fTempY, float fTempAccel, float fTempVelocity, float fTempVelocityLimit, int nTempDirec, String sTempImgName, int nTempMin, int nTempMax, int nTempGravityDelay, int nTempSpeed, boolean bTempFlipGravity) {
    fX = fTempX;
    fY = fTempY;    
    fXstart = fX;
    fYstart = fY;
    vPos = new PVector(fX, fY);
    fAccel = fTempAccel; 
    fVelocity = fTempVelocity;
    fVelocityLimit = fTempVelocityLimit;
    nDirec = nTempDirec;
    nGravityDelay = nTempGravityDelay;
    sImgName = sTempImgName;
    img=loadImage(sImgName);
    if (sImgName.equals("PixelCrab.png")) {
      img.resize(60, 33);
      bActivateGravity=true;
    } else if (sImgName.equals("butterfly.png")) {
      img.resize(40, 22);
    }
    nMinX = round(fX-nTempMin);
    nMaxX = round(fX+nTempMax);
    nMinY = round(fY-nTempMin);
    nMaxY = round(fY+nTempMax);
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
    /*    vD[0] = new PVector(0, 0);
     vD[1] = new PVector(6, 0);
     vD[2] = new PVector(-6, 0);
     // below is for saws
     // u,d
     vD[3] = new PVector(0, 6);
     vD[4] = new PVector(0, -6);
     //rd,lu
     vD[5] = new PVector(6, 6);
     vD[6] = new PVector(-6, -6);
     //ru,ld
     vD[7] = new PVector(6, -6);
     vD[8] = new PVector(-6, 6);*/
    nTimeAtTimerStart = millis();
    bHasTimerStarted=false;
    bFlipGravity=bTempFlipGravity;
  }
  // ============== DISPLAY =============================================
  void display() {
    pushMatrix();
    translate(vPos.x, vPos.y);
    if (sImgName.equals("shurikan.png")) {
      nDeg+=10;
      if (nDeg==360) {
        nDeg=0;
      }
      rotate(radians(-nDeg));
      imageMode(CENTER);
      image(img, 0, 0);
      imageMode(CORNER);
    } else {
      if (bFlipGravity) {
        scale(1, -1); //flip across y axis
        image(img, 0, -img.height);
      } else {
        image(img, 0, 0);
      }
    }
    popMatrix();
  }
  // ============== GRAVITY =============================================
  void gravity() {
    if (bActivateGravity) { 
      if (bFlipGravity) {
        fVelocity-=fAccel;
        if (fVelocity<=-fVelocityLimit) {
          fVelocity=-fVelocityLimit;
        }
      } else {
        fVelocity+=fAccel;
        if (fVelocity>=fVelocityLimit) {
          fVelocity=fVelocityLimit;
        }
      }
      vPos.y+=fVelocity;
      refreshCoord();
    }
  }
  // ============== REFRESH COORDINATES =============================================
  void refreshCoord() {
    fX = vPos.x;
    fY = vPos.y;
  }
}