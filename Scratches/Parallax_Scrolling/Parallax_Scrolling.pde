int nBoxSize = 50; //width of a box
int nLevelHeight, nLevelWidth; // for only scrolling till the edge of the level  
float nXCamOffset = 0, nYCamOffset = 0; //will translate by this much to give the effect of scrolling
PImage imgGrass;
// ============== CREATE OBJECTS =============================================
Sprite hero; 
LevelBase LvlBase;
// ============== SETUP =============================================
void setup() {
  size(900, 600); //18 nBoxSize, 12 nBoxSize
  nLevelHeight = height+nBoxSize; //19 nBoxSize
  nLevelWidth=width+width/2; // 27 nBoxSize
  hero = new Sprite (75, 75, 1.6, 0.6, 16, 0, "PixelCrab.png", 6); //construct a hero // to fix the lag had to change from 0.8 to 1.6, 0.3 to 0.6, 8 to 16 
  LvlBase = new LevelBase();
  imgGrass = loadImage("grass.png");
  imgGrass.resize(733, 114);
  frameRate(30);
}

// ============== DRAW =============================================
void draw() {  
  background(20);
  updateCameraPosition();  
  pushMatrix();
  translate(-round(nXCamOffset/3), -nYCamOffset);
  image(imgGrass, 0, nLevelHeight-1.2*nBoxSize-imgGrass.height);
  image(imgGrass, imgGrass.width-5, nLevelHeight-1.2*nBoxSize-imgGrass.height);
  popMatrix(); 

  pushMatrix();
  translate(-round(nXCamOffset/2), -nYCamOffset);
  image(imgGrass, -75, nLevelHeight-nBoxSize-imgGrass.height);
  image(imgGrass, imgGrass.width-80, nLevelHeight-nBoxSize-imgGrass.height);
  popMatrix();

  pushMatrix();  
  translate(-nXCamOffset, -nYCamOffset);//translate the origin by the camerOffset variable to give a sidescrolling effect
  hero.update();
  for (Sprite nI : LvlBase.alBox) {//nI = 0; nI<alBox.size(); nI++) {
    nI.display();
  }
  popMatrix();
}

// ============== KEYPRESSED =============================================
void keyPressed() { 
  if (key == 'w' || key == 'W') {
    hero.jump();
    hero.nJumpCount++;
  }
  if (key == 'd' || key == 'D') {
    hero.nDirec=1; //right
  }
  if (key == 'a' || key == 'A') {
    hero.nDirec=2; //left
  }
}

// ============== KEY RELEASED =============================================
void keyReleased() { // smoother movement
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

  nXCamOffset = hero.fX-width/2; // the camera offset is equal to the position of the player , subtract half the width of the level
  nYCamOffset = hero.fY-height/2; // the camera offset is equal to the position of the player , subtract half the height of the level

  if (nXCamOffset <= 0) { 
    nXCamOffset = 0; // if the offset is less than 0, set it to 0 so that the level doesn't translate into thin air
  }
  if (nXCamOffset >= nRightEdge) {
    nXCamOffset = nRightEdge; //if the offset is more than the rightEdge, set it to the rightEdge so that the level doesn't translate into thin air
  }

  if (nYCamOffset <= 0) { 
    nYCamOffset = 0; // if the offset is less than 0, set it to 0 so that the level doesn't translate into thin air
  }
  if (nYCamOffset >= nTopEdge) {
    nYCamOffset = nTopEdge; //if the offset is more than the TopEdge, set it to the rightEdge so that the level doesn't translate into thin air
  }
}