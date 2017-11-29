class Level2 extends LevelBase {
  Level2() {
    super();
    LvlBase.alPlat.add(new Sprite (nLevelWidth-10*nBoxSize, nLevelHeight-3*nBoxSize, 0, 0, 1.6, 0.6, 16, 0, "box.png"));
    LvlBase.alPlat.add(new Sprite (nLevelWidth-9*nBoxSize, nLevelHeight-3*nBoxSize, 0, 0, 1.6, 0.6, 16, 0, "box.png"));
    LvlBase.alPlat.add(new Sprite (nLevelWidth-8*nBoxSize, nLevelHeight-3*nBoxSize, 0, 0, 1.6, 0.6, 16, 0, "box.png"));
    bDrawn = true;
  }
}