//https://processing.org/reference/loadStrings_.html
//https://processing.org/reference/String_equals_.html
//https://processing.org/reference/saveStrings_.html
//https://processing.org/reference/textWidth_.html
//https://processing.org/reference/append_.html

String[] sNames;
String sCurrentName = "Enter your name.";
boolean bNameIsThere = false;
int nX, nY;
int nW, nH;
boolean bNameHasFocus=false;
boolean bHasEnteredName = false;
int nFontSize =20;
String sMessage = "";
void setup() {
  size(500, 500);
  sNames = loadStrings("list.txt");
  textSize(nFontSize);
  nX = width/5;
  nY = height/2-20;
  nW = 300;
  nH = 30;
}
void draw() {
  background(20);
  fill(255);
  if (!bHasEnteredName) {
    // text("Click on the rectangle", nX+5, nY-50);
    rect(nX, nY, nW, nH);
    // text("Then press ENTER", nX, nY+nH+20);
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
    if (isHit()) {
      cursor(TEXT);
    } else {
      cursor(ARROW);
    }
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
        if (sCurrentName.length() > 0) { 
          bNameHasFocus=false;
          bHasEnteredName=true;
          cursor(ARROW);
          for (int i = 0; i < sNames.length; i++) {
            if (sCurrentName.equals(sNames[i])) {
              bNameIsThere=true;
              break;
            }
          }    
          if (bNameIsThere) {
            println("Back already "+sCurrentName+"?");
            sMessage=  "Hello again "+sCurrentName;
          } else {
            sNames = append(sNames, sCurrentName); 
            println("I see we have a new user...");
            sMessage=  "I've never seen you before "+sCurrentName;
            saveStrings("list.txt", sNames);
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