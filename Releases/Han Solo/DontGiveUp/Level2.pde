class Level2 extends LevelBase {
  Level2() {
    super();
    LvlBase.alPlat.add(new Sprite (750, nLevelHeight-2*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0));

    LvlBase.bDrawn = true;
  }
}