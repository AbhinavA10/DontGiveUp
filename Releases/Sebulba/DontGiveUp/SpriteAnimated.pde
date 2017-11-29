class SpriteAnimated extends Sprite {
  ArrayList<PImage> alImages = new ArrayList<PImage>(); // all of the images.
  PImage imgSpriteSheet;
  int nI = 0;
  int nCount=0;
  int nMaxCount=0;
  int nLastDirec=0; // only needed to keep the animations facing the same way
  int nX=0, nY=0;
  // ============== CONSTRUCTOR =============================================
  SpriteAnimated(float fTempX, float fTempY, float fTempAccel, float fTempVelocity, int nTempVelocityLimit, int nTempDirec, String sTempImgName, int nTempMin, int nTempMax, int nTempGravityDelay, int nTempSpeed, boolean bTempFlipGravity, int nImgsWide, int nImgsHigh, int nTempMaxCount) {
    super(fTempX, fTempY, fTempAccel, fTempVelocity, nTempVelocityLimit, nTempDirec, sTempImgName, nTempMin, nTempMax, nTempGravityDelay, nTempSpeed, bTempFlipGravity);
    imgSpriteSheet = loadImage(sImgName);
    if (sImgName.equals("PixelCrab.png")) {
      bActivateGravity=true;
      imgSpriteSheet.resize(240, 33);
    }
    nMaxCount=nTempMaxCount;
    int nW = imgSpriteSheet.width/nImgsWide;
    int nH = imgSpriteSheet.height/nImgsHigh;
    for (int y=0; y< nImgsHigh; y++) {
      for (int x=0; x<nImgsWide; x++) {
        nX = x*nW;        
        nY = y*nH;
        img = imgSpriteSheet.get(nX, nY, nW, nH); // get the image of a single card from the sprite sheet
        alImages.add(img);
      }
    }
  }
  // ============== DISPLAY =============================================
  void display() {
    nCount++;
    if (nCount==nMaxCount) {
      img = getImage();
      nCount = 0;
    }
    pushMatrix();
    translate(vPos.x, vPos.y);
    if (nDirec ==2) {   
      if (bFlipGravity) {
        scale(-1, -1); //flip across y axis
        image(img, -img.width, -img.height);
      } else { 
        // flip across x axis
        scale(-1, 1);
        image(img, -img.width, 0);
      }
    } else if (nDirec ==1) { //1 is right, 2 is left
      if (bFlipGravity) {
        scale(1, -1); //flip across y axis
        image(img, 0, -img.height);
      } else {
        image(img, 0, 0); // original is going right
      }
    } else if (nDirec==0) {      
      img = sprHero.getImage();
      if (nLastDirec==2) {
        if (bFlipGravity) {
          scale(-1, -1); //flip across y axis
          image(img, -img.width, -img.height);
        } else {
          // flip across x axis
          scale(-1, 1);
          image(img, -img.width, 0);
        }
      } else {
        if (bFlipGravity) {
          scale(1, -1); //flip across y axis
          image(img, 0, -img.height);
        } else {
          image(img, 0, 0);
        }
      }
    }    /*
    if (bFlipGravity) {
     scale(1, -1); //flip across y axis
     image(img, 0, -img.height);
     }  */

    popMatrix();
  }  
  PImage getImage() {
    nI++;
    if (sImgName.equals("PixelCrab.png")) {
      if (nDirec==0) {
        nI = 0;
      }
    }
    if (sImgName.equals("butterfly2.png")) {
      if (nI== 73) {
        nI=0;
      }
    }
    if (nI== alImages.size()) {
      nI=0;
    }

    return alImages.get(nI);
  }
}