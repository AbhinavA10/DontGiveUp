class Level2 extends LevelBase {
  void createBoxes() {
    if (nLevel==2 && bDrawn == false) {
      alBox.add(new Box (nLevelWidth-10*nBoxSize, nLevelHeight-3*nBoxSize));
      alBox.add(new Box (nLevelWidth-9*nBoxSize, nLevelHeight-3*nBoxSize));
      alBox.add(new Box (nLevelWidth-8*nBoxSize, nLevelHeight-3*nBoxSize));
    }
  }
}