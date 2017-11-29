class Protagonist {
  PVector vPos;
  PVector vPosStart;
  float fAccel; //0.8 seems real /// never changes
  float fVelocity, fVelocityLimit;
  boolean canJump;
  int nDirec;
  PImage imgHero;
  int nJumpCount = 0;
  Protagonist(PVector vTempPos, PVector vTempPosStart, float fTempAccel, float fTempVelocity, int nTempVelocityLimit, boolean canTempJump, int nTempDirec) {
    vPos = vTempPos;
    fAccel = fTempAccel; //0.8 seems real /// never changes
    fVelocity = fTempVelocity;
    fVelocityLimit = nTempVelocityLimit;
    canJump = canTempJump;
    nDirec = nTempDirec;
    vPosStart= vTempPosStart;
    imgHero=loadImage("patrick_closer.png");
  }
  void display() {
    image(imgHero, vPos.x, vPos.y);
  }

  void update() {
    move();
    checkLeftRight();
    gravity();
    checkUpDown();
    display();
  }

  void move() {
    vPosStart.x = vPos.x;
    vPosStart.y = vPos.y;
    if (nDirec==1) {
      vPos.x-=2;
    }
    if (nDirec==2) {
      vPos.x+=2;
    }
  }
  void gravity() {
    fVelocity+=fAccel;
    if (fVelocity>=fVelocityLimit) {
      fVelocity=fVelocityLimit;
    }
    vPos.y+=fVelocity;
  }
  void checkUpDown() {
    for (i = 0; i<alWall.size(); i++) {
      //isHitUpDown(float nX1, float nY1, float nX2, float nY2, int nH1, int nW1, int nH2, int nW2) {
      if (isHitUpDown(vPos.x, vPos.y, alWall.get(i).fX, alWall.get(i).fY, imgHero.height, imgHero.width, alWall.get(i).imgWall.height, alWall.get(i).imgWall.width)) {
        fVelocity = 0;
        nJumpCount=0; // if it's hit on bottom, it resets the jump amount
        vPos.y = vPosStart.y;
      }
    }
  }

  void jump() {
    println(canJump);
    if (canJump = true && nJumpCount==0) { // only let's you jump if you haven't jumped yet
      fVelocity = -20;
    }
  }
  void checkLeftRight() {
    for (i = 0; i<alWall.size(); i++) {
      if (isHitLeftRight(vPos.x, vPos.y, alWall.get(i).fX, alWall.get(i).fY, imgHero.height, imgHero.width, alWall.get(i).imgWall.height, alWall.get(i).imgWall.width)) {
        nDirec=0;
        vPos.x = vPosStart.x;
      }
    }
  }
}