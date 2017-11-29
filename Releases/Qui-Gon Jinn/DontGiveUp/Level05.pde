class Level05 extends LevelBase {
  Level05() {
    super();

    // ============== PLATFORMS =============================================
    LvlBase.alPlat.add(new Sprite (650, nLevelHeight-4*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0));
    LvlBase.alPlat.add(new Sprite (600, nLevelHeight-4*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0));
    LvlBase.alPlat.add(new Sprite (550, nLevelHeight-3*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0));
    LvlBase.alPlat.add(new Sprite (500, nLevelHeight-3*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0));
    LvlBase.alPlat.add(new Sprite (450, nLevelHeight-2*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0));
    LvlBase.alPlat.add(new Sprite (400, nLevelHeight-2*nBoxSize, 3, 3, 3, 0, "box.png", 0, 0, 0, 0));

    // ============== FALLING PLATFORMS =============================================
    LvlBase.alFallPlats.add(new Sprite (800, nLevelHeight-5*nBoxSize, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 250, 0));
    LvlBase.alFallPlats.add(new Sprite (750, nLevelHeight-5*nBoxSize, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 250, 0));
    LvlBase.alFallPlats.add(new Sprite (700, nLevelHeight-5*nBoxSize, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 250, 0));

    // ============== SPIKES =============================================
    LvlBase.alSpikes.add(new Sprite (800, nLevelHeight-1.5*nBoxSize, 0, 0, 0, 0, "Spikes.png", 0, 0, 0, 0));
    LvlBase.alSpikes.add(new Sprite (750, nLevelHeight-1.5*nBoxSize, 0, 0, 0, 0, "Spikes.png", 0, 0, 0, 0));
    LvlBase.alSpikes.add(new Sprite (700, nLevelHeight-1.5*nBoxSize, 0, 0, 0, 0, "Spikes.png", 0, 0, 0, 0));

    LvlBase.bDrawn = true;
  }
}