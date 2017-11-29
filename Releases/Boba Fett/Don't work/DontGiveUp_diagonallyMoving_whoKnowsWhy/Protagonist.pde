class Protagonist {
  PVector vPos;
  PVector vPosStart;
  float fAccel; //0.8 seems real /// never changes
  float fVelocity, fVelocityLimit;
  boolean canJump;
  int nDirec;
  PImage img;
  boolean bJump; 
  boolean bHitSide;
  Protagonist(PVector vTempPos, float fTempAccel, float fTempVelocity, int nTempVelocityLimit, boolean canTempJump, int nTempDirec, boolean bTempJump, boolean bTempHitSide) {
    vPos = vTempPos;
    fAccel = fTempAccel; //0.8 seems real /// never changes
    fVelocity = fTempVelocity;
    fVelocityLimit = nTempVelocityLimit;
    canJump = canTempJump; // *-1 on velocity
    nDirec = nTempDirec;
    vPosStart= vTempPos;
    img=loadImage("patrick.png");
    //img.resize(50,50);
    bJump = bTempJump;// checks if hit (if you can jump)
    bHitSide = bTempHitSide;
  }

  void update() {
    move();
    display();
    gravity();
  }

  void gravity() {
    // vPosStart.y=vPos.y;
    //println("Accel "+fAccel+" Velocity "+fVelocity+" vPos "+vPos+" CanJump "+canJump+" nDirec "+nDirec); // debugging
    fVelocity+=fAccel;
    if (canJump) {
      vPos.y-=fVelocity;
      if (fVelocity>=fVelocityLimit) {
        fVelocity*=-1; // slows it down near the top
        canJump=false;
      }
    }
    if (!canJump) {
      checkHit();
      vPos.y+=fVelocity;
    }
    //////stops from falling//
    println(bJump);
  }
  void display() {
    image(img, vPos.x, vPos.y);
  }

  void move() {
    // vPosStart.x = vPos.x;
    if (nDirec==-1) {
      vPos.x-=2;
    }
    if (nDirec==1) {
      vPos.x+=2;
    }
  }

  boolean isHit(float nX1, float nY1, float nX2, float nY2, PImage img1, PImage img2) {

    int nW1 =img1.width;
    int nW2 = img2.width;
    int nH1 = img1.height;
    int nH2 = img2.height;

    if (
      ( ( (nX1 <= nX2) && (nX1+nW1 >= nX2) ) ||
      ( (nX1 >= nX2) && (nX1 <= nX2+nW2) ) )
      &&
      ( ( (nY1 <= nY2) && (nY1+nH1 >= nY2) ) ||
      ( (nY1 >= nY2) && (nY1 <= nY2+nH2) ) )
      ) { 
      println("true");
      return (true) ;
    } else {
      println("false");
      return(false) ;
    }
  }
  void checkHit() {
    for (int i = 0; i< alWall.size(); i ++) {
      if (isHit(vPos.x, vPos.y, alWall.get(i).fX, alWall.get(i).fY, img, alWall.get(i).img)) {
        if (vPos.y < alWall.get(i).fY - alWall.get(i).img.height) {
          fVelocity = 0;
          bJump = true;
          if (nDirec==1||nDirec==-1) {
            // vPos.x=vPosStart.x;
          }
        }
      }
    }
  }
}