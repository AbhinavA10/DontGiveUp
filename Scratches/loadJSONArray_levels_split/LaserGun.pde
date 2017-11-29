class LaserGun {
  PVector vPosGun, vPosPlayer, vDBullet;   
  PImage imgGun;
  float fAngle;
  int nShotDelay;
  int nTimeSinceTimerStarted;
  int nTimeAtTimerStart = millis();
  int nDiag = 34;
  // ============== CONSTRUCTOR =============================================
  LaserGun(int nTempX, int nTempY, int nTempShotDelay) {
    vPosGun = new PVector(nTempX, nTempY);
    vPosPlayer = new PVector(mouseX, mouseY);
    imgGun = loadImage("Laser_Gun.png");
    //imgGun.resize(0, 30);
    imgGun.resize(0, 40);
    fAngle = 0;
  }
  // ============== UPDATE =============================================
  void update() {
    calc();
    display();
  }
  // ============== CALCULATE =============================================
  void calc() {    
    vPosPlayer = new PVector(mouseX, mouseY);
    fAngle = atan2(vPosGun.x-vPosPlayer.x, vPosGun.y-vPosPlayer.y); // should be  atan2(y-x); but that doesn't work and this does?!
    /*For the rotation of the image (Function above), we got help from
     https://forum.processing.org/one/topic/need-help-rotating-an-image-to-face-the-mouse.html 
     and
     https://processing.org/reference/atan2_.html
     This part did take a while to figure out as we are not familiar with 'fancy' trig*/
  }
  // ============== DISPLAY =============================================
  void display() { 
    pushMatrix();
    translate(vPosGun.x, vPosGun.y);
    rotate(-fAngle-HALF_PI);
    imageMode(CENTER); 
    //rectMode(CORNER);
    image(imgGun, imgGun.height/2, 0); 
    imageMode(CORNER); 
    popMatrix();
  }
}