class Sprite {
  String sImgName;
  float fX, fY, fYstart, fXstart;
  float fAccel; //0.8 seems real /// never changes
  float fVelocity, fVelocityLimit;
  int nDirec;
  int nJumpCount = 0;  
  float fMax, fMin;
  int nMinX, nMaxX, nMinY, nMaxY, nSpeed;
  int nDeg = 0;
  PVector vPos;  
  PVector[] vD = new PVector[9];
  boolean bHasTimerStarted; // used to delay things (like falling platforms and moving onto the next level)
  boolean bChangeDir;
  PImage img;
  int nDeathCount;
  boolean bMasterMode=false;

  boolean bReachedLR = true;
  boolean bReachedUD = true;  

  boolean bActivateGravity=false;
  int nTimeAtTimerStart, nTimeSinceTimerStarted;
  int nGravityDelay;

  PVector vDirBullet;
  // ============== CONSTRUCTOR =============================================
  Sprite(float fTempX, float fTempY, float fTempAccel, float fTempVelocity, int nTempVelocityLimit, int nTempDirec, String sTempImgName, int nTempMin, int nTempMax, int nTempGravityDelay, int nTempSpeed) {
    fX = fTempX;
    fY = fTempY;    
    fXstart = fX;
    fYstart = fY;
    vPos = new PVector(fX, fY);
    fAccel = fTempAccel; 
    fVelocity = fTempVelocity;
    fVelocityLimit = nTempVelocityLimit;
    nDirec = nTempDirec;
    nGravityDelay = nTempGravityDelay;
    sImgName = sTempImgName;
    img=loadImage(sImgName);
    if (sImgName.equals("PixelCrab.png")) {
      img.resize(60, 33);
      bActivateGravity=true;
    } else if (sImgName.equals("butterfly.png")) {
      img.resize(40, 22);
    }
    nMinX = int(fX-nTempMin);
    nMaxX = int(fX+nTempMax);
    nMinY = int(fY-nTempMin);
    nMaxY = int(fY+nTempMax);
    nSpeed= abs(nTempSpeed);

    vD[0] = new PVector(0, 0);
    vD[1] = new PVector(nSpeed, 0);
    vD[2] = new PVector(-nSpeed, 0);
    // below is for saws
    // u,d
    vD[3] = new PVector(0, nSpeed);
    vD[4] = new PVector(0, -nSpeed);
    //rd,lu
    vD[5] = new PVector(nSpeed, nSpeed);
    vD[6] = new PVector(-nSpeed, -nSpeed);
    //ru,ld
    vD[7] = new PVector(nSpeed, -nSpeed);
    vD[8] = new PVector(-nSpeed, nSpeed);
    /*    vD[0] = new PVector(0, 0);
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
     vD[8] = new PVector(-6, 6);*/
    nTimeAtTimerStart = millis();
    bHasTimerStarted=false;
  }
  // ============== CONSTRUCTOR FOR BULLETS =============================================
  Sprite(String sTempImgName, PVector _vPos, PVector _vDirBullet) {
    sImgName = sTempImgName;
    img = loadImage(sImgName);
    vPos = _vPos.copy();
    vDirBullet = _vDirBullet.copy();
  }
  // ============== ADVANCE LEVEL =============================================
  void advanceLevel() {
    respawn(); 
    nDeathCount--; // to 'hack' around adding a death in respawn
    LvlBase.bDrawn=false;      
    nLevel++;
    if (nLevel==nMaxLevel) {
      exit();
    }
  }
  // ============== RESPAWN =============================================
  void respawn() {
    background(20);
    bHasTimerStarted=false; 
    nDeathCount++;
    refreshCoord();
    if (LvlBase.alGore.size()>10) { // you see, we would have used an array for Al Gore images, but the naming of the arrayList 'alGore" is just too precious.
      LvlBase.alGore.remove(0);
    }
    LvlBase.alGore.add(new Sprite(fX, fY, 0, 0, 0, 0, "alGore.png", 0, 0, 0, 0));
    vPos.set(nBoxSize + 2, nLevelHeight - nBoxSize - img.height - 2);
    fVelocity = 0;
    nDirec=0;
    nJumpCount=0;
    LvlBase.alBullets.clear();   
    refreshCoord();    
    sidekick.vPos.set(nBoxSize + 2, nLevelHeight - 3*nBoxSize); // added to remove sidekick.respawn in levelBase
    sidekick.fXstart = vPos.x;
    sidekick.fYstart = vPos.y;
    sidekick.refreshCoord();
    for (Sprite nI : LvlBase.alFallPlats) {
      nI.vPos.set(nI.fXstart, nI.fYstart);
      nI.bActivateGravity=false;
      nI.bHasTimerStarted=false;
      nI.fVelocity=0;
      nI.refreshCoord();
    }
  }
  // ============== MASTER MODE =============================================
  void masterMode() {
    if (bMasterMode) {
      nLevel=1;
      LvlBase.bDrawn=false;
    }
  }
  // ============== DISPLAY =============================================
  void display() {
    pushMatrix();
    translate(vPos.x, vPos.y);
    if (sImgName.equals("shurikan.png")) {
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
  // ============== UPDATE SIDEKICK =============================================
  void updateSidekick() {
    follow();
    display();
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
  // ============== FOLLOW =============================================
  void follow() {
    for (int i = 0; i < 500; i ++) {
      if (i % 100 == 0) {
        if (bReachedLR == false) {
          if (fX < fXstart) {
            vPos.x ++ ;
          } else if ( fX > fXstart) {
            vPos.x -- ;
          } else { //(fX == fXstart)
            bReachedLR = true;
          }
        } else {
          fXstart = round(hero.fX) + round(random(-50, 50));
          //println("LR" + fXstart);
          bReachedLR = false;
        } 

        if (bReachedUD == false) {
          if (fY < fYstart) {
            vPos.y ++;
          } else if ( fY > fYstart) {
            vPos.y --;
          } else { //(fY == fYstart)
            bReachedUD = true;
          }
        } else {
          fYstart = round(hero.fY) + round(random(-50, 0));
          //println("UD" + fYstart);
          bReachedUD = false;
        }
        refreshCoord();
      }
    }
  }
  // ============== GRAVITY =============================================
  void gravity() {
    if (bActivateGravity && !LvlBase.isOutsideLevel(this)) { 
      fVelocity+=fAccel;
      if (fVelocity>=fVelocityLimit) {
        fVelocity=fVelocityLimit;
      }
      vPos.y+=fVelocity;
      refreshCoord();
    }
  }
  // ============== JUMP =============================================
  void jump() {
    if (nJumpCount==0) { // only let's you jump if you haven't jumped yet
      if (soundMenu.isMuted() == false) {
        soundJump.trigger();
      }
      fVelocity = -21.49; // jump // to fix the lag had to change from 15 to 21.49
    }
  }
  // ============== UPDATE BULLET SPRITE =============================================
  void updateV() {
    vPos.add(vDirBullet);
    image(img, vPos.x, vPos.y);
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
  }  
  // ============== CHANGE SAW DIREC =============================================
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