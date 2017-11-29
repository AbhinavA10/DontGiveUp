class Menu {
  PImage imgSound, imgSoundOff, imgSoundOn;
  float fXSoundButton, fYSoundButton;
  PImage imgGear;
  float fXGear, fYGear;
  int nAngleGear = 0, nAngleGearCount;
  PImage imgCredits;
  float fXCredits, fYCredits;
  // ============== CONSTRUCTOR =============================================
  Menu() {
    imgSoundOn = loadImage("soundOn.png");
    imgSoundOff = loadImage("soundOff.png");
    imgSoundOn.resize(35, 35);
    imgSoundOff.resize(35, 35);
    imgSound=imgSoundOn;
    fXSoundButton = width / 8 * 5.5;
    fYSoundButton = (height / 8 * 3.6)-imgSound.height/2 + 3;
    imgGear=loadImage("gear_settings.png");
    fXGear = width / 8 * 5.5-imgGear.width/2;
    fYGear = height / 2+15-imgGear.height/2;
    //fYGear = (height / 7 * 3.6)-imgSound.height/2 + 3;
    imgCredits=loadImage("credits.png");
    fXCredits = width / 8 * 5.5 -imgCredits.width/2;
    fYCredits = (height / 7 * 4.2)-imgSound.height/2 + 3;
  }
  // ============== UPDATE=============================================
  void update() { 
    if (nScreen == 0) {
      background(20);
      textFont(font8Bit, 42); 
      textAlign(CENTER, CENTER);
      fill(255);
      text("DON'T GIVE UP", width / 2, height /2 - 50);
      textSize(14);
      text("Press 's' for settings", width / 2, height / 2+15);
      text("Press 'c' credits", width / 2, height / 2+55);
      textSize(18);
      text("press ENTER to begin", width / 2, height / 2+105);
      image(imgCredits, fXCredits, fYCredits);

      pushMatrix();
      translate(fXGear+imgGear.width/2, fYGear+imgGear.height/2);
      rotate(radians(nAngleGear));
      imageMode(CENTER);
      image(imgGear, 0, 0);
      imageMode(CORNER);
      popMatrix();

      if (isHitButton(imgCredits, fXCredits, fYCredits)) {
        noFill();
        stroke(200);
        rect(fXCredits-5, fYCredits-5, imgCredits.width+10, imgCredits.height+10);
        fill(255);
      }
      if (isHitButton(imgGear, fXGear, fYGear)) {
        nAngleGear+=10;
        if (nAngleGear>=200) {
          nAngleGear=280;
        }
        noFill();
        stroke(200);
        rect(fXGear-5, fYGear-5, imgGear.width+10, imgGear.height+10);
        fill(255);
      } else {        
        nAngleGear-=10;
        if (nAngleGear<=0) {
          nAngleGear=0;
        }
      }
    } else if (nScreen == 1) {
      background(20);
      textFont(font8Bit, 42);
      fill(255);
      textAlign(CENTER, CENTER);
      text("SETTINGS", width / 2, height / 8 * 2);
      textSize(18);
      textAlign(LEFT, TOP);
      text("TOGGLE MUSIC - PRESS M", width / 3.5, height / 8 * 3.6); 
      textAlign(CENTER, CENTER);
      textSize(24);
      text("Press BACKSPACE to go back", width / 2, height / 8 * 6.2);
      if (isHitButton(imgSound, fXSoundButton, fYSoundButton)) {
        noFill();
        stroke(200);
        rect(fXSoundButton-5, fYSoundButton-5, imgSound.width+10, imgSound.height+10);
        fill(255);
      }
      image(imgSound, fXSoundButton, fYSoundButton);
    } else if (nScreen == 2) {
      background(20);
      textAlign(CENTER, CENTER);
      textSize(42);
      text("CREDITS", width / 2, height / 8 * 2);
      textSize(18);
      text("By Abhinav Agrahari and Matthew Meade", width / 2, height / 8 * 4.2);
      textSize(24);
      text("Press BACKSPACE to go back", width / 2, height / 8 * 6.2);
    }
  }
  // ============== MOUSE =============================================
  void mouse() {  
    if (isHitButton(imgSound, fXSoundButton, fYSoundButton)) {
      if (soundMenu.isMuted()) {
        soundMenu.unmute();        
        imgSound=imgSoundOn;
      } else {
        soundMenu.mute();        
        imgSound=imgSoundOff;
      }
    }    
    if (isHitButton(imgGear, fXGear, fYGear)) {
      nScreen=1;
    } 
    if (isHitButton(imgCredits, fXCredits, fYCredits)) {
      nScreen=2;
    }
  }
  // ============== KEY =============================================
  void key() {    
    if (key == 'm' || key == 'M') {
      if (soundMenu.isMuted()) {
        soundMenu.unmute();        
        imgSound=imgSoundOn;
      } else {
        soundMenu.mute();        
        imgSound=imgSoundOff;
      }
    }
  }
}