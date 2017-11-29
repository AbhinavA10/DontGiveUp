class LevelBase {
  LevelBase() {
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
      bDrawn = true;
    }
  }
}