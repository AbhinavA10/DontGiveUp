//https://processing.org/reference/loadJSONArray_.html
// Example of JSON code, objects are in "{ }", which are in an array
// [
//   {
//     "id": 0,
//     "species": "Capra hircus",
//     "name": "Goat"
//   },
//   {
//     "id": 1,
//     "species": "Panthera pardus",
//     "name": "Leopard"
//   },
//   {
//     "id": 2,
//     "species": "Equus zebra",
//     "name": "Zebra"
//   }
// ]                                   
JSONArray jsonArValues;
JSONObject jsonObjItems;

int nBoxSize = 50; //width of a box
int nLevelHeight, nLevelWidth; // for only scrolling till the edge of the level 
int nLevel=1;
LevelBase LvlBase;
void setup() {
  LvlBase = new LevelBase();
  size(900, 600); //18 nBoxSize, 12 nBoxSize
  nLevelHeight = height + nBoxSize; //19 nBoxSize
  nLevelWidth=width + width/2; // 27 nBoxSize\
  size(900, 600);
}
void draw() {
  background(20);
  textSize(48);
  textAlign(CENTER, CENTER);
  text("Level "+int(nLevel), width/2, height/2);
  LvlBase.drawLevel();
  for (Sprite nI : LvlBase.alPlat) {
    nI.display();
  }
  for (Sprite nI : LvlBase.alSpikes) {
    nI.display();
  }
  for (Sprite nI : LvlBase.alSaws) {
    nI.display();
  }
  for (LaserGun nI : LvlBase.alLaserGuns) {
    nI.update();
  }
  for (Sprite nI : LvlBase.alFake) {
    nI.display();
  }
  for (Sprite nI : LvlBase.alFallPlats) {
    nI.gravity();
    nI.display();
  }
  for (Sprite nI : LvlBase.alMovingSpikes) {
    nI.gravity();
    nI.display();
  }
}
void mousePressed() {  
  clearAllAL();
  LvlBase.bDrawn=false;
  nLevel++;
  if (nLevel==5)  nLevel=1;
}
// ========================== CLEAR ALL ARRAYLISTS =============================================
void clearAllAL() {
  // Clear function for the ArrayLists were found here: https://processing.org/reference/IntList_clear_.html
  LvlBase.alPlat.clear();
  LvlBase.alFallPlats.clear();
  LvlBase.alSpikes.clear();
  LvlBase.alMovingSpikes.clear();
  LvlBase.alSaws.clear();
  LvlBase.alLaserGuns.clear();
  LvlBase. alFake.clear();
}