class Name { //<>//
  /* got help from 
   https://processing.org/reference/loadStrings_.html
   https://processing.org/reference/String_equals_.html
   https://processing.org/reference/saveStrings_.html
   https://processing.org/reference/textWidth_.html
   https://processing.org/reference/append_.html*/
  String[] arSNames;
  String sName = "Enter your name.";
  boolean bNameIsThere = false;  
  boolean bNameHasFocus=false;
  boolean bHasEnteredName = false;
  int nX, nY;
  int nW, nH;
  int nFontSize =15;
  // ============== CONSTRUCTOR =============================================
  Name() {
    arSNames = loadStrings("names.txt");
    //textFont(font8Bit, nFontSize);
    nW = 350;
    nH = 50; 
    nX = int(width/3.27); //275
    nY = height/2-nH/2;
  }
  // ============== UPDATE =============================================
  void update() {
    background(20);
    fill(255);    
    textAlign(CENTER, CENTER);
    if (!bHasEnteredName) {
      rect(nX, nY, nW, nH);
      if (sName.length() > 0) { 
        if (sName.equals("Enter your name.")) {   
          nFontSize=20;
          textFont(font8Bit, nFontSize);
        } else {      
          nFontSize=18;
          textFont(font8Bit2, nFontSize);
        }
        textAlign(LEFT, CENTER);
        fill(0);
        text(sName, nX+5, nY+2, nW-5, nH-5);//orig = nY-5
        if (millis()/500 % 2==0 && bNameHasFocus) {
          stroke(0);
          strokeWeight(1.5);
          line(nX+textWidth(sName)+nFontSize/3, nY+5, nX+textWidth(sName)+nFontSize/3, nY+nH-5);
        }
      } else {          
        if (millis()/500 % 2==0 &&bNameHasFocus) {
          stroke(0);
          strokeWeight(1.5);
          line(nX+5, nY+5, nX+5, nY+nH-5);
        }
      }
      if (isHit()) {
        cursor(TEXT);
      } else {
        cursor(ARROW);
      }
    }
    //println(sName);
  }
  // ============== ENTER =============================================
  void enter() {
    if (!bHasEnteredName&&bNameHasFocus) {
      if (sName.length() > 0) { 
        bNameHasFocus=false;
        bHasEnteredName=true;        
        nScreen = 4;     
        timer.recordTime();   
        cursor(ARROW);
        if (!soundMenu.isMuted()) {
          soundMenu.pause();
          soundSoundTrack.loop();
        }
        for (int i = 0; i < arSNames.length; i++) {
          if (sName.equals(arSNames[i])) {
            bNameIsThere=true;
            break;
          }
        }        
        messageEye.update();
        if (!bNameIsThere) {
          arSNames = append(arSNames, sName); 
          saveStrings("data/"+"names.txt", arSNames);
        }
      } else {
        bNameHasFocus=false;    
        textFont(font8Bit, nFontSize);
        sName = "Enter your name.";
      }
    }
  }
  // ============== BACKSPACE =============================================
  void backspace() {
    if (bNameHasFocus && sName.length()>0) {
      sName = sName.substring(0, sName.length()-1);
    }
  }
  // ============== OTHER KEY =============================================
  void otherKey() {    
    if (!bHasEnteredName&&bNameHasFocus) {
      if (keyCode == DELETE||key==BACKSPACE) { // had to include backspace and delete here because they both have some funky icon
      } else if (keyCode != SHIFT) {// && keyCode != CONTROL && keyCode != ALT) {
        sName = sName + key;
      }
    }
  }
  // ============== PUT FOCUS =============================================
  void putFocus() {
    if (isHit()) {
      bNameHasFocus=true;
      if (sName.equals("Enter your name.")) { 
        sName="";
      }
    } else {
      bNameHasFocus=false;
      if (sName.length() == 0) { 
        sName = "Enter your name.";
      }
    }
  }
  // ============== IS HIT =============================================
  boolean isHit() {
    if (mouseX >= nX && mouseX <= nX+nW && 
      mouseY >= nY && mouseY <= nY + nH) {
      return true;
    } else {
      return false;
    }
  }
}