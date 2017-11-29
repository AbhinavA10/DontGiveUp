class LaserGun {
  PVector vPosGun, vPosPlayer, vDBullet;   
  PImage imgGun, imgLaser;
  float angle;
  int nShotDelay;
  int nTimeSinceTimerStarted;
  int nTimeAtTimerStart = millis();
  // ============== CONSTRUCTOR =============================================
  LaserGun(int nTempX, int nTempY, int nTempShotDelay) {
    vPosGun = new PVector(nTempX, nTempY);
    vPosPlayer = new PVector(hero.fX, hero.fY);
    vDBullet = PVector.sub(vPosPlayer, vPosGun); // original was vDBullet = vPosPlayer.sub(vPosGun); // was really annoying
    imgGun = loadImage("Laser_Gun.png");
    imgLaser= loadImage("laser.png");
    imgLaser.resize(504, 3);
    //imgGun.resize(0, 30);
    imgGun.resize(0, 40);
    angle = 0; 
    nShotDelay=nTempShotDelay;
    nTimeSinceTimerStarted = millis() - nTimeAtTimerStart;
  }
  // ============== SHOOT =============================================
  void shoot() {
    nTimeSinceTimerStarted = millis() - nTimeAtTimerStart;
    if (nTimeSinceTimerStarted >= nShotDelay) {//bulletTimer.isReachedTime()) {
      nTimeAtTimerStart = millis(); 
      LvlBase.alBullets.add(new Sprite("LaserBullet.png", vPosGun, vDBullet)); //(new Sprite("bullet.png", vPosGun, vDBullet));
      soundShoot.trigger();
    }
  }
  // ============== CALC =============================================
  void calc() {    
    vPosPlayer = new PVector(hero.fX+hero.img.width/2, hero.fY+hero.img.height/2);
    vDBullet = PVector.sub(vPosPlayer, vPosGun); 
    vDBullet.normalize();
    vDBullet.mult(10); //Move speed of bullet
    angle = atan2(vPosGun.x-vPosPlayer.x, vPosGun.y-vPosPlayer.y); // should be  atan2(y-x); but that doesn't work and this does?!
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
    rotate(-angle-HALF_PI);
    imageMode(CENTER); 
    //rectMode(CORNER);
    fill(#F5572F, 110);
    noStroke();
    // image (imgLaser, imgLaser.width/2, 0);  // beam
    rect(0, -3, nDiag, 3); // beam
    image(imgGun, imgGun.height/2, 0); 
    imageMode(CORNER); 
    popMatrix();
  }
  // ============== UPDATE =============================================
  void update() {
    calc();
    shoot();
    display();
  }
}