/*For inheritance, we got help from Mr. Grondin, and the following sites:
 https://processing.org/examples/inheritance.html
 https://processing.org/reference/extends.html
 https://processing.org/reference/super.html*/
class LevelBase {
  ArrayList <Sprite> alBox = new ArrayList<Sprite>(); 
  ArrayList <Sprite> alPlat = new ArrayList<Sprite>(); // nId = 1
  ArrayList <Sprite> alFallPlats = new ArrayList <Sprite>(); // nId = 2
  ArrayList <Sprite> alSpikes = new ArrayList<Sprite>(); // nId = 3
  ArrayList <Sprite> alMovingSpikes = new ArrayList <Sprite>(); // nId = 4
  ArrayList <Sprite> alFake = new ArrayList <Sprite>(); // nId = 5
  ArrayList <Sprite> alSaws = new ArrayList<Sprite>(); // nId = 6
  ArrayList <LaserGun> alLaserGuns = new ArrayList <LaserGun> (); // nId = 7
  ArrayList <Sprite> alBullets = new ArrayList <Sprite> ();
  ArrayList <Sprite> alGore = new ArrayList <Sprite> ();

  boolean bDrawn = false;// needed for multiple levels and to stop continously adding more boxes/spikes
  String[] arSFileNames = new String[5];
  //https://processing.org/reference/splitTokens_.html
  String[] arSSplitTokensResult; // as splitTokens() returns an array with the string split up, we have to first create the array 
  // ============== CONSTRUCTOR =============================================
  LevelBase() {
    int nAmount = 100; // max number of boxes
    int fX=0, fY=0; //poisition of the box
    String sDrawDirec = "Right";
    if (bDrawn == false) {
      for (int i= 0; i<nAmount; i++) {
        if (sDrawDirec == "Right") {
          alBox.add(new Sprite (fX, fY, 1.6, 0.6, 16, 0, "box.png", 0, 0, 0, 0, false));
          fX+=50;
          if (fX>=nLevelWidth-nBoxSize) { // nBoxSize has to be subtracted from the Width of the level to show the box
            sDrawDirec="Down";
          }
        } else if (sDrawDirec == "Down") {
          alBox.add(new Sprite (fX, fY, 1.6, 0.6, 16, 0, "box.png", 0, 0, 0, 0, false));
          fY+=50;
          if (fY>=height) {
            sDrawDirec="Left";
            // println(fX); // used for debugging
          }
        } else if (sDrawDirec == "Left") {
          alBox.add(new Sprite (fX, fY, 1.6, 0.6, 16, 0, "box.png", 0, 0, 0, 0, false));
          fX-=50;
          if (fX<=0) {
            sDrawDirec="Up";
          }
        } else if (sDrawDirec == "Up") {
          alBox.add(new Sprite (fX, fY, 1.6, 0.6, 16, 0, "box.png", 0, 0, 0, 0, false));
          fY-=50;
          if (fY<=-50) {
            sDrawDirec="none";
          }
        }
      } 
      for (int i = 0; i<5; i++) {
        arSFileNames[i] = "data/Levels/Level"+ str(i+1)+".JSON";
      }
    }
  }
  // ============== DRAW LEVEL =============================================
  void drawLevel() {
    if (!bDrawn) {
      clearAllAL();
      jsonArValues = loadJSONArray(arSFileNames[nLevel-1]);
      for (int j = 0; j < jsonArValues.size(); j++) {
        jsonObjItems = jsonArValues.getJSONObject(j); 
        createLevel();
      }
      println("created Level "+nLevel);
      bDrawn = true;
    }
  }
  // ================================== CREATE LEVEL =============================================
  void createLevel() {  
    if (!bDrawn) {
      //https://processing.org/reference/loadJSONArray_.html was where we learned how to load an Array of JSON objects.
      int nId = jsonObjItems.getInt("ID");
      String sX = jsonObjItems.getString("X");
      String sY = jsonObjItems.getString("Y");
      String sXType = jsonObjItems.getString("XType");
      String sYType = jsonObjItems.getString("YType");
      float fX = fDetermineCoord(sX, sXType);
      float fY = fDetermineCoord(sY, sYType);
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
  // ================================== DETERMINE CO-ORDINATES =============================================
  float fDetermineCoord(String sCoord, String sCoordType) {
    /* This is the coord in string format in the JSON file. 
     It also receives an input of the type of coordinate that it is (i.e. how to calculate it)
     For example, if the Coord string is "nLevelHeight-2*nBoxSize, it is classified as 
     "Height minus MultBox" (Mult is our short form for Multiply) Based on how to calculate the Coord, 
     the if structure below is run, sCoord is split into and array, and then calculated.*/
    if (sCoordType.equals("Height minus MultBox")) {
      arSSplitTokensResult = splitTokens(sCoord, "-*");
      float fCoord = nLevelHeight - float(arSSplitTokensResult[1])* nBoxSize;
      return fCoord;
    } else if (sCoordType.equals("Width minus MultBox")) {
      arSSplitTokensResult = splitTokens(sCoord, "-*");
      float fCoord = nLevelWidth - float(arSSplitTokensResult[1])* nBoxSize;
      return fCoord;
    } else if (sCoordType.equals("MultBox")) {
      arSSplitTokensResult = splitTokens(sCoord, "*");
      float fCoord = nBoxSize * float(arSSplitTokensResult[1]);
      return fCoord;
    } else if (sCoordType.equals("Divide Height and AddBox")) {
      arSSplitTokensResult = splitTokens(sCoord, "/+");
      float fCoord = nLevelHeight / float(arSSplitTokensResult[1]) + nBoxSize;
      return fCoord;
    } else if (sCoordType.equals("Divide Width and AddBox")) {
      arSSplitTokensResult = splitTokens(sCoord, "/+");
      float fCoord = nLevelWidth / float(arSSplitTokensResult[1]) + nBoxSize;
      return fCoord;
    } else if (sCoordType.equals("Divide Height")) {
      arSSplitTokensResult = splitTokens(sCoord, "/");
      float fCoord = nLevelHeight / float(arSSplitTokensResult[1]);
      return fCoord;
    } else if (sCoordType.equals("Divide Width")) {
      arSSplitTokensResult = splitTokens(sCoord, "/");
      float fCoord = nLevelWidth / float(arSSplitTokensResult[1]);
      return fCoord;
    } else return float(sCoord);
  }
  /*float fX = fDetermineCoord(sX, sXType);
   float fY = fDetermineCoord(sY, sYType);
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
   float fDetermineCoord(String sCoord, String sCoordType) {
   if (sCoordType.equals("something")) {
   sMatch = match(sCoord, "nLevelHeight");
   sST = splitTokens(sCoord, "-*");
   if (sMatch!=null) {
   float fX = nLevelWidth - float(sST[1])* nBoxSize;
   println(fX);
   return fX;
   } else return float(sCoord);
   } else if (sCoordType.equals("something else")) {
   return 0;
   } else return float(sCoord);
   }*/
}