/* The reason that the "y position" is randomized is 
that as collisions in the array list wasn't working 
at this time, we needed a way to check whether 
scrolling along the "y" axis worked or not */

PVector vPos;
float fXCamOffset = 0, fYCamOffset = 0;
boolean bCanPlayerMove = false;
int nLevelHeight;
int nLevelWidth;  
int nBoxSize = 50; //width of a box
Protagonist hero; 
void setup() {
  //fullScreen();
  size(900, 600);
  nLevelHeight = height+nBoxSize;
  nLevelWidth=width+width/2;// seems like a good size
  vPos= new PVector (width/2, 100);
  hero = new Protagonist(vPos, 0.8, 0.3, 8, false, 0); // (vTempPos,fTempAccel,fTempVelocity,nTempVelocityLimit, canTempJump, nTempDirec) {
}
void draw() {
  //println(frameRate); 
  pushMatrix();  
  updateCameraPosition();  
  translate(-fXCamOffset, -fYCamOffset); //nMovementY is for later - when we scroll with Y as well
  stroke(0, 255, 0);
  background(20);    

  //updateCameraPosition();  
  createBoxes();
  hero.update();

  for (i = 0; i<alWall.size(); i++) {
    alWall.get(i).display();
  }
  popMatrix();  
  //line(0, 500, 1500, 500);
}
void keyPressed() {
  if (keyCode==UP&& hero.isHit(hero)) {
    hero.canJump=true;
  }
  if (keyCode==LEFT) {
    hero.nDirec=-1;
  } else if (keyCode==RIGHT) {    
    hero.nDirec=1;
  }
}
void keyReleased() {
  if (keyCode==RIGHT||keyCode==LEFT) {
    hero.nDirec=0;
  }
}
/* 
 Unfortunetly, there wasn't much to change in the function below. We attempted to do it a different way,
 But it didn't work out so well
 from platformer example // http://www.hobbygamedev.com/int/platformer-game-source-in-processing/
  We did add the scrolling along the Y axis*/
void updateCameraPosition() {
  int nRightEdge = nLevelWidth-width; // the right side of the camera panel shouldn't go right of the orignal "rightEdge" of the "camera"
  // (width of the level - the width of width of the screen)
  int nTopEdge = nLevelHeight-height;
  fXCamOffset = hero.vPos.x-width/2; // the camera offset is equal to the position of the player , subtract half the width of the level
  if (fXCamOffset <= 0) { 
    fXCamOffset = 0; // if the offset is less than 0, set it to 0 so that the level doesn't translate into thin air
  }
  if (fXCamOffset >= nRightEdge) {
    fXCamOffset = nRightEdge; //if the offset is more than the rightEdge, set it to the rightEdge so that the level doesn't translate into thin air
  }
  fYCamOffset = hero.vPos.y-height/2; // the camera offset is equal to the position of the player , subtract half the height of the level
  if (fYCamOffset <= 0) { 
    fYCamOffset = 0; // if the offset is less than 0, set it to 0 so that the level doesn't translate into thin air
  }
  if (fYCamOffset >= nTopEdge) {
    fYCamOffset = nTopEdge; //if the offset is more than the rightEdge, set it to the rightEdge so that the level doesn't translate into thin air
  }
}
void createBoxes() {
  int nAmount = 100;
  int fX=0, fY=0;
  String sDrawDirec = "Right";
  if (bDrawn == false) {  
    alWall.add(new Wall (width/2, height/2));
    if (nLevel == 1) {
      for (int i= 0; i<nAmount; i++) {
        if (sDrawDirec == "Right") {
          alWall.add(new Wall (fX, fY));
          fX+=50;        
          if (fX>=nLevelWidth-nBoxSize) { // nBoxSide has to subtract to show the box
            sDrawDirec="Down";
          }
        } else if (sDrawDirec == "Down") {
          alWall.add(new Wall (fX, fY));
          fY+=50;        
          if (fY>=height) {
            sDrawDirec="Left";
            // println(fX);
          }
        } else if (sDrawDirec == "Left") {
          alWall.add(new Wall (fX, fY));
          fX-=50;        
          if (fX<=0) {
            sDrawDirec="Up";
          }
        } else if (sDrawDirec == "Up") {
          alWall.add(new Wall (fX, fY));
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