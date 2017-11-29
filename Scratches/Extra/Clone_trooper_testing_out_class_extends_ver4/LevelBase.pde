class LevelBase {
  ArrayList <Box> alBox = new ArrayList<Box>(); // create a new ArrayList
  LevelBase() {
    int nAmount = 100; // max number of boxes
    int fX=0, fY=0; //poisition of the box
    String sDrawDirec = "Right";
    if (bDrawn == false) {
      for (int i= 0; i<nAmount; i++) {
        if (sDrawDirec == "Right") {
          alBox.add(new Box (fX, fY));
          fX+=50;
          if (fX>=nLevelWidth-nBoxSize) { // nBoxSize has to be subtracted from the Width of the level to show the box
            sDrawDirec="Down";
          }
        } else if (sDrawDirec == "Down") {
          alBox.add(new Box (fX, fY));
          fY+=50;
          if (fY>=height) {
            sDrawDirec="Left";
            // println(fX); // used for debugging
          }
        } else if (sDrawDirec == "Left") {
          alBox.add(new Box (fX, fY));
          fX-=50;
          if (fX<=0) {
            sDrawDirec="Up";
          }
        } else if (sDrawDirec == "Up") {
          alBox.add(new Box (fX, fY));
          fY-=50;
          if (fY<=-50) {
            sDrawDirec="none";
          }
        }
      } 
      bDrawn = true;
    }
  }
  // ============== CHECK-UP-DOWN =============================================
  void checkUpDown() {
    for (nI = 0; nI<LvlBase.alBox.size(); nI++) {
      //isHitUpDown(float nX1, float nY1, float nX2, float nY2, int nH1, int nW1, int nH2, int nW2) {
      if (isHitBoxes(hero.vPos.x, hero.vPos.y, LvlBase.alBox.get(nI).fX, LvlBase.alBox.get(nI).fY, hero.imgHero.height, hero.imgHero.width, LvlBase.alBox.get(nI).imgBox.height, LvlBase.alBox.get(nI).imgBox.width)) {
        hero.fVelocity = 0; // reset velocity
        hero.nJumpCount=0; // if you hit the top or bottom of the box, it resets the jump amount
        hero.vPos.y = hero.vPosStart.y;
      }
    }
    checkForHitDoors();
  } 
  // ============== CHECK-LEFT-RIGHT =============================================
  void checkLeftRight() {
    for (nI = 0; nI<LvlBase.alBox.size(); nI++) {
      if (isHitBoxes(hero.vPos.x, hero.vPos.y, LvlBase.alBox.get(nI).fX, LvlBase.alBox.get(nI).fY, hero.imgHero.height, hero.imgHero.width, LvlBase.alBox.get(nI).imgBox.height, LvlBase.alBox.get(nI).imgBox.width)) {
        hero.nDirec=0; // don't move left or right
        hero.vPos.x = hero.vPosStart.x;
      }
    }
    checkForHitDoors();
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
  // ============== CHECK-FOR-HIT-DOORS =============================================
  void checkForHitDoors() {
    if (isHitDoor(hero.vPos.x, hero.vPos.y, entry.fX, entry.fY, hero.imgHero.height, hero.imgHero.width, entry.imgDoor.height, entry.imgDoor.width)) {
      message.sMessageChoice = "HitEntry";
    } else if (isHitDoor(hero.vPos.x, hero.vPos.y, exit.fX, exit.fY, hero.imgHero.height, hero.imgHero.width, exit.imgDoor.height, exit.imgDoor.width)) {
      message.sMessageChoice = "HitExit";
      if (!hero.bHasTimerStarted) {      
        timer.start();
        hero.bHasTimerStarted=true;
      }
      if (timer.isReachedTime()) {
        nLevel++;
        hero.reset();
      }
    } else {
      message.sMessageChoice = "none";
    }
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