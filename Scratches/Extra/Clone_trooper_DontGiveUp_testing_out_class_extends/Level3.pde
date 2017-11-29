class Level3 extends LevelBase {
  void createBoxes() {
    if (nLevel == 3 && bDrawn == false) { 
      alBox.add(new Box (250, nLevelHeight-2*nBoxSize));
      alBox.add(new Box (300, nLevelHeight-3*nBoxSize));
      alBox.add(new Box (350, nLevelHeight-4*nBoxSize));
      alBox.add(new Box (400, nLevelHeight-5*nBoxSize));
      alBox.add(new Box (450, nLevelHeight-5*nBoxSize));
      alBox.add(new Box (550, nLevelHeight-5*nBoxSize));
      alBox.add(new Box (500, nLevelHeight-5*nBoxSize));
      alBox.add(new Box (650, nLevelHeight-5*nBoxSize));
      alBox.add(new Box (750, nLevelHeight-4*nBoxSize));
      super.createBoxes();
    }
  }
}