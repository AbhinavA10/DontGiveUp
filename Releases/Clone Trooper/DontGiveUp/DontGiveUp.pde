// Release 3.0 - Clone Trooper - includes 9 more levels!
// the lag at one point is also fixed!

// ============== GLOBAL/INTIAL VARIABLES =============================================
PVector vPosInitial, vPosStartInitial; // create vector to pass to hero so we can construct a hero
int nLevel = 1; // needed for multiple levels
boolean bDrawn = false;// needed for multiple levels in later releases and to stop continously adding more boxes (of Class Box)
ArrayList <Box> alBox = new ArrayList<Box>(); // create a new ArrayList
int nI; //general variable used for hit testing with the arrayList 
int nBoxSize = 50; //width of a box
int nLevelHeight, nLevelWidth; // for only scrolling till the edge of the level  
float fXCamOffset = 0, fYCamOffset = 0; //will translate by this much to give the effect of scrolling
int nXLevelRect, nYLevelRect, nLevelRectWidth, nLevelRectHeight; // a rectangular "background" for the level display
int nXTimerRect, nYTimerRect, nTimerRectWidth, nTimerRectHeight; // a rectangular "background" for the timer display
PFont font8Bit;

// ============== CREATE OBJECTS =============================================
Door entry;// create doors
Door exit; // create doors
Messages message;
Protagonist hero; // create an instance of Protagonist
Timer timer;

// ============== SETUP =============================================
void setup() {
  size(900, 600);
  nLevelHeight = height+nBoxSize;
  nLevelWidth=width+width/2;// seems like a good size
  vPosInitial= new PVector (100, 100);// set vector
  vPosStartInitial= new PVector (100, 100);
  entry = new Door (nBoxSize, nLevelHeight-nBoxSize-75, "Entry"); //75 for height of the door 
  exit = new Door (nLevelWidth-nBoxSize-48, nLevelHeight-nBoxSize-75, "Exit"); // 48 for width of the door
  //Protagonist(PVector vTempPos, PVector vTempPosStart, float fTempAccel, float fTempVelocity, int nTempVelocityLimit, int nTempDirec)
  hero = new Protagonist(vPosInitial, vPosStartInitial, 1.6, 0.6, 16, 0);//construct a hero // to fix the lag had to change from 0.8 to 1.6, 0.3 to 0.6, 8 to 16 
  //font8Bit = loadFont("ArcadeClassic.vlw");  
  font8Bit = loadFont("RetroComputer.vlw");  // this font is bitmapped, and might have to be a multiple of 14 px
  message = new Messages (width/2, (height/2)-(height/4));
  frameRate(30); // to fix the lag
  // Stuff for the level number background
  nXLevelRect =  width-4*nBoxSize;
  nYLevelRect = height-nBoxSize+5;
  nLevelRectWidth = 4*nBoxSize-10;
  nLevelRectHeight = nBoxSize-10;
  // Stuff for the timer background
  nXTimerRect =  nBoxSize/4;
  nYTimerRect = height-nBoxSize+5;
  nTimerRectWidth = 5*nBoxSize-20;
  nTimerRectHeight = nBoxSize-10;
  timer = new Timer(1000); // 1000 ms = 1 second
}

// ============== DRAW =============================================
void draw() {
  //println(millis()); // // used for debugging
  //println(frameRate); // used for debugging
  pushMatrix();  // save origin
  updateCameraPosition();  
  translate(-fXCamOffset, -fYCamOffset); //translate the origin by the camerOffset variable to give a sidescrolling effect
  background(20);    

  createBoxes();

  entry.display();
  exit.display();

  hero.update();

  // display all boxes in the arrayList
  for (nI = 0; nI<alBox.size(); nI++) {
    alBox.get(nI).display();
  }
  popMatrix(); // replace the translated origin with the original one
  fill(0, 255, 0, 200);
  rect(nXLevelRect, nYLevelRect, nLevelRectWidth, nLevelRectHeight); // a rectangular "background" for the level display
  fill(0, 0, 255, 200);
  rect(nXTimerRect, nYTimerRect, nTimerRectWidth, nTimerRectHeight); // a rectangular "background" for the timer display
  message.display();
  timer.display();
}

// ============== KEYPRESSED =============================================
void keyPressed() {
  if (key == 'w' || key == 'W') {
    hero.jump();
    hero.nJumpCount++;
  }
  if (key == 'a' || key == 'A') {
    hero.nDirec=1; //left
  }
  if (key == 'd' || key == 'D') {
    hero.nDirec=2; //right
  }
}

// ============== KEY RELEASED =============================================
void keyReleased() { // if key stops being pressed, the player will stop going left or right, this gives smoother movement
  if ((key=='d'||key=='D')||(key=='a'||key=='A')) {
    hero.nDirec=0;
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

  fXCamOffset = hero.vPos.x-width/2; // the camera offset is equal to the position of the player , subtract half the width of the level
  fYCamOffset = hero.vPos.y-height/2; // the camera offset is equal to the position of the player , subtract half the height of the level

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

// ============== CREATE BOXES =============================================
void createBoxes() {
  int nAmount = 100; // max number of boxes
  int fX=0, fY=0; //poisition of the box
  String sDrawDirec = "Right";
  if (bDrawn == false) { 
    for (int i= 0; i<nAmount; i++) {
      if (sDrawDirec == "Right") {
        alBox.add(new Box (fX, fY));
        fX+=50;        
        if (fX>=nLevelWidth-nBoxSize) { // nBoxSize has to be subtracted from the Width of the level to show the box
          sDrawDirec="Down";
        }
      } else if (sDrawDirec == "Down") {
        alBox.add(new Box (fX, fY));
        fY+=50;        
        if (fY>=height) {
          sDrawDirec="Left";
          // println(fX); // used for debugging
        }
      } else if (sDrawDirec == "Left") {
        alBox.add(new Box (fX, fY));
        fX-=50;        
        if (fX<=0) {
          sDrawDirec="Up";
        }
      } else if (sDrawDirec == "Up") {
        alBox.add(new Box (fX, fY));
        fY-=50;        
        if (fY<=-50) {
          sDrawDirec="none";
        }
      }
    } 
    if (nLevel == 2) {
      alBox.add(new Box (nLevelWidth-10*nBoxSize, nLevelHeight-3*nBoxSize));
      alBox.add(new Box (nLevelWidth-9*nBoxSize, nLevelHeight-3*nBoxSize));
      alBox.add(new Box (nLevelWidth-8*nBoxSize, nLevelHeight-3*nBoxSize));
    }
    if (nLevel == 3) { 
      alBox.add(new Box (250, nLevelHeight-2*nBoxSize));
      alBox.add(new Box (300, nLevelHeight-3*nBoxSize));
      alBox.add(new Box (350, nLevelHeight-4*nBoxSize));
      alBox.add(new Box (400, nLevelHeight-5*nBoxSize));
      alBox.add(new Box (450, nLevelHeight-5*nBoxSize));
      alBox.add(new Box (550, nLevelHeight-5*nBoxSize));
      alBox.add(new Box (500, nLevelHeight-5*nBoxSize));
      alBox.add(new Box (650, nLevelHeight-5*nBoxSize));
      alBox.add(new Box (750, nLevelHeight-4*nBoxSize));
    }
    bDrawn = true;
  }
}