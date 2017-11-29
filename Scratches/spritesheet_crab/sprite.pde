class Sprite {
  ArrayList<PImage> alHero = new ArrayList<PImage>(); // all of the images.
  PImage img, spriteSheet;
  int  W = 0, H= 0; // size of the image
  int i = 0, nX, nY;
  int nYStart;
  float fAccel=0.8; 
  float fVelocity=0.8;
  float fVelocityLimit = 16;
  int nCount; // to control the speed of the animation
  int nDirec=0; //-1 is left, 1 is right
  int nLastDirec=0; 
  int jumpCount = 0;
  //PImage img;
  Sprite() {
    spriteSheet = loadImage("CrabSprite.png");
    W = spriteSheet.width/4;
    H = spriteSheet.height; 
    for (int y=0; y< 1; y++) {
      for (int x=0; x<4; x++) {
        nX = x*W;
        nY = y*H;
        img = spriteSheet.get(nX, nY, W, H); // get the image of a single card from the sprite sheet
        alHero.add(img);
      }
    }
    nX = width/2;
    nY = 10;
  }
  PImage getImage() {
    i++;
    if (i== alHero.size()) {
      i=0;
    }
    if (nDirec==0) {
      i = 0;
    }
    return alHero.get(i);
  }
  void update() {  
    nCount++;
    if (nCount==7) {
      img = sprHero.getImage();
      nCount = 0;
    }
    if (nDirec ==-1) {    
      pushMatrix();
      // flip across x axis
      scale(-1, 1);
      image(img, -(nX + img.width), nY);
      popMatrix();
      nX-=3;
    } 
    if (nDirec ==1) {
      image(img, nX, nY); // original is going right
      nX+=3;
    }
    if (nDirec==0) {      
      img = sprHero.getImage();
      if (nLastDirec==-1) {
        pushMatrix();
        // flip across x axis
        scale(-1, 1);
        image(img, -(nX + img.width), nY);
        popMatrix();
      } else {
        image(img, nX, nY);
      }
    }
    nYStart=nY;
    fVelocity+=fAccel;
    if (fVelocity>=fVelocityLimit) {
      fVelocity=fVelocityLimit;
    }
    nY+=fVelocity;

    if (isHit(nY)) {
      nY=nYStart;
      fVelocity=0;
      sprHero.jumpCount=0;
    }
  }

  //===== checks how low Y is =====//
  boolean isHit(float nY) {
    if (nY+sprHero.img.height>=(height-100)) {
      return true;
    } else {
      return false;
    }
  }
}