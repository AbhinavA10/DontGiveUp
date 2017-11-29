class Box {
  PVector vPos;
  PVector vPosStart;
  String sFileName = "patrick.png";
  float fAccel; //0.8 seems real /// never changes
  float fVelocity, fVelocityLimit;
  boolean canJump;
  int nDirec;
  PImage img;
  int nSize;
  Box(PVector vTempPos, float fTempAccel, float fTempVelocity, int nTempVelocityLimit, boolean canTempJump, int nTempDirec, int tempNsize, PVector vTempPosStart) {
    vPos = vTempPos;
    fAccel = fTempAccel; //0.8 seems real /// never changes
    fVelocity = fTempVelocity;
    fVelocityLimit = nTempVelocityLimit;
    canJump = canTempJump;
    nDirec = nTempDirec;
    vPosStart= vTempPos;
    nSize = tempNsize;
    img=loadImage("patrick.png");
    vPosStart = vTempPosStart;
  }

  void update() {
    move();
    display();
  }

  void display() {
    fill(20, 60, 200);
    rect(vPos.x, vPos.y, nSize, nSize);
  }

  void move() {
    vPosStart.x = vPos.x;
    vPosStart.y = vPos.y;
    if (nDirec==1) {
      vPos.x-=1;
    }
    if (nDirec==2) {
      vPos.x+=1;
    }
    if (nDirec==3) {
      vPos.y-=1;
    }
    if (nDirec==4) {
      vPos.y+=1;
    }
    for (i = 0; i<alWall.size(); i++) {
      if (isHit(box.vPos.x, box.vPos.y, alWall.get(i).fX, alWall.get(i).fY, box.nSize, alWall.get(i).nSize)) {
        box.nDirec=0;
        vPos.x = vPosStart.x;
        vPos.y = vPosStart.y;
      }
    }
  }
}