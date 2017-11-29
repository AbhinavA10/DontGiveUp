class GiveUpButton {
  ArrayList<PImage> alImgMessages = new ArrayList<PImage>(); // all of the images.
  PImage imgButtonDisplayed, imgButtonNormal, imgButtonHover;
  int nX, nY, nMessageY;
  int nCount=0;
  int i = 0;
  boolean bTimerStarted = false;

  PImage imgMessageDisplayed, imgMessageSheet;
  int  W = 0, H = 0; // size of the image

  // ============== CONSTRUCTOR =============================================
  GiveUpButton(int nTempX, int nTempY) {
    imgButtonNormal=loadImage("GiveUp_Button.png");
    imgButtonHover = loadImage("GiveUp_Button_Hover.png");
    imgButtonDisplayed=imgButtonNormal;

    imgMessageSheet=loadImage("all.jpg");
    W = imgMessageSheet.width;
    H = imgMessageSheet.height/10;
    for (int y=0; y< 10; y++) {
      nMessageY = y*H;
      imgMessageDisplayed = imgMessageSheet.get(0, nMessageY, W, H); // get the image of a single card from the sprite sheet
      alImgMessages.add(imgMessageDisplayed);
    }
    nX = nTempX;
    nY = nTempY;
    nCount=0;
  }
  // ============== UPDATE =============================================
  void update() { 
    // background(20);
    image(imgButtonDisplayed, nX, nY);
    if (bTimerStarted) {
      image(imgMessageDisplayed, 0, 0);
      if (buttonTimer.isReachedTime()) {
        if (nCount==10) {
          stop();
        } else {
          bTimerStarted=false;
          soundSoundTrack.loop();
          arSoundMessage[nCount].stop();
        }
      }
    } 
    if (isHitButton(imgButtonHover)) {
      imgButtonDisplayed=imgButtonHover;
    } else {
      imgButtonDisplayed=imgButtonNormal;
    }
  }// ============== GIVE UP BUTTON =============================================
  void giveUpButton() {
    nCount++;
    //println(giveUpButton.nCount);
    soundSoundTrack.pause();
    arSoundMessage[nCount-1].trigger();
    buttonTimer.nTimerLength = arSoundMessage[nCount-1].length();
    buttonTimer.start();
    imgMessageDisplayed = getImage();
    bTimerStarted=true;
  }
  // ============== IS HIT BUTTON =============================================
  boolean isHitButton(PImage img) {
    int nH, nW;
    nH = img.height;
    nW = img.width;
    if (mouseX >= nX && mouseX <= nX+nW && 
      mouseY >= nY && mouseY <= nY + nH) {
      return true;
    } else {
      return false;
    }
  }
  // ============== GET IMAGE =============================================
  PImage getImage() {
    i++;
    if (i-1 == alImgMessages.size()) {
      i=0;
    }
    return alImgMessages.get(i-1);
  }
}