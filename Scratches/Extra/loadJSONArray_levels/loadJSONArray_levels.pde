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
String[] arSFileNames = new String[4];
int nLevel=0;
boolean bDrawn=false;
ArrayList <Sprite> alPlat = new ArrayList<Sprite>(); // 1
ArrayList <Sprite> alFallPlats = new ArrayList <Sprite>(); // 2
ArrayList <Sprite> alSpikes = new ArrayList<Sprite>(); // 3
ArrayList <Sprite> alMovingSpikes = new ArrayList <Sprite>(); // 4
ArrayList <Sprite> alFake = new ArrayList <Sprite>(); // 5
ArrayList <Sprite> alSaws = new ArrayList<Sprite>(); // 6
ArrayList <LaserGun> alLaserGuns = new ArrayList <LaserGun> (); // 7

void setup() {
  for (int i = 0; i<4; i++) {
    arSFileNames[i] = "data/Levels/Level"+ str(i+1)+".JSON";
  }
  size(900, 600);
}
void draw() {
  background(20);
  textSize(48);
  textAlign(CENTER, CENTER);
  text("Level "+int(nLevel+1), width/2, height/2);
  jsonArValues = loadJSONArray(arSFileNames[nLevel]);
  for (int j = 0; j < jsonArValues.size(); j++) {
    jsonObjItems = jsonArValues.getJSONObject(j); 

    createLevel();
  }
  for (Sprite nI : alPlat) {
    nI.display();
  }
  for (Sprite nI : alSpikes) {
    nI.display();
  }
  for (Sprite nI : alSaws) {
    nI.display();
  }
  for (LaserGun nI : alLaserGuns) {
    nI.update();
  }
  for (Sprite nI : alFake) {
    nI.display();
  }
  for (Sprite nI : alFallPlats) {
    nI.gravity();
    nI.display();
  }
  for (Sprite nI : alMovingSpikes) {
    nI.gravity();
    nI.display();
  }
}
void mousePressed() {  
  clearAllAL();
  bDrawn=false;

  nLevel++;
  if (nLevel==4)  nLevel=0;
}
// ========================== CLEAR ALL ARRAYLISTS =============================================
void clearAllAL() {
  // Clear function for the ArrayLists were found here: https://processing.org/reference/IntList_clear_.html
  alPlat.clear();
  alFallPlats.clear();
  alSpikes.clear();
  alMovingSpikes.clear();
  alSaws.clear();
  alLaserGuns.clear();
  alFake.clear();
}
// ================================== CREATE LEVEL =============================================
void createLevel() {  
  if (!bDrawn) {
    int nId = jsonObjItems.getInt("ID");
    float fX = jsonObjItems.getFloat("X");
    float fY = jsonObjItems.getFloat("Y");
    float fAccel = jsonObjItems.getFloat("Accel");
    float fVelocity = jsonObjItems.getFloat("Velocity");
    float fVelocityLimit = jsonObjItems.getFloat("Velocity Limit");
    int nDirec = jsonObjItems.getInt("Direc");
    String sImgName = jsonObjItems.getString("Image Name");
    int nMin = jsonObjItems.getInt("Min");
    int nMax = jsonObjItems.getInt("Max");
    int nGravityDelay = jsonObjItems.getInt("Gravity Delay");
    int nSpeed = jsonObjItems.getInt("Speed");
    boolean bFlipGravity  = jsonObjItems.getBoolean("Flip Gravity");
    int nTimer = jsonObjItems.getInt("Timer");
    switch(nId) {
    case 1: 
      alPlat.add(new Sprite (fX, fY, fAccel, fVelocity, fVelocityLimit, nDirec, sImgName, nMin, nMax, nGravityDelay, nSpeed, bFlipGravity));
      break;
    case 2: 
      alFallPlats.add(new Sprite (fX, fY, fAccel, fVelocity, fVelocityLimit, nDirec, sImgName, nMin, nMax, nGravityDelay, nSpeed, bFlipGravity));
      break;
    case 3: 
      alSpikes.add(new Sprite (fX, fY, fAccel, fVelocity, fVelocityLimit, nDirec, sImgName, nMin, nMax, nGravityDelay, nSpeed, bFlipGravity));
      break;
    case 4: 
      alMovingSpikes.add(new Sprite (fX, fY, fAccel, fVelocity, fVelocityLimit, nDirec, sImgName, nMin, nMax, nGravityDelay, nSpeed, bFlipGravity));
      break;
    case 5: 
      alFake.add(new Sprite (fX, fY, fAccel, fVelocity, fVelocityLimit, nDirec, sImgName, nMin, nMax, nGravityDelay, nSpeed, bFlipGravity));
      break;
    case 6: 
      alSaws.add(new Sprite(fX, fY, fAccel, fVelocity, fVelocityLimit, nDirec, sImgName, nMin, nMax, nGravityDelay, nSpeed, bFlipGravity));
      break;
    case 7: 
      alLaserGuns.add(new LaserGun(int(fX), int(fY), nTimer));
      break;
    }
  }
}