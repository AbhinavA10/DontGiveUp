class Level3 extends LevelBase {
  Level3() {
    super();
    LvlBase.alPlat.add(new Box (250, nLevelHeight-2*nBoxSize));
    LvlBase.alPlat.add(new Box (300, nLevelHeight-3*nBoxSize));
    LvlBase.alPlat.add(new Box (350, nLevelHeight-4*nBoxSize));
    LvlBase.alPlat.add(new Box (400, nLevelHeight-5*nBoxSize));
    LvlBase.alPlat.add(new Box (450, nLevelHeight-5*nBoxSize));
    LvlBase.alPlat.add(new Box (550, nLevelHeight-5*nBoxSize));
    LvlBase.alPlat.add(new Box (500, nLevelHeight-5*nBoxSize));
    LvlBase.alPlat.add(new Box (650, nLevelHeight-5*nBoxSize));
    LvlBase.alPlat.add(new Box (750, nLevelHeight-4*nBoxSize));
    bDrawn = true;
  }
}