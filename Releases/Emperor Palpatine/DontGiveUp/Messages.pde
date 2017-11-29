class Messages {
  int nX, nY;
  String sMessageChoice, sHitEntry, sHitExit, sLevel;
  float fHitEntryTextWidth, fHitExitTextWidth, sLevelTextWidth;
  int nXLevelRect, nYLevelRect, nLevelRectWidth, nLevelRectHeight; // a rectangular "background" for the level display
  // ============== CONSTRUCTOR =============================================
  Messages(int nTempX, int nTempY) {
    nX=nTempX;
    nY=nTempY;
    textFont(font8Bit, 28);    
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
  }
  // ============== DISPLAY =============================================
  void display() {
    textAlign(CENTER, CENTER);
    sLevel = "Level "+str(nLevel); // convert nLevel to a string for displaying
    //sLevelTextWidth = textWidth(sLevel); //needed if using textWidth();
    fill (255);
    if (sMessageChoice == "HitEntry") {
      text(sHitEntry, nX, nY);
      //text(sHitEntry, nX-fHitEntryTextWidth/2, nY); //needed if using textWidth();
    }
    if (sMessageChoice == "HitExit") {
      text(sHitExit, nX, nY);
      // text(sHitExit, nX-fHitExitTextWidth/2, nY); //needed if using textWidth();
    }
    fill(0, 255, 0, 200);
    rect(nXLevelRect, nYLevelRect, nLevelRectWidth, nLevelRectHeight); // a rectangular "background" for the level display
    fill (0);
    text(sLevel, nXLevelRect+nLevelRectWidth/2, nYLevelRect+nLevelRectHeight/2);
  }
}