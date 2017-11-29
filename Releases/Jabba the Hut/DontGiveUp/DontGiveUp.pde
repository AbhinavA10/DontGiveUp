// Release 5.0 - Jabba the Hut - Al Gore!

/* NOTE: You will have to download the Minim library:
 At the top of the processing window, click on Sketch -> Import Library
 -> Add Library. Then search for Minim and click Install.
 */

import ddf.minim.*;
// ============== MINIM SETUP =========================================================
/* Everything to do with Minim can be found at the following links:
 http://code.compartmental.net/minim/
 http://code.compartmental.net/tools/minim/quickstart/
 */
Minim minim;
AudioPlayer soundSoundTrack;
AudioSample soundJump;
AudioSample soundShoot;
AudioSample soundHit;
AudioSample[] soundMessage ;

// ============== GLOBAL/INTIAL VARIABLES =============================================
int nLevel = 1 ; // the level number
int nMaxLevel = 43; // 42 is the last level
int nBoxSize = 50; //width of a box
int nLevelHeight, nLevelWidth; // for only scrolling till the edge of the level  
float fXCamOffset = 0, fYCamOffset = 0; //will translate by this much to give the effect of scrolling
PFont font8Bit;
boolean bGKey=false;
boolean bCTRLKey=false;
int nDiag;

// ============== CREATE OBJECTS =============================================
Sprite entry;// door
Sprite exit; // door
Sprite hero; 
Messages message; 
LevelBase LvlBase;
Level1 Lvl1;
Level2 Lvl2;
Level3 Lvl3;
Level4 Lvl4;
Eye eyeL;
Eye eyeR;
GiveUpButton giveUpButton;

Timer timer;
Timer buttonTimer;
//Timer bulletTimer;

// ============== SETUP =============================================
void setup() {
  size(900, 600); //18 nBoxSize, 12 nBoxSize
  nLevelHeight = height+nBoxSize; //19 nBoxSize
  nLevelWidth=width+width/2; // 27 nBoxSize
  entry = new Sprite (nBoxSize, nLevelHeight-nBoxSize-75, 0, 0, 0, 0, "entryDoor.png", 0, 0, 0, 0); //75 for height of the door 
  exit = new Sprite (nLevelWidth-nBoxSize-48, nLevelHeight-nBoxSize-75, 0, 0, 0, 0, "exitDoor.png", 0, 0, 0, 0); // 48 for width of the door
  hero = new Sprite (75, 75, 1.6, 0.6, 16, 0, "PixelCrab.png", 0, 0, 0, 0); //construct a hero // to fix the lag had to change from 0.8 to 1.6, 0.3 to 0.6, 8 to 16 
  font8Bit = loadFont("RetroComputer.vlw");  // this font is bitmapped, and might have to be a multiple of 14 px
  message = new Messages (width/2, (height/2)-(height/4));
  frameRate(30); // to fix the lag
  timer = new Timer(1000); // 1000 ms = 1 second
  LvlBase = new LevelBase();
  eyeL = new Eye(nLevelWidth/2, 100);
  eyeR = new Eye(nLevelWidth/2+75, 100);
  buttonTimer = new Timer(3000); // just choose 3000 as a random time, it is later set to the length of the audio
  giveUpButton = new GiveUpButton(width/2-85, height-nBoxSize+3);

  minim = new Minim(this);
  soundJump = minim.loadSample("jump.wav");
  soundShoot = minim.loadSample("Laser Sound.mp3");
  soundHit = minim.loadSample("hit sound.mp3");
  soundSoundTrack = minim.loadFile("DontGiveUp.mp3");
  soundSoundTrack.loop();
  soundJump.setGain(9001); //OVER 9000!!!!!!
  soundShoot.setGain(9001); //OVER 9000!!!!!!
  soundHit.setGain(9001); //OVER 9000!!!!!!
  // println(jump.getGain()); // seems like the max gain is 6.026 maybe??? 
  soundMessage = new AudioSample[10]; 
  while (giveUpButton.nCount<=9) {
    soundMessage[giveUpButton.nCount] = minim.loadSample("soundButton"+str(int(giveUpButton.nCount+1))+".mp3");
    soundMessage[giveUpButton.nCount].setGain(9001); //OVER 9000!!!!!!
    giveUpButton.nCount++;
  }
  giveUpButton.nCount=0;

  // bulletTimer = new Timer(1500);
  // bulletTimer.start();
  nDiag = int(sqrt(sq(nLevelWidth)+sq(nLevelHeight)));
}

// ============== DRAW =============================================
void draw() {
  //println(millis()); // used for debugging
  //println(frameRate); // used for debugging
  if (giveUpButton.bTimerStarted==false) {
    pushMatrix();  // save origin
    updateCameraPosition();  
    translate(-fXCamOffset, -fYCamOffset); //translate the origin by the camerOffset variable to give a sidescrolling effect
    background(20);    
    //println(giveUpButton.bTimerStarted);
    drawLevel();

    entry.display();
    exit.display();
    for (Sprite nI : LvlBase.alGore) {
      nI.display();
    }
    hero.update();
    eyeL.update();
    eyeR.update();
    // display all boxes in the arrayList

    for (Sprite nI : LvlBase.alBox) {//nI = 0; nI<alBox.size(); nI++) {
      nI.display();
    }
    for (Sprite nI : LvlBase.alPlat) {//nI = 0; nI<alBox.size(); nI++) {
      nI.display();
    }
    for (Sprite nI : LvlBase.alSpikes) {
      nI.display();
    }
    for (Sprite nI : LvlBase.alSaws) {
      nI.updateSaw();
    }
    for (LaserGun nI : LvlBase.alLasers) {
      nI.update();
    }

    popMatrix();

    message.display();
    timer.display();
  }
  giveUpButton.update();
  //println(laserGun.vPosPlayer, hero.fX, hero.fY, laserGun.angle);
}

