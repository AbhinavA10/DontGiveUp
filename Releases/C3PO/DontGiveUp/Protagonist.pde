class Protagonist {
  PVector vPos, vPosStart;
  float fAccel; //0.8 seems real /// never changes
  float fVelocity, fVelocityLimit;
  int nDirec;
  PImage imgHero;
  int nJumpCount = 0;
  Protagonist(PVector vTempPos, PVector vTempPosStart, float fTempAccel, float fTempVelocity, int nTempVelocityLimit, boolean canTempJump, int nTempDirec) {
    vPos = vTempPos;
    fAccel = fTempAccel; //0.8 seems real /// never changes
    fVelocity = fTempVelocity;
    fVelocityLimit = nTempVelocityLimit;
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
    if (nDirec==1) { //left
      vPos.x-=3;
    }
    if (nDirec==2) { //right
      vPos.x+=3;
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
    for (nI = 0; nI<alBox.size(); nI++) {
      //isHitUpDown(float nX1, float nY1, float nX2, float nY2, int nH1, int nW1, int nH2, int nW2) {
      if (isHitBoxes(vPos.x, vPos.y, alBox.get(nI).fX, alBox.get(nI).fY, imgHero.height, imgHero.width, alBox.get(nI).imgBox.height, alBox.get(nI).imgBox.width)) {
        fVelocity = 0; // reset velocity
        nJumpCount=0; // if you hit the top or bottom of the box, it resets the jump amount
        vPos.y = vPosStart.y;
      }
    }
  }

  void jump() {
    if (nJumpCount==0) { // only let's you jump if you haven't jumped yet
      fVelocity = -15; // jump
    }
  }
  void checkLeftRight() {
    for (nI = 0; nI<alBox.size(); nI++) {
      if (isHitBoxes(vPos.x, vPos.y, alBox.get(nI).fX, alBox.get(nI).fY, imgHero.height, imgHero.width, alBox.get(nI).imgBox.height, alBox.get(nI).imgBox.width)) {
        nDirec=0; // don't move left or right
        vPos.x = vPosStart.x;
      }
    }
  }
}