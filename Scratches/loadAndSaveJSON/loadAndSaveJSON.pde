//https://processing.org/reference/JSONArray_append_.html
//https://processing.org/reference/saveJSONArray_.html
String sCurrentName = "Enter your name.";
boolean bNameIsThere = false;
int nX, nY;
int nW, nH;
boolean bNameHasFocus=false;
boolean bHasEnteredName = false;
int nFontSize =20;
String sMessage = "";

JSONArray jsonArUserInfo;
JSONObject jsonObjUser;
void setup() {
  size(500, 500);
  textSize(nFontSize);
  nX = width/5;
  nY = height/2-20;
  nW = 300;
  nH = 30;
  jsonArUserInfo = loadJSONArray("names.JSON");
}
void draw() {
  background(20);
  fill(255);
  if (!bHasEnteredName) {
    rect(nX, nY, nW, nH);
    if (sCurrentName.length() > 0) { 
      textAlign(LEFT, TOP);
      fill(0);
      text(sCurrentName, nX+5, nY+5, nW-5, nH-5);
      if (millis()/500 % 2==0 && bNameHasFocus) {
        stroke(0);
        strokeWeight(1.5);
        line(nX+textWidth(sCurrentName)+nFontSize/2, nY+5, nX+textWidth(sCurrentName)+nFontSize/2, nY+nH-5);
      }
    } else {          
      if (millis()/500 % 2==0 &&bNameHasFocus) {
        stroke(0);
        strokeWeight(1.5);
        line(nX+5, nY+5, nX+5, nY+nH-5);
      }
    }
    if (isHit())  cursor(TEXT); 
    else    cursor(ARROW);
  } else {       
    textAlign(CENTER, CENTER);
    fill(255);     
    text(sMessage, 0, 0, width, height);
  }
}
void keyPressed() {
  if (bNameHasFocus) {
    if (key==ENTER||key==RETURN) {
      if (!bHasEnteredName) {
        sCurrentName.trim();
        if (sCurrentName.length() > 0) { 
          bNameHasFocus=false;
          bHasEnteredName=true;
          cursor(ARROW);
          for (int j = 0; j < jsonArUserInfo.size(); j++) {
            jsonObjUser = jsonArUserInfo.getJSONObject(j); 
            String sNameInJSON = jsonObjUser.getString("Name");
            if (sCurrentName.equals(sNameInJSON)) {
              bNameIsThere = true;
              break;
            }
          }
          if (bNameIsThere) {
            println("Back already "+sCurrentName+"?");
            sMessage=  "Hello again "+sCurrentName;

            int nDeathCount = jsonObjUser.getInt("Death Count");
            boolean bOnBossLevel = jsonObjUser.getBoolean("On Boss Fight");
            if (nDeathCount==0) {
              println("Good job not dieing!");
            } else {
              println("You have already died "+nDeathCount+" times, and this isn't even a game!");
            }  
            if (bOnBossLevel) {
              println("You got to the BOSS FIGHT!! WOO HOO!!");
            } else {
              println("You're not even on the boss fight!! :( ");
            }
          } else {
            jsonObjUser = new JSONObject();
            jsonObjUser.setString("Name", sCurrentName);
            jsonObjUser.setInt("Death Count", 0);
            jsonObjUser.setBoolean("On Boss Fight", false);
            jsonArUserInfo.append(jsonObjUser); 
            println("I see we have a new user...");
            sMessage=  "I've never seen you before "+sCurrentName;
            saveJSONArray(jsonArUserInfo, "names.json"); //overwrites old file
          }
        } else {
          bNameHasFocus=false;
          bHasEnteredName=true;
          sMessage=  "I said \"Enter a Name\"!\nYou didn't enter one.\nNice try.";
        }
      }
    }
    if (keyCode == BACKSPACE) {
      if (sCurrentName.length() > 0) {
        sCurrentName = sCurrentName.substring(0, sCurrentName.length()-1);
      }
    } else if (keyCode == DELETE) {
    } else if (keyCode != SHIFT) {// && keyCode != CONTROL && keyCode != ALT) {
      sCurrentName = sCurrentName + key;
    }
  }
}
void mousePressed() {
  if (isHit()) {
    bNameHasFocus=true;
    if (sCurrentName.equals("Enter your name.")) { 
      sCurrentName="";
    }
  } else {
    bNameHasFocus=false;
    if (sCurrentName.length() == 0) { 
      sCurrentName = "Enter your name.";
    }
  }
}
boolean isHit() {
  if (mouseX >= nX && mouseX <= nX+nW && 
    mouseY >= nY && mouseY <= nY + nH) {
    return true;
  } else {
    return false;
  }
}