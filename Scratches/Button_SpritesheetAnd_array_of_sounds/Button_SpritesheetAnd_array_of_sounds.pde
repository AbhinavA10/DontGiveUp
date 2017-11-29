/* NOTE: You will have to download the Minim library:
 At the top of the processing window, click on Sketch -> Import Library
 -> Add Library. Then search for Minim and click Install.
 */

/*Note: the program may take a couple seconds to load!
 A scratch to test the button being pressed and cycling through messages
 and plays an audio clip. On the tenth press, the program stops after displaying the final image
 NOTE: for some reason if you press control and then g, it doesn't work.
 but if you do it vice versa, it works...*/

import ddf.minim.*;
Minim minim;
AudioSample[] messageSound ;

PImage imgButton, imgMessage;
int nX, nY;
int nMessageTopY = 0, nMessageBottomY=0;
int nCount=0;
boolean bTimerStarted = false;
Timer buttonTimer;
boolean bGKey=false;
boolean bCTRLKey=false;
void setup() {
  size(900, 600);
  imgButton=loadImage("GiveUp_Button.png");
  nX=(width/2)-(imgButton.width/2);
  nY=(height/2)-(imgButton.height/2);
  buttonTimer = new Timer(3000);
  nCount=0;
  imgMessage=loadImage("all.jpg");

  minim = new Minim(this);
  messageSound = new AudioSample[10]; 
  while (nCount<=9) {
    messageSound[nCount] = minim.loadSample("soundButton"+str(int(nCount+1))+".mp3");
    nCount++;
  }
  nCount=0;
}
void draw() {  
  background(20);
  image(imgButton, nX, nY);
  if (bTimerStarted) {
    //http://forum.processing.org/one/topic/displaying-a-part-of-the-image.html
    if (nCount==1) {
      nMessageTopY=0;
      nMessageBottomY=600;
    } else {
      nMessageTopY=(nCount-1)*600;
      nMessageBottomY=nCount*600;
    }
    image(imgMessage, 0, 0, width, height, 0, nMessageTopY, imgMessage.width, nMessageBottomY);
    /* image(img, dx, dy, dw, dh, sx, sy, sw, sh);
     where
     dx, dy, dw, dh   = the area of your display that you want to draw to.
     and
     sx, sy, sw, sh  = the part of the image to draw (measured in pixels)*/
    if (nCount==10) {
      if (buttonTimer.isReachedTime()) {
        stop();
      }
    }
    if (buttonTimer.isReachedTime()) {
      bTimerStarted=false;
      messageSound[nCount-1].stop();
    }
  }

  if (isHit(imgButton, nX, nY)) {
    imgButton=loadImage("GiveUp_Button_Hover.png");
  } else {
    imgButton=loadImage("GiveUp_Button.png");
  }
}
void mousePressed() {
  if (!bTimerStarted) {
    if (isHit(imgButton, nX, nY)) {
      nCount++;
      println(nCount);
      messageSound[nCount-1].trigger();
      buttonTimer.nTimerLength = messageSound[nCount-1].length();
      buttonTimer.start();
      bTimerStarted=true;
    }
  }
}
void keyPressed() {

  if (keyCode==CONTROL) {
    bCTRLKey=true;
  }
  if (key=='g'||key=='G') {
    bGKey=true;
  }

  //if (key=='g'||key=='G') { 
  if (bGKey && bCTRLKey) {
    if (!bTimerStarted) {
      nCount++; 
      println(nCount);
      messageSound[nCount-1].trigger();
      buttonTimer.nTimerLength = messageSound[nCount-1].length();
      buttonTimer.start();
      bTimerStarted=true;
    }
  }
}
void keyReleased() {
  if (key=='g'||key=='G') {
    bGKey=false;
  }
  if (keyCode==CONTROL) {
    bCTRLKey=false;
  }
}

boolean isHit(PImage img, int nX, int nY) {
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
void stop() {
  nCount=0;
  while (nCount<=9) {
    messageSound[nCount].close();
    nCount++;
  }
  minim.stop();
  super.stop();
}