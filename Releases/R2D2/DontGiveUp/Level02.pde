class Level02 extends LevelBase {
  Level02() {
    super();

    // ============== PLATFORMS =============================================
    LvlBase.alPlat.add(new Sprite (750, nLevelHeight-2*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));

    LvlBase.bDrawn = true;
  }
}