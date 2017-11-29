class LaserGun {
  PVector vPosGun, vPosPlayer, vDirBullet;   
  ArrayList <Sprite> alBullets = new ArrayList <Sprite> ();
  PImage img;
  float angle;
  // ============== CONSTRUCTOR =============================================
  LaserGun(int nTempX, int nTempY) {
    vPosGun = new PVector(nTempX, nTempY);
    vPosPlayer = new PVector(hero.fX, hero.fY);
    vDirBullet = PVector.sub(vPosPlayer, vPosGun); // original was vDirBullet = vPosPlayer.sub(vPosGun); // was really annoying
    img = loadImage("Laser_Gun.png");
    img.resize(0, 30);
    angle = atan2(vPosGun.x-vPosPlayer.x, vPosGun.y-vPosPlayer.y); // should be  atan2(y-x); but that doesn't work and this does?!
  }
  // ============== SHOOT =============================================
  void shoot() {
    alBullets.add(new Sprite("bullet.png", vPosGun, vDirBullet)); //(new Sprite("bullet.png", vPosGun, vDirBullet));
    soundShoot.trigger();
  }
  // ============== CALC =============================================
  void calc() {    
    vPosPlayer = new PVector(hero.fX+hero.img.width/2, hero.fY+hero.img.height/2);
    vDirBullet = PVector.sub(vPosPlayer, vPosGun); 
    vDirBullet.normalize();
    vDirBullet.mult(10); //Move speed of bullet
    angle = atan2(vPosGun.x-vPosPlayer.x, vPosGun.y-vPosPlayer.y);
    /*For the rotation of the image (Function above), we got help from
     https://forum.processing.org/one/topic/need-help-rotating-an-image-to-face-the-mouse.html 
     and
     https://processing.org/reference/atan2_.html
     This part did take a while to figure out as we are not familiar with fancy trig*/
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
    rect(0, -2.5, nDiag, 2.5); // beam
    image(img, img.height/2, 0); 
    imageMode(CORNER); 
    popMatrix();
  }
  // ============== UPDATE =============================================
  void update() {
    calc();
    display();
    updateBullets();
  }
  // ============== UPDATE BULLETS =============================================
  void updateBullets() {
    if (bulletTimer.isReachedTime()) {
      shoot();
      bulletTimer.start();
    }
    if (alBullets.size()!=0) {
      for (int nI = alBullets.size()-1; nI>=0; nI--) {
        alBullets.get(nI).updateV();
        if (LvlBase.isHit(alBullets.get(nI), hero)) {
          alBullets.remove(nI);
          soundHit.trigger();
          hero.reset();
          alBullets = new ArrayList <Sprite> ();
          break;
        }   
        if (alBullets.size()!=0) {
          for (int nJ = 0; nJ<LvlBase.alPlat.size(); nJ ++) {
            if (LvlBase.isHit(alBullets.get(nI), LvlBase.alPlat.get(nJ))) {
              alBullets.remove(nI);
              break;
            }
          }
        }
        if (alBullets.size()!=0) {
          for (int nK = 0; nK<LvlBase.alBox.size(); nK ++) {
            println(nI);
            if (LvlBase.isHit(alBullets.get(nI), LvlBase.alBox.get(nK))) {
              alBullets.remove(nI);
              break;
            }
          }
        }
      }
    }
  }
}