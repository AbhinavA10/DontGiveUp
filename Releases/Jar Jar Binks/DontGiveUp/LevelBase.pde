/*For inheritance, we got help from Mr. Grondin, and the following sites:
 https://processing.org/examples/inheritance.html
 https://processing.org/reference/extends.html
 https://processing.org/reference/super.html*/
class LevelBase {
  ArrayList <Sprite> alFake = new ArrayList <Sprite>();
  ArrayList <Sprite> alBox = new ArrayList<Sprite>(); 
  ArrayList <Sprite> alPlat = new ArrayList<Sprite>(); 
  ArrayList <Sprite> alSpikes = new ArrayList<Sprite>(); 
  ArrayList <Sprite> alSaws = new ArrayList<Sprite>(); 
  ArrayList <Sprite> alBullets = new ArrayList <Sprite> ();
  ArrayList <Sprite> alGore = new ArrayList <Sprite> ();
  ArrayList <LaserGun> alLasers = new ArrayList <LaserGun> ();
  int nI; //general variable used for hit testing with the arrayList
  boolean bDrawn = false;// needed for multiple levels and to stop continously adding more boxes/spikes
  boolean bSkip = false;
  // ============== CONSTRUCTOR =============================================
  LevelBase() {
    int nAmount = 100; // max number of boxes
    int fX=0, fY=0; //poisition of the box
    String sDrawDirec = "Right";
    if (bDrawn == false) {
      for (int i= 0; i<nAmount; i++) {
        if (sDrawDirec == "Right") {
          alBox.add(new Sprite (fX, fY, 1.6, 0.6, 16, 0, "box.png", 0, 0, 0, 0));
          fX+=50;
          if (fX>=nLevelWidth-nBoxSize) { // nBoxSize has to be subtracted from the Width of the level to show the box
            sDrawDirec="Down";
          }
        } else if (sDrawDirec == "Down") {
          alBox.add(new Sprite (fX, fY, 1.6, 0.6, 16, 0, "box.png", 0, 0, 0, 0));
          fY+=50;
          if (fY>=height) {
            sDrawDirec="Left";
            // println(fX); // used for debugging
          }
        } else if (sDrawDirec == "Left") {
          alBox.add(new Sprite (fX, fY, 1.6, 0.6, 16, 0, "box.png", 0, 0, 0, 0));
          fX-=50;
          if (fX<=0) {
            sDrawDirec="Up";
          }
        } else if (sDrawDirec == "Up") {
          alBox.add(new Sprite (fX, fY, 1.6, 0.6, 16, 0, "box.png", 0, 0, 0, 0));
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
    for (nI = 0; nI<alBox.size(); nI++) {
      if (isHit(hero, alBox.get(nI))) {
        hero.fVelocity = 0; // reset velocity
        hero.nJumpCount=0; // if you hit the top or bottom of the box, it resets the jump amount
        hero.vPos.y = hero.fYstart;
      }
    }
    if (alPlat.size()!=0) {
      for (nI = 0; nI<alPlat.size(); nI++) {
        if (isHit(hero, alPlat.get(nI))) {
          hero.fVelocity = 0; // reset velocity
          hero.nJumpCount=0; // if you hit the top or bottom of the box, it resets the jump amount
          hero.vPos.y = hero.fYstart;
        }
      }
    }
  } 
  // ============== CHECK-LEFT-RIGHT =============================================
  void checkLeftRight() { 
    for (nI = 0; nI<alBox.size(); nI++) {
      if (isHit(hero, alBox.get(nI))) {
        hero.vPos.x = hero.fXstart;
      }
    }  
    for (nI = 0; nI<alPlat.size(); nI++) {
      if (isHit(hero, alPlat.get(nI))) {
        hero.vPos.x = hero.fXstart;
      }
    }
  }
  // ============== CHECK-SPIKES =============================================
  void checkSpikes() {
    for (nI = 0; nI<alSpikes.size(); nI++) {
      if (isHit(hero, alSpikes.get(nI))) {
        hero.respawn();
      }
    }
  }
  // ============== CHECK SAWS =============================================
  void checkSaws() {
    for (nI = 0; nI<alSaws.size(); nI++) {  
      if (isHit(hero, alSaws.get(nI))) {
        hero.respawn();
      }
    }
  }
  // ============== CHECK-FOR-HIT-DOORS =============================================
  void checkForHitDoors() {
    if (isHit(hero, entry)) {
    } else if (isHit(hero, exit)) {
      if (!hero.bHasTimerStarted) {      
        timer.start();
        hero.bHasTimerStarted=true;
      }
      if (timer.isReachedTime()) {
        hero.advanceLevel();
      }
    }
  }
  // ============== UPDATE BULLETS =============================================
  void updateBullets() {
    if (alBullets.size()!=0) {
      for (int nI = alBullets.size()-1; nI>=0; nI--) {
        bSkip = false;
        alBullets.get(nI).updateV();
        if (isHit(alBullets.get(nI), hero)) {
          alBullets.remove(nI);
          soundHit.trigger();
          hero.respawn();
          alBullets = null;
          alBullets = new ArrayList <Sprite> ();
          break;
        }
        // fixed
        if (alBullets.size()!=0) {
          for (int nJ = 0; nJ<alPlat.size(); nJ ++) {
            if (isHit(alBullets.get(nI), alPlat.get(nJ))) {
              alBullets.remove(nI);
              bSkip=true;
              // nI--;
              break;
            }
          }
        } 
        if (!bSkip) {
          if (alBullets.size()!=0) {
            for (int nK = 0; nK<alSpikes.size(); nK ++) {
              if (isHit(alBullets.get(nI), alSpikes.get(nK))) {
                alBullets.remove(nI);
                //nI--;
                bSkip=true;
                break;
              }
            }
          }
        }
        if (!bSkip) {
          if (alBullets.size()!=0) {
            for (int nL = 0; nL<alBox.size(); nL ++) {
              if (isHit(alBullets.get(nI), alBox.get(nL))) {
                alBullets.remove(nI);
                //nI--;
                break;
              }
            }
          }
        }
        // original
        /* if (alBullets.size()!=0) {
         for (int nJ = 0; nJ<alPlat.size(); nJ ++) {
         if (isHit(alBullets.get(nI), alPlat.get(nJ))) {
         alBullets.remove(nI);
         // nI--;
         break;
         }
         }
         } 
         if (alBullets.size()!=0) {
         for (int nK = 0; nK<alBox.size(); nK ++) {
         if (isHit(alBullets.get(nI), alBox.get(nK))) {
         alBullets.remove(nI);
         //nI--;
         break;
         }
         }
         }*/
      }
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
  // ============== IS-HIT-DIREC =============================================
  // for the saws
  boolean isHitDirec(Sprite one) {
    float fX, fMinX, fMaxX, fY, fMinY, fMaxY;
    int nDirec;
    nDirec = one.nDirec;
    fX = one.fX;
    fMinX = one.nMinX;
    fMaxX = one.nMaxX;
    fY = one.fY; 
    fMinY = one.nMinY;
    fMaxY = one.nMaxY;
    if (nDirec==1||nDirec==2) {
      if (fX<fMinX||fX>fMaxX) {
        return (true) ;
      } else {
        return(false) ;
      }
    } else if (nDirec==3||nDirec==4) {
      if (fY<fMinY||fY>fMaxY) {
        return (true) ;
      } else {
        return(false) ;
      }
    } else if (nDirec==5||nDirec==6) {
      if ((fX<fMinX && fY<fMinY)||(fX>fMaxX && fY>fMaxY)) {
        return (true) ;
      } else {
        return(false) ;
      }
    } else if (nDirec==7||nDirec==8) {
      if ((fX<fMinX && fY>fMaxY)||(fX>fMaxX && fY<fMinY)) { // has to be weird cuz the direc is weird (ru, ld) and Y is oppisite in pixels
        return (true) ;
      } else {
        return(false) ;
      }
    } else return false;
  }
}