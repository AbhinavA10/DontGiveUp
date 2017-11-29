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
    imgHero=loadImage("patrick_closer.png");
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
      exit();
   }
  }
  // ============== DISPLAY =============================================
  void display() {
    image(imgHero, vPos.x, vPos.y);
  }
  // ============== UPDATE=============================================
  void update() {
    move();
    checkLeftRight();
    gravity();
    checkUpDown();
    display();
    println(vPos.y);
    println(fVelocity);
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
  // ============== CHECK-UP-DOWN =============================================
  void checkUpDown() {
    for (nI = 0; nI<alBox.size(); nI++) {
      //isHitUpDown(float nX1, float nY1, float nX2, float nY2, int nH1, int nW1, int nH2, int nW2) {
      if (isHitBoxes(vPos.x, vPos.y, alBox.get(nI).fX, alBox.get(nI).fY, imgHero.height, imgHero.width, alBox.get(nI).imgBox.height, alBox.get(nI).imgBox.width)) {
        fVelocity = 0; // reset velocity
        nJumpCount=0; // if you hit the top or bottom of the box, it resets the jump amount
        vPos.y = vPosStart.y;
      }
    }
    checkForHitDoors();
  } 
  // ============== CHECK-LEFT-RIGHT =============================================
  void checkLeftRight() {
    for (nI = 0; nI<alBox.size(); nI++) {
      if (isHitBoxes(vPos.x, vPos.y, alBox.get(nI).fX, alBox.get(nI).fY, imgHero.height, imgHero.width, alBox.get(nI).imgBox.height, alBox.get(nI).imgBox.width)) {
        nDirec=0; // don't move left or right
        vPos.x = vPosStart.x;
      }
    }
    checkForHitDoors();
  }
  // ============== CHECK-FOR-HIT-DOORS =============================================
  void checkForHitDoors() {
    if (isHitDoor(vPos.x, vPos.y, entry.fX, entry.fY, imgHero.height, imgHero.width, entry.imgDoor.height, entry.imgDoor.width)) {
      message.sMessageChoice = "HitEntry";
    } else if (isHitDoor(vPos.x, vPos.y, exit.fX, exit.fY, imgHero.height, imgHero.width, exit.imgDoor.height, exit.imgDoor.width)) {
      message.sMessageChoice = "HitExit";
      if (!bHasTimerStarted) {      
        timer.start();
        bHasTimerStarted=true;
      }
      if (timer.isReachedTime()) {
        nLevel++;
        reset();
      }
    } else {
      message.sMessageChoice = "none";
    }
  }
  // ============== IS-HIT-BOXES =============================================
  boolean isHitBoxes(float nX1, float nY1, float nX2, float nY2, int nH1, int nW1, int nH2, int nW2) { 
    if (
      ( ( (nX1 <= nX2) && (nX1+nW1 >= nX2) ) ||
      ( (nX1 >= nX2) && (nX1 <= nX2+nW2) ) )
      &&
      ( ( (nY1 <= nY2) && (nY1+nH1 >= nY2) ) ||
      ( (nY1 >= nY2) && (nY1 <= nY2+nH2) ) )
      )
      return (true) ;
    else
      return(false) ;
  }
  // ============== IS-HIT-DOOR =============================================
  boolean isHitDoor(float nX1, float nY1, float nX2, float nY2, int nH1, int nW1, int nH2, int nW2) { 
    if (
      ( ( (nX1 <= nX2) && (nX1+nW1 >= nX2) ) ||
      ( (nX1 >= nX2) && (nX1 <= nX2+nW2) ) )
      &&
      ( ( (nY1 <= nY2) && (nY1+nH1 >= nY2) ) ||
      ( (nY1 >= nY2) && (nY1 <= nY2+nH2) ) )
      )
      return (true) ;
    else
      return(false) ;
  }
}