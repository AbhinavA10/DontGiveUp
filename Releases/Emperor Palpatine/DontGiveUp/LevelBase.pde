/*For inheritance, we got help from Mr. Grondin, and the following sites:
 https://processing.org/examples/inheritance.html
 https://processing.org/reference/extends.html
 https://processing.org/reference/super.html*/
class LevelBase {
  ArrayList <Sprite> alBox = new ArrayList<Sprite>(); // create a new ArrayList
  ArrayList <Sprite> alPlat = new ArrayList<Sprite>(); // create a new ArrayList
  ArrayList <Sprite> alSpikes = new ArrayList<Sprite>(); // create a new ArrayList
  int nI; //general variable used for hit testing with the arrayList
  boolean bDrawn = false;// needed for multiple levels and to stop continously adding more boxes/spikes
  // ============== CONSTRUCTOR =============================================
  LevelBase() {
    int nAmount = 100; // max number of boxes
    int fX=0, fY=0; //poisition of the box
    String sDrawDirec = "Right";
    if (bDrawn == false) {
      for (int i= 0; i<nAmount; i++) {
        if (sDrawDirec == "Right") {
          alBox.add(new Sprite (fX, fY, 1.6, 0.6, 16, 0, "box.png"));
          fX+=50;
          if (fX>=nLevelWidth-nBoxSize) { // nBoxSize has to be subtracted from the Width of the level to show the box
            sDrawDirec="Down";
          }
        } else if (sDrawDirec == "Down") {
          alBox.add(new Sprite (fX, fY, 1.6, 0.6, 16, 0, "box.png"));
          fY+=50;
          if (fY>=height) {
            sDrawDirec="Left";
            // println(fX); // used for debugging
          }
        } else if (sDrawDirec == "Left") {
          alBox.add(new Sprite (fX, fY, 1.6, 0.6, 16, 0, "box.png"));
          fX-=50;
          if (fX<=0) {
            sDrawDirec="Up";
          }
        } else if (sDrawDirec == "Up") {
          alBox.add(new Sprite (fX, fY, 1.6, 0.6, 16, 0, "box.png"));
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
      if (isHit(hero, LvlBase.alBox.get(nI))) {
        hero.fVelocity = 0; // reset velocity
        hero.nJumpCount=0; // if you hit the top or bottom of the box, it resets the jump amount
        hero.fY = hero.fYstart;
      }
    }
    if (LvlBase.alPlat.size()!=0) {
      for (nI = 0; nI<LvlBase.alPlat.size(); nI++) {
        //isHitUpDown(float nX1, float nY1, float nX2, float nY2, int nH1, int nW1, int nH2, int nW2) {
        if (isHit(hero, LvlBase.alPlat.get(nI))) {
          hero.fVelocity = 0; // reset velocity
          hero.nJumpCount=0; // if you hit the top or bottom of the box, it resets the jump amount
          hero.fY = hero.fYstart;
        }
      }
    }
  } 
  // ============== CHECK-LEFT-RIGHT =============================================
  void checkLeftRight() { //architecture fix eventually
    for (nI = 0; nI<LvlBase.alBox.size(); nI++) {
      if (isHit(hero, LvlBase.alBox.get(nI))) {
        hero.nDirec=0; // don't move left or right
        hero.fX = hero.fXstart;
      }
    }  
    for (nI = 0; nI<LvlBase.alPlat.size(); nI++) {
      if (isHit(hero, LvlBase.alPlat.get(nI))) {
        hero.nDirec=0; // don't move left or right
        hero.fX = hero.fXstart;
      }
    }
  }
  // ============== CHECK-SPIKES =============================================
  void checkSpikes() { //architecture fix eventually
    for (nI = 0; nI<LvlBase.alSpikes.size(); nI++) {
      if (isHit(hero, LvlBase.alSpikes.get(nI))) {
        hero.reset();
      }
    }
  }
  // ============== CHECK-FOR-HIT-DOORS =============================================
  void checkForHitDoors() {
    if (isHit(hero, entry)) {
      message.sMessageChoice = "HitEntry";
    } else if (isHit(hero, exit)) {
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
  // ============== IS-HIT =============================================
  // original isHit(float nX1, float nY1, float nX2, float nY2, int nH1, int nW1, int nH2, int nW2) { 
  boolean isHit(Sprite one, Sprite two) {
    float fX1, fY1, fX2, fY2;
    int nH1, nW1, nH2, nW2;
    fX1 = one.fX;
    fY1 = one.fY; 
    fX2 = two.fX;
    fY2 = two.fY;
    nH1 = one.img.height;
    nW1 = one.img.width;
    nH2 = two.img.height;
    nW2 = two.img.width;
    if (
      ( ( (fX1 <= fX2) && (fX1+nW1 >= fX2) ) ||
      ( (fX1 >= fX2) && (fX1 <= fX2+nW2) ) )
      &&
      ( ( (fY1 <= fY2) && (fY1+nH1 >= fY2) ) ||
      ( (fY1 >= fY2) && (fY1 <= fY2+nH2) ) )
      )
      return (true) ;
    else
      return(false) ;
  }
}