class Messages {
  int nX, nY;
  String sMessageChoice, sHitEntry, sHitExit;
  float fHitEntryTextWidth, fHitExitTextWidth;
  Messages(int nTempX, int nTempY) {
    nX=nTempX;
    nY=nTempY;
    textFont(font8Bit, 28);    
    sHitEntry = "This is the entry, not the exit!";
    sHitExit = "You win!";
    /*to center the text, we have to use "textWidth()", which is 
     found on: https://processing.org/reference/textWidth_.html*/
    fHitEntryTextWidth = textWidth(sHitEntry);
    fHitExitTextWidth = textWidth(sHitExit);
  }
  void display() {
    if (sMessageChoice == "HitEntry") {
      text(sHitEntry, nX-fHitEntryTextWidth/2, nY);
    }
    if (sMessageChoice == "HitExit") {
      text(sHitExit, nX-fHitExitTextWidth/2, nY);
    }
  }
}