// ============== MOUSEPRESSED =============================================
void mousePressed() {
  if (!giveUpButton.bTimerStarted) {
    if (giveUpButton.isHitButton(giveUpButton.imgButtonDisplayed)) {
      giveUpButton.giveUpButton();
    }
  }
  // stop();
}

// ============== KEYPRESSED =============================================
void keyPressed() {  
  if (!giveUpButton.bTimerStarted) {
    if (key == 'w' || key == 'W') {
      hero.jump();
      hero.nJumpCount++;
    }
    if (key == 'd' || key == 'D') {
      hero.nDirec=1; //right
    }
    if (key == 'a' || key == 'A') {
      hero.nDirec=2; //left
    }

    if (keyCode==CONTROL) {
      bCTRLKey=true;
    }
    if (key=='g'||key=='G') {
      bGKey=true;
    }

    if (bGKey && bCTRLKey) {
      giveUpButton.giveUpButton();
    }
    //}
  }
}

// ============== KEY RELEASED =============================================
void keyReleased() { // smoother movement
  if ((key=='d'||key=='D')||(key=='a'||key=='A')) {
    hero.nDirec=0;
  }
  if (key=='g'||key=='G') {
    bGKey=false;
  }
  if (keyCode==CONTROL) {
    bCTRLKey=false;
  }
}

// ============== UPDATE CAMERA POSITION =============================================
/* From platformer example // http://www.hobbygamedev.com/int/platformer-game-source-in-processing/
 
 Unfortunetly, there wasn't much to change in the function below. We attempted to do it a different way,
 But it didn't work out so well
 We did add the scrolling along the Y axis*/
void updateCameraPosition() {
  int nRightEdge = nLevelWidth-width; // the right side of the camera panel shouldn't go right of the orignal "rightEdge" of the "camera"
  // (width of the level - the width of width of the screen)
  int nTopEdge = nLevelHeight-height;

  fXCamOffset = hero.fX-width/2; // the camera offset is equal to the position of the player , subtract half the width of the level
  fYCamOffset = hero.fY-height/2; // the camera offset is equal to the position of the player , subtract half the height of the level

  if (fXCamOffset <= 0) { 
    fXCamOffset = 0; // if the offset is less than 0, set it to 0 so that the level doesn't translate into thin air
  }
  if (fXCamOffset >= nRightEdge) {
    fXCamOffset = nRightEdge; //if the offset is more than the rightEdge, set it to the rightEdge so that the level doesn't translate into thin air
  }

  if (fYCamOffset <= 0) { 
    fYCamOffset = 0; // if the offset is less than 0, set it to 0 so that the level doesn't translate into thin air
  }
  if (fYCamOffset >= nTopEdge) {
    fYCamOffset = nTopEdge; //if the offset is more than the TopEdge, set it to the rightEdge so that the level doesn't translate into thin air
  }
}
// ============== GET RID OF AND THEN RECREATE THE ARRAYLIST =============================================
void nullAndRecreateAL() {
  LvlBase.alPlat=null;
  LvlBase.alPlat = new ArrayList<Sprite>();
  LvlBase.alSpikes=null;
  LvlBase.alSpikes = new ArrayList<Sprite>();
  LvlBase.alSaws=null;
  LvlBase.alSaws = new ArrayList<Sprite>();
  nullAndRecreateBullet();
  LvlBase.alLasers = null;
  LvlBase.alLasers = new ArrayList <LaserGun> ();
  LvlBase.alGore = null;
  LvlBase.alGore = new ArrayList <Sprite> ();
}
// ============== GET RID OF AND THEN RECREATE THE BULLETS =============================================
void nullAndRecreateBullet() {
  LvlBase.alBullets = null;
  LvlBase.alBullets = new ArrayList <Sprite> ();
}

// ============== DRAW LEVEL =============================================
void drawLevel() {

  if (LvlBase.bDrawn==false) {
    if (nLevel==1) {
      Lvl1=null;
      nullAndRecreateAL();
      Lvl1 =new Level1();
    } else if (nLevel==2) {
      Lvl1=null;
      nullAndRecreateAL();
      Lvl2 =new Level2();
    } else if (nLevel==3) {
      Lvl2=null;
      nullAndRecreateAL();
      Lvl3 =new Level3();
    } else if (nLevel==4) {
      Lvl3=null;
      nullAndRecreateAL();
      Lvl4 =new Level4();
    } else if (nLevel==5) {
      Lvl4=null;
      nullAndRecreateAL();
    }
  }
}
// ============== STOP =============================================
void stop() {
  giveUpButton.nCount=0;
  while (giveUpButton.nCount<=9) {
    soundMessage[giveUpButton.nCount].close();
    giveUpButton.nCount++;
  }
  minim.stop();
  super.stop();
}