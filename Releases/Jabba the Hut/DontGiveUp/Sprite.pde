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
  PVector[] vD = new PVector[9];
  int nDeg = 0;

  PVector vDirBullet;

  boolean bChangeDir;
  float fMax, fMin;
  int nMinX, nMaxX, nMinY, nMaxY;
  // ============== CONSTRUCTOR =============================================
  Sprite(float fTempX, float fTempY, float fTempAccel, float fTempVelocity, int nTempVelocityLimit, int nTempDirec, String sTempImgName, int nTempMinX, int nTempMaxX, int nTempMinY, int nTempMaxY) {
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
    nMinX = int(fX-nTempMinX);
    nMaxX = int(fX+nTempMaxX);
    nMinY = int(fY-nTempMinY);
    nMaxY = int(fY+nTempMaxY);

    vD[0] = new PVector(0, 0);
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
    vD[8] = new PVector(-6, 6);
  }
  // ============== CONSTRUCTOR FOR BULLETS =============================================
  Sprite(String sTempImgName, PVector _vPos, PVector _vDirBullet) {
    sImgName = sTempImgName;
    img = loadImage(sImgName);
    //img.resize(10, 10);
    vPos = _vPos.copy();

    vDirBullet = _vDirBullet.copy();
  }
  // ============== ADVANCE LEVEL =============================================
  void advanceLevel() {
    respawn(); 
    nLevel++;
    LvlBase.bDrawn=false;    
    if (nLevel==nMaxLevel) {
      exit();
    }
  }
  // ============== RESPAWN =============================================
  void respawn() {
    background(20);
    bHasTimerStarted=false; 
    refreshCoord();
    LvlBase.alGore.add(new Sprite(fX, fY, 0, 0, 0, 0, "alGore.png", 0, 0, 0, 0));
    vPos.set(nBoxSize + 2, nLevelHeight - nBoxSize - img.height - 2);
    fVelocity = 0;
    hero.nDirec=0;
    nJumpCount=0;
    nullAndRecreateBullet();
  }
  // ============== DISPLAY =============================================
  void display() {
    pushMatrix();
    translate(vPos.x, vPos.y);
    if (sImgName == "shurikan.png") {
      nDeg+=20;
      if (nDeg==360) {
        nDeg=0;
      }
      rotate(radians(-nDeg));
      imageMode(CENTER);
      image(img, 0, 0);
      imageMode(CORNER);
    } else {
      /*nDeg+=20;
       rotate(radians(-nDeg));
       imageMode(CENTER);
       image(img, 0, 0);
       imageMode(CORNER);*/
      image(img, 0, 0);
    }
    popMatrix();
  }
  // ============== UPDATE=============================================
  void update() {
    move();
    LvlBase.checkSpikes();
    LvlBase.checkLeftRight();
    gravity();
    LvlBase.checkSpikes();    
    LvlBase.checkSaws();
    LvlBase.updateBullets();
    LvlBase.checkUpDown();
    LvlBase.checkForHitDoors();
    display();
    // println(fY);
    // println(fVelocity);
  }
  // ============== MOVE =============================================
  void move() {
    fXstart = vPos.x;
    fYstart = vPos.y;
    vPos.add(vD[nDirec]);
    refreshCoord();
    /*if (nDirec==1) { //left
     fX-=6; // to fix the lag had to change from 3 to 6
     }
     if (nDirec==2) { //right
     fX+=6; // to fix the lag had to change from 3 to 6
     }*/
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
      soundJump.trigger();
      fVelocity = -21.49; // jump // to fix the lag had to change from 15 to 20
    }
  }
  // ============== UPDATE BULLET SPRITE =============================================
  void updateV() {
    vPos.add(vDirBullet);
    image(img, vPos.x, vPos.y);
    // update nX and nY for collision detection
    refreshCoord();
    //println("Bullet X: "+fX+" Bullet Y: "+fY);
  }
  // ============== REFRESH COORDINATES =============================================
  void refreshCoord() {
    fX = vPos.x;
    fY = vPos.y;
  }
  // ============== UPDATE SAW =============================================
  void updateSaw() {
    changeSawDirec();
    move();
    display();
  }  // ============== CHANGE SAW DIREC =============================================
  void changeSawDirec() {  
    if (LvlBase.isHitDirec(this)) {
      switch(this.nDirec) {
      case 1: 
        this.nDirec=2;
        break;
      case 2: 
        this.nDirec=1;
        break;
      case 3: 
        this.nDirec=4;
        break;
      case 4: 
        this.nDirec=3;
        break;
      case 5: 
        this.nDirec=6;
        break;
      case 6: 
        this.nDirec=5;
        break;
      case 7: 
        this.nDirec=8;
        break;
      case 8: 
        this.nDirec=7;
        break;
      }
    }
  }
}