// Release 6.5 - Qui-Gon Jinn - Falling Platforms and 9 more levels!

//Everything is confirmed to be possible

/*
 NOTE: You will have to download the Minim library:
 At the top of the processing window, click on Sketch -> Import Library
 -> Add Library. Then search for Minim and click Install.
 */
import ddf.minim.*;
// ============== MINIM SETUP =========================================================
/* Everything to do with Minim can be found at the following links:
 http://code.compartmental.net/minim/
 http://code.compartmental.net/tools/minim/quickstart/  */
Minim minim;
AudioPlayer soundSoundTrack;
AudioSample soundJump;
AudioSample soundShoot;
AudioSample soundHit;
AudioPlayer soundMenu;
AudioSample[] arSoundMessage ;
// ============== GLOBAL VARIABLES =============================================
int nLevel = 1; // the level number
int nMaxLevel = 43; // 42 is the last level
int nBoxSize = 50; //width of a box
int nLevelHeight, nLevelWidth; // for only scrolling till the edge of the level  
int nXCamOffset = 0, nYCamOffset = 0; //will translate by this much to give the effect of scrolling
PFont font8Bit, font8Bit2;
boolean bGKey=false;
boolean bCTRLKey=false;
int nScreen = 0; // 0 = menu, 1 = settings, 2 = credits, 3 = name, 4 = game, probably need more for cutscenes (?)
// ============== CREATE OBJECTS =============================================
Sprite entry;// door
Sprite exit; // door
Sprite hero; 
Sprite sidekick;
Messages messageEye;
Messages messageOther; 
Eye eyeL;
Eye eyeR;
GiveUpButton giveUpButton;
Timer timer;
Timer buttonTimer;
Name names;
Menu menu;
Window window;
LevelBase LvlBase;
Level01 Lvl01;
Level02 Lvl02;
Level03 Lvl03;
Level04 Lvl04;
Level05 Lvl05;
Level06 Lvl06;
Level07 Lvl07;
Level08 Lvl08;
Level09 Lvl09;
Level10 Lvl10;
Level11 Lvl11;
Level12 Lvl12;
Level13 Lvl13;
// ============== SETUP =============================================
void setup() {
  frameRate(30); // to fix the lag

  size(900, 600); //18 nBoxSize, 12 nBoxSize
  nLevelHeight = height + nBoxSize; //19 nBoxSize
  nLevelWidth=width + width/2; // 27 nBoxSize

  font8Bit = loadFont("RetroComputer.vlw");  // this font is bitmapped, and might have to be a multiple of 14 px
  font8Bit2 = loadFont("pixelmix_smooth.vlw");  // this font is bitmapped, and might have to be a multiple of 6 px
  LvlBase = new LevelBase();

  entry = new Sprite (nBoxSize, nLevelHeight-nBoxSize-75, 0, 0, 0, 0, "entryDoor.png", 0, 0, 0, 0); //75 for height of the door 
  exit = new Sprite (nLevelWidth-nBoxSize-48, nLevelHeight-nBoxSize-75, 0, 0, 0, 0, "exitDoor.png", 0, 0, 0, 0); // 48 for width of the door
  hero = new Sprite (nBoxSize + 2, nLevelHeight - nBoxSize*2, 1.6, 0.6, 16, 0, "PixelCrab.png", 0, 0, 0, 6); //construct a hero // to fix the lag had to change from 0.8 to 1.6, 0.3 to 0.6, 8 to 16 

  eyeL = new Eye(nLevelWidth/2, 100);
  eyeR = new Eye(nLevelWidth/2+75, 100);
  messageEye = new Messages ((int(eyeL.vCenter.x+eyeR.vCenter.x)/2), (height/2)-(height/4)+5, 0, 0, "eye");
  messageOther = new Messages (width-4*nBoxSize, height-nBoxSize+5, 4*nBoxSize-10, nBoxSize-10, "other");

  timer = new Timer(nBoxSize/4, height-nBoxSize+5, 5*nBoxSize-20, nBoxSize-10, 1000); // input is in milliseconds 
  buttonTimer = new Timer(0, 0, 0, 0, 3000); // just choose 3000 as a random time, it is later set to the length of the audio

  names = new Name();
  menu = new Menu();
  sidekick = new Sprite (nBoxSize, nLevelHeight - nBoxSize*3, 0, 0, 0, 0, "butterfly.png", 0, 0, 0, 0);
  window = new Window();

  giveUpButton = new GiveUpButton(width/2-85, height-nBoxSize+3);
  minim = new Minim(this);
  soundJump = minim.loadSample("jump.wav");
  soundShoot = minim.loadSample("Laser Sound.mp3");
  soundHit = minim.loadSample("hit sound.mp3");
  soundSoundTrack = minim.loadFile("DontGiveUp.mp3");
  soundMenu = minim.loadFile("Beepify.mp3");
  soundJump.setGain(9001); //OVER 9000!!!!!! ... even though the max is around 6....
  soundShoot.setGain(9001); //OVER 9000!!!!!! ... even though the max is around 6....
  soundHit.setGain(9001); //OVER 9000!!!!!! ... even though the max is around 6....
  arSoundMessage = new AudioSample[10]; 
  while (giveUpButton.nCount<=9) {
    arSoundMessage[giveUpButton.nCount] = minim.loadSample("soundButton"+str(int(giveUpButton.nCount+1))+".mp3");
    arSoundMessage[giveUpButton.nCount].setGain(9001); //OVER 9000!!!!!! ... even though the max is around 6....
    giveUpButton.nCount++;
  }
  giveUpButton.nCount=0;

  soundMenu.loop();
}
// ============== DRAW =============================================
void draw() {
  //println(millis()); // used for debugging
  //println(frameRate); // used for debugging
  if (nScreen < 3 ) {
    menu.update();
  }
  if (nScreen == 3) {
    names.update();
  }
  if (nScreen == 4) {
    if (!giveUpButton.bTimerStarted) {
      background(20);
      pushMatrix();  
      updateCameraPosition();  
      window.update();
      translate(-nXCamOffset, -nYCamOffset);//translate the origin by the cameraOffset variable to give a sidescrolling effect
      //println(giveUpButton.bTimerStarted); // used for debugging
      drawLevel();
      for (Sprite nI : LvlBase.alGore) {
        nI.display();
      }
      entry.display();
      exit.display();
      hero.update();
      eyeL.update();
      eyeR.update();

      //the for loop is from https://processing.org/reference/for.html, we can use it as along as we are not modifying the arrayList
      for (Sprite nI : LvlBase.alBox) {//nI = 0; nI<alBox.size(); nI++) { // old loop type
        nI.display();
      }
      for (Sprite nI : LvlBase.alPlat) {
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
      for (Sprite nI : LvlBase.alFake) {
        nI.display();
      }
      for (Sprite nI : LvlBase.alFallPlats) {
        nI.gravity();
        nI.display();
      }

      sidekick.updateSidekick();
      messageEye.display();
      popMatrix();

      messageOther.display();
      timer.display();
    }
    giveUpButton.update();
    //println(laserGun.vPosPlayer, hero.fX, hero.fY, laserGun.angle); // used for debugging
  }
}
// ============== MOUSEPRESSED =============================================
void mousePressed() {
  if (mouseButton==LEFT) {
    if (nScreen < 3) {  
      menu.mouse();
    } else if (nScreen==3) {  
      names.putFocus();
    } else if (nScreen==4) {  
      if (isHitButton(giveUpButton.imgButtonDisplayed, giveUpButton.nX, giveUpButton.nY)) {
        giveUpButton.giveUpButton();
      }
    }
  }
}
// ============== KEYPRESSED =============================================
void keyPressed() { 
  //ENTER
  if (key == ENTER || key == RETURN) {
    if (nScreen==0) {
      nScreen = 3;
    } else if (nScreen == 3) {
      names.enter();
    }
  }
  //BACKSPACE
  if (key == BACKSPACE) {
    if (nScreen==1||nScreen==2) {
      nScreen=0;
    } else if (nScreen==3) {
      names.backspace();
    }
  }
  // main menu
  if (nScreen == 0) {
    if (key == 's' || key == 'S') {
      nScreen = 1;
    } else if (key == 'c' || key == 'C') {
      nScreen = 2;
    }
  } 
  // settings
  else if (nScreen == 1) {
    menu.key();
  } 
  // names
  else if (nScreen == 3) {
    names.otherKeys();
  } 
  // game
  else if (nScreen == 4) {
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
      if (key=='g'||key=='G') {
        bGKey=true;
      }
      if (keyCode==CONTROL) {
        bCTRLKey=true;
      }
      if (bCTRLKey && bGKey) {
        giveUpButton.giveUpButton();
      }
    }
  }
}
// ============== KEY RELEASED =============================================
void keyReleased() { // smoother movement
  if (nScreen == 4) {
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
}
// ============== UPDATE CAMERA POSITION =============================================
/* From platformer example // http://www.hobbygamedev.com/int/platformer-game-source-in-processing/
 
 There wasn't much to change in the function below. 
 We had attempted to do it a different way, but it didn't work out so well.
 We did add the scrolling along the Y axis.
 
 We also used constrain() instead of the if/else if structure
 It was found here: https://processing.org/reference/constrain_.html*/
void updateCameraPosition() {
  int nRightEdge = nLevelWidth-width; // the left side of the camera panel shouldn't go right of the orignal "rightEdge" of the "camera"
  // (width of the level - the width of the screen output area)
  int nTopEdge = nLevelHeight-height;

  nXCamOffset = round(hero.fX-width/2); // the camera offset is equal to the position of the player , subtract half the width of the level
  nYCamOffset = round(hero.fY-height/2); // the camera offset is equal to the position of the player , subtract half the height of the level

  /*if the two lines immediately below are uncommented, 'Earthquakes' will take place.*/
  // nXCamOffset += round(random(-20, 20)); // 
  // nYCamOffset += round(random(-10, 10)); 

  nXCamOffset = constrain(nXCamOffset, 0, nRightEdge);
  nYCamOffset = constrain(nYCamOffset, 0, nTopEdge);
} 
// ============== CLEAR ALL ARRAYLISTS =============================================
void clearAllAL() {
  // Clear function for the ArrayLists were found here: https://processing.org/reference/IntList_clear_.html
  LvlBase.alPlat.clear();
  LvlBase.alSpikes.clear();
  LvlBase.alSaws.clear();
  LvlBase.alLasers.clear();
  LvlBase.alBullets.clear();
  LvlBase.alGore.clear();
  LvlBase.alFake.clear();
  LvlBase.alFallPlats.clear();
}
// ============== DRAW LEVEL =============================================
void drawLevel() {
  if (LvlBase.bDrawn==false) {
    if (nLevel==1) {
      Lvl01=null;
      clearAllAL();
      Lvl01 =new Level01();
    } else if (nLevel==2) {
      Lvl01 = null;
      clearAllAL();
      Lvl02 = new Level02();
    } else if (nLevel==3) {
      Lvl02= null;
      clearAllAL();
      Lvl03 = new Level03();
    } else if (nLevel==4) {
      Lvl03=null;
      clearAllAL();
      Lvl04 = new Level04();
    } else if (nLevel==5) {
      Lvl04=null;
      clearAllAL();
      Lvl05 = new Level05();
    } else if (nLevel == 6) {
      Lvl05 = null;
      clearAllAL();
      Lvl06 = new Level06();
    } else if (nLevel == 7) {
      Lvl06 = null;
      clearAllAL();
      Lvl07 =new Level07();
    } else if (nLevel == 8) {
      Lvl07 = null;
      clearAllAL();
      Lvl08 = new Level08();
    } else if (nLevel == 9) {
      Lvl08 = null;
      clearAllAL();
      Lvl09 = new Level09();
    } else if (nLevel == 10) {
      Lvl09 = null;
      clearAllAL();
      Lvl10 = new Level10();
    } else if (nLevel == 11) {
      Lvl10 = null;
      clearAllAL();
      Lvl11 = new Level11();
    } else if (nLevel == 12) {
      Lvl11 = null;
      clearAllAL();
      Lvl12 = new Level12();
    } else if (nLevel == 13) {
      Lvl12 = null;
      clearAllAL();
      Lvl13 = new Level13();
    }
  }
}
// ============== IS HIT BUTTON =============================================
boolean isHitButton(PImage img, float fX, float fY) {
  int nH, nW;
  nH = img.height;
  nW = img.width;
  if (mouseX >= fX && mouseX <= fX+nW 
    && 
    mouseY >= fY && mouseY <= fY + nH) {
    return true;
  } else {
    return false;
  }
} 
// ============== STOP =============================================
void stop() {
  giveUpButton.nCount=0;
  while (giveUpButton.nCount<=9) {
    arSoundMessage[giveUpButton.nCount].close();
    giveUpButton.nCount++;
  }
  minim.stop();
  super.stop();
}