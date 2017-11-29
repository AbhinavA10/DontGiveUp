class Level4 extends LevelBase {
  Level4() {
    super();
    LvlBase.alPlat.add(new Sprite (750, nLevelHeight-4*nBoxSize, 0, 0, 1.6, 0.6, 16, 0, "box.png"));
    bDrawn = true;
  }
}