class Protagonist {
  PVector vPos, vPosStart;
  float fAccel; //0.8 seems real /// never changes
  float fVelocity, fVelocityLimit;
  int nDirec;
  PImage imgHero;
  int nJumpCount = 0;
  boolean bHasTimerStarted;
  // ============== CONSTRUCTOR =============================================
  Protagonist(PVector vTempPos, PVector vTempPosStart, float fTempAccel, float fTempVelocity, int nTempVelocityLimit, int nTempDirec) {
    vPos = vTempPos;
    fAccel = fTempAccel; //0.8 seems real /// never changes
    fVelocity = fTempVelocity;
    fVelocityLimit = nTempVelocityLimit;
    nDirec = nTempDirec;
    vPosStart= vTempPosStart;
    imgHero=loadImage("PixelCrab.png");
    imgHero.resize(60,33);
  }
  // ============== RESET =============================================
  void reset() {
    background(20);
   /* for (int i = alBox.size() - 1; i >= 0; i--) {
      alBox.remove(i);
    }    */   
    bHasTimerStarted=false; 
    bDrawn=false;    
    vPos = new PVector(nBoxSize+2, nLevelHeight-nBoxSize-imgHero.height-2); // the "+2" and "-2" are to avoid being stuck in the ground when you move onto the next level
    fVelocity = 0;
    hero.nDirec=1;
    nJumpCount=0;
    if (nLevel==nMaxLevel) {
     stop();
   }
  }
  // ============== DISPLAY =============================================
  void display() {
    image(imgHero, vPos.x, vPos.y);
  }
  // ============== UPDATE=============================================
  void update() {
    move();
    LvlBase.checkLeftRight();
    gravity();
    LvlBase.checkUpDown();
    display();
   // println(vPos.y);
   // println(fVelocity);
  }
  // ============== MOVE =============================================
  void move() {
    vPosStart.x = vPos.x;
    vPosStart.y = vPos.y;
    if (nDirec==1) { //left
      vPos.x-=6; // to fix the lag had to change from 3 to 6
    }
    if (nDirec==2) { //right
      vPos.x+=6; // to fix the lag had to change from 3 to 6
    }
  }
  // ============== GRAVITY =============================================
  void gravity() {
    fVelocity+=fAccel;
    if (fVelocity>=fVelocityLimit) {
      fVelocity=fVelocityLimit;
    }
    vPos.y+=fVelocity;
  }
  // ============== JUMP =============================================
  void jump() {
    if (nJumpCount==0) { // only let's you jump if you haven't jumped yet
      fVelocity = -21.49; // jump // to fix the lag had to change from 15 to 20
    }
  }
}