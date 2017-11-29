class Messages {
  int nX, nY;
  String sMessageChoice, sHitEntry, sHitExit, sLevel;
  float fHitEntryTextWidth, fHitExitTextWidth, sLevelTextWidth;
  int nXLevelRect, nYLevelRect, nLevelRectWidth, nLevelRectHeight; // a rectangular "background" for the level display
  String[] sMessage = new String[nMaxLevel+1];
  String sType;
  // ============== CONSTRUCTOR =============================================
  Messages(int nTempX, int nTempY, String sTempType) {
    nX=nTempX;
    nY=nTempY; 
    sHitEntry = "This is the entry, not the exit!";
    sHitExit = "Proceeding to the next level.";
    /*to center the text, we can use "textWidth()", which is 
     found on: https://processing.org/reference/textWidth_.html*/
    //fHitEntryTextWidth = textWidth(sHitEntry); //needed if using textWidth();
    //fHitExitTextWidth = textWidth(sHitExit); //needed if using textWidth();

    /*Another way to center the text, is that we can use "textAlign()", 
     which is found on: https://processing.org/reference/textAlign_.html*/

    nXLevelRect =  width-4*nBoxSize;
    nYLevelRect = height-nBoxSize+5;
    nLevelRectWidth = 4*nBoxSize-10;
    nLevelRectHeight = nBoxSize-10;
    sMessage[0] = "Hello there.";
    sMessage[1] = "Good to see you.";
    sMessage[2] = "This level is pretty tricky.";
    sMessage[3] = "Don't die.";
    sMessage[4] = "Wow. That was pure luck.";
    sMessage[5] = " ";
    sMessage[5] = " ";
    sMessage[6] = " ";
    sMessage[7] = " ";
    sMessage[8] = " ";
    sMessage[9] = " ";
    sMessage[10] = " ";
    sMessage[11] = " ";
    sMessage[12] = " ";
    sMessage[13] = " ";
    sMessage[14] = " ";
    sMessage[15] = " ";
    sMessage[16] = " ";
    sMessage[17] = " ";
    sMessage[18] = " ";
    sMessage[19] = " ";
    sMessage[20] = " ";
    sMessage[21] = " ";
    sMessage[22] = " ";
    sMessage[23] = " ";
    sMessage[24] = " ";
    sMessage[25] = " ";
    sMessage[26] = " ";
    sMessage[27] = " ";
    sMessage[28] = " ";
    sMessage[29] = " ";
    sMessage[30] = " ";
    sMessage[31] = " ";
    sMessage[32] = " ";
    sMessage[33] = " ";
    sMessage[34] = " ";
    sMessage[35] = " ";
    sMessage[36] = " ";
    sMessage[37] = " ";
    sMessage[38] = " ";
    sMessage[39] = " ";
    sMessage[40] = " ";
    sMessage[41] = " ";
    sMessage[42] = " ";
    sMessage[43] = " ";
    sType=sTempType;
  }
  // ============== DISPLAY =============================================
  void display() {

    textAlign(CENTER, CENTER);
    if (sType=="eye") {    
      /*  fill(40, 150);
       strokeWeight(3);
       stroke(#989595, 150);
       rect(eyeL.vCenter.x-30, eyeL.vCenter.y+35, (eyeR.vCenter.x-eyeL.vCenter.x)+50, 50);*/

      fill (255);  
      textFont(font8Bit2, 18); 
      text(sMessage[nLevel-1], nX, nY);
    } else {
      textFont(font8Bit, 28); 
      fill(0, 255, 0, 200);
      rect(nXLevelRect, nYLevelRect, nLevelRectWidth, nLevelRectHeight); // a rectangular "background" for the level display
      fill (0);
      sLevel = "Level "+str(nLevel); // convert nLevel to a string for displaying
      text(sLevel, nXLevelRect+nLevelRectWidth/2, nYLevelRect+nLevelRectHeight/2);
    }
    //sLevelTextWidth = textWidth(sLevel); //needed if using textWidth();

    /*if (sMessageChoice == "HitEntry") {
     
     text(sHitEntry, nX, nY);
     //text(sHitEntry, nX-fHitEntryTextWidth/2, nY); //needed if using textWidth();
     }
     if (sMessageChoice == "HitExit") {
     text(sHitExit, nX, nY);
     // text(sHitExit, nX-fHitExitTextWidth/2, nY); //needed if using textWidth();
     } */
  }
}