class Sprite {
  ArrayList<PImage> alHero = new ArrayList<PImage>(); // all of the images.
  PImage img, spriteSheet;
  int  W, H; // size of the image
  int i = 0, nX, nY;
  boolean bFinished = false;
  int nCount;
  Sprite(int nTempX, int nTempY) {
    /* spriteSheet = loadImage("explosion2.png");
     W = spriteSheet.width/6;
     H = spriteSheet.height/3; 
     for (int y=0; y< 3; y++) {
     for (int x=0; x<5; x++) {
     nX = x*W;
     nY = y*H;
     img = spriteSheet.get(nX, nY, W, H); // get the image of a single card from the sprite sheet
     alHero.add(img);
     }
     }
     nX=nTempX;
     nY=nTempY;
     }
     PImage getImage() {
     i++;
     if (i>= 13) {
     bFinished = true;
     i=12;
     }
     return alHero.get(i);
     }
     void update() {
     nCount++;
     if (nCount==3) {
     img = getImage();
     nCount=0;
     }
     imageMode(CENTER); 
     image(img, nX, nY-img.height/4);
     }*/    spriteSheet = loadImage("explosionSheet.png");
    W = spriteSheet.width/5;
    H = spriteSheet.height/3; 
    for (int y=0; y< 3; y++) {
      for (int x=0; x<5; x++) {
        nX = x*W;
        nY = y*H;
        img = spriteSheet.get(nX, nY, W, H); // get the image of a single card from the sprite sheet
        alHero.add(img);
      }
    }
    nX=nTempX;
    nY=nTempY;
  }
  PImage getImage() {
    i++;
    if (i== alHero.size()) {
      bFinished = true;
      i=5;
    }
    return alHero.get(i);
  }
  void update() {
    nCount++;
    if (nCount==3) {
      img = getImage();
      nCount=0;
    }
    imageMode(CENTER); 
    image(img, nX, nY-img.height/4);
  }
}