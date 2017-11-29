// Release 2.0 - C3PO - includes scrolling!

PVector vPosInitial, vPosStartInitial; // create vector to pass to hero so we can construct a hero
Protagonist hero; // create an instance of Protagonist
int nLevel = 1; // needed for multiple levels in later releases
boolean bDrawn = false;// needed for multiple levels in later releases and to stop continously adding more boxes (of Class Box)
ArrayList <Box> alBox = new ArrayList<Box>(); // create a new ArrayList
int nI; //general variable used for hit testing with the arrayList 
int nBoxSize = 50; //width of a box
int nLevelHeight, nLevelWidth; // for only scrolling till the edge of the level  
float fXCamOffset = 0, fYCamOffset = 0; //will translate by this much to give the effect of scrolling

void setup() {
  size(900, 600);
  nLevelHeight = height+nBoxSize;
  nLevelWidth=width+width/2;// seems like a good size
  vPosInitial= new PVector (100, 100);// set vector
  vPosStartInitial= new PVector (100, 100);

  //Protagonist(PVector vTempPos, PVector vTempPosStart, float fTempAccel, float fTempVelocity, int nTempVelocityLimit, boolean canTempJump, int nTempDirec)
  hero = new Protagonist(vPosInitial, vPosStartInitial, 0.8, 0.3, 8, false, 0);//construct a hero
}

void draw() {
  //println(frameRate); // used for debugging
  pushMatrix();  // save origin
  updateCameraPosition();  
  translate(-fXCamOffset, -fYCamOffset); //translate the origin by the camerOffset variable to give a sidescrolling effect
  background(20);    

  createBoxes();
  hero.update();

  // display all boxes in the arrayList
  for (nI = 0; nI<alBox.size(); nI++) {
    alBox.get(nI).display();
  }
  popMatrix(); // replace the translated origin with the original one
}
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
void keyReleased() { // if key stops being pressed, the player will stop going left or right, this gives smoother movement
  if ((key=='d'||key=='D')||(key=='a'||key=='A')) {
    hero.nDirec=0;
  }
}
/* 
 From platformer example // http://www.hobbygamedev.com/int/platformer-game-source-in-processing/
 
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

void createBoxes() {
  int nAmount = 100;
  int fX=0, fY=0;
  String sDrawDirec = "Right";
  if (bDrawn == false) {  
    if (nLevel == 1) {
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
    }
    bDrawn = true;
  }
}
boolean isHitBoxes(float nX1, float nY1, float nX2, float nY2, int nH1, int nW1, int nH2, int nW2) { 
  if (
    ( ( (nX1 <= nX2) && (nX1+nW1 >= nX2) ) ||
    ( (nX1 >= nX2) && (nX1 <= nX2+nW2) ) )
    &&
    ( ( (nY1 <= nY2) && (nY1+nH1 >= nY2) ) ||
    ( (nY1 >= nY2) && (nY1 <= nY2+nH2) ) )
    )
    return (true) ;
  else
    return(false) ;
}