class User {
  /* got help from 
   https://processing.org/reference/String_equals_.html
   https://processing.org/reference/textWidth_.html
   https://processing.org/reference/trim_.html
   https://processing.org/reference/JSONArray_append_.html
   https://processing.org/reference/saveJSONArray_.html*/
  String sName = "Enter your name.";
  boolean bNameIsThere = false;  
  boolean bNameHasFocus=false;
  boolean bHasEnteredName = false;
  int nX, nY;
  int nW, nH;
  int nFontSize =15;
  // ============== CONSTRUCTOR =============================================
  User() {
    jsonArUserInfo = loadJSONArray("data/names.JSON");
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
    if (!bHasEnteredName && bNameHasFocus) {
      sName.trim();
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
        for (int i = 0; i < jsonArUserInfo.size(); i++) {
          jsonObjUser = jsonArUserInfo.getJSONObject(i); 
          String sNameInJSON = jsonObjUser.getString("Name");
          if (sName.equals(sNameInJSON)) {
            bNameIsThere = true;
            break;
          }
        }        
        messageEye.update();
        if (!bNameIsThere) {
          jsonObjUser = new JSONObject();
          jsonObjUser.setString("Name", sName);
          jsonObjUser.setInt("Death Count", 0);
          jsonObjUser.setBoolean("On Boss Fight", false);
          jsonArUserInfo.append(jsonObjUser); 
          saveJSONArray(jsonArUserInfo, "data/names.JSON"); //overwrites old file
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
  // ============== OTHER KEYS =============================================
  void otherKeys() {    
    if (!bHasEnteredName && bNameHasFocus) {
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
  // ============== UPDATE USER INFO=============================================
  void updateUserInfo() {
    // searches for the user, deletes it, then adds user to the end of the file
    for (int i = 0; i < jsonArUserInfo.size(); i++) {
      jsonObjUser = jsonArUserInfo.getJSONObject(i); 
      String sNameInJSON = jsonObjUser.getString("Name");
      if (sName.equals(sNameInJSON)) {
        jsonArUserInfo.remove(i);
        break;
      }
    }
    jsonObjUser = new JSONObject();
    jsonObjUser.setString("Name", sName);
    jsonObjUser.setInt("Death Count", sprHero.nDeathCount);
    boolean bIsOnBossLevel;
    if (nLevel==nLastLevel) {
      bIsOnBossLevel=true;
    } else {
      bIsOnBossLevel=false;
    }    
    jsonObjUser.setBoolean("On Boss Fight", bIsOnBossLevel);
    jsonArUserInfo.append(jsonObjUser); 
    saveJSONArray(jsonArUserInfo, "data/names.JSON"); //overwrites old file
    //println(jsonArUserInfo);
    // println("This is who and what you are:");
    // println(jsonObjUser);
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