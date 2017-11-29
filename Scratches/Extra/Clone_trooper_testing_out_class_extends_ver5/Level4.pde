class Level4 extends LevelBase {
  Level4() {
    super();
    LvlBase.alPlat.add(new Box (750, nLevelHeight-4*nBoxSize));
    bDrawn = true;
  }
}