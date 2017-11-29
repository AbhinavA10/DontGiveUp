class LevelBase {
  ArrayList <Sprite> alBox = new ArrayList<Sprite>(); // create a new ArrayList
  ArrayList <Sprite> alPlat = new ArrayList<Sprite>(); // create a new ArrayList
  int nI; //general variable used for hit testing with the arrayList 
  LevelBase() {
    int nAmount = 100; // max number of boxes
    int fX=0, fY=0; //poisition of the box
    String sDrawDirec = "Right";
    if (bDrawn == false) {
      for (int i= 0; i<nAmount; i++) {
        if (sDrawDirec == "Right") {
          alBox.add(new Sprite (fX, fY, 0, 0, 1.6, 0.6, 16, 0, "box.png"));
          fX+=50;
          if (fX>=nLevelWidth-nBoxSize) { // nBoxSize has to be subtracted from the Width of the level to show the box
            sDrawDirec="Down";
          }
        } else if (sDrawDirec == "Down") {
          alBox.add(new Sprite (fX, fY, 0, 0, 1.6, 0.6, 16, 0, "box.png"));
          fY+=50;
          if (fY>=height) {
            sDrawDirec="Left";
            // println(fX); // used for debugging
          }
        } else if (sDrawDirec == "Left") {
          alBox.add(new Sprite (fX, fY, 0, 0, 1.6, 0.6, 16, 0, "box.png"));
          fX-=50;
          if (fX<=0) {
            sDrawDirec="Up";
          }
        } else if (sDrawDirec == "Up") {
          alBox.add(new Sprite (fX, fY, 0, 0, 1.6, 0.6, 16, 0, "box.png"));
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
      if (isHitBoxes(hero.fX, hero.fY, LvlBase.alBox.get(nI).fX, LvlBase.alBox.get(nI).fY, hero.img.height, hero.img.width, LvlBase.alBox.get(nI).img.height, LvlBase.alBox.get(nI).img.width)) {
        hero.fVelocity = 0; // reset velocity
        hero.nJumpCount=0; // if you hit the top or bottom of the box, it resets the jump amount
        hero.fY = hero.fYstart;
      }
    }
    if (LvlBase.alPlat.size()!=0) {
      for (nI = 0; nI<LvlBase.alPlat.size(); nI++) {
        //isHitUpDown(float nX1, float nY1, float nX2, float nY2, int nH1, int nW1, int nH2, int nW2) {
        if (isHitBoxes(hero.fX, hero.fY, LvlBase.alPlat.get(nI).fX, LvlBase.alPlat.get(nI).fY, hero.img.height, hero.img.width, LvlBase.alPlat.get(nI).img.height, LvlBase.alPlat.get(nI).img.width)) {
          hero.fVelocity = 0; // reset velocity
          hero.nJumpCount=0; // if you hit the top or bottom of the box, it resets the jump amount
          hero.fY = hero.fYstart;
        }
      }
    }
    checkForHitDoors();
  } 
  // ============== CHECK-LEFT-RIGHT =============================================
  void checkLeftRight() {
    for (nI = 0; nI<LvlBase.alBox.size(); nI++) {
      if (isHitBoxes(hero.fX, hero.fY, LvlBase.alBox.get(nI).fX, LvlBase.alBox.get(nI).fY, hero.img.height, hero.img.width, LvlBase.alBox.get(nI).img.height, LvlBase.alBox.get(nI).img.width)) {
        hero.nDirec=0; // don't move left or right
        hero.fX = hero.fXstart;
      }
    }  
    for (nI = 0; nI<LvlBase.alPlat.size(); nI++) {
      if (isHitBoxes(hero.fX, hero.fY, LvlBase.alPlat.get(nI).fX, LvlBase.alPlat.get(nI).fY, hero.img.height, hero.img.width, LvlBase.alPlat.get(nI).img.height, LvlBase.alPlat.get(nI).img.width)) {
        hero.nDirec=0; // don't move left or right
        hero.fX = hero.fXstart;
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
    if (isHitDoor(hero.fX, hero.fY, entry.fX, entry.fY, hero.img.height, hero.img.width, entry.img.height, entry.img.width)) {
      message.sMessageChoice = "HitEntry";
    } else if (isHitDoor(hero.fX, hero.fY, exit.fX, exit.fY, hero.img.height, hero.img.width, exit.img.height, exit.img.width)) {
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