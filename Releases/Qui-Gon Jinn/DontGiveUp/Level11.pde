class Level11 extends LevelBase {
  Level11() {
    super();

    // ============== PLATFORMS =============================================
    LvlBase.alPlat.add(new Sprite (850, nLevelHeight-5*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0));
    LvlBase.alPlat.add(new Sprite (800, nLevelHeight-5*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0));
    LvlBase.alPlat.add(new Sprite (650, nLevelHeight-4*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0));
    LvlBase.alPlat.add(new Sprite (600, nLevelHeight-4*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0));
    LvlBase.alPlat.add(new Sprite (550, nLevelHeight-3*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0));
    LvlBase.alPlat.add(new Sprite (500, nLevelHeight-3*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0));
    LvlBase.alPlat.add(new Sprite (450, nLevelHeight-2*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0));
    LvlBase.alPlat.add(new Sprite (400, nLevelHeight-2*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0));

    // ============== SPIKES =============================================
    LvlBase.alSpikes.add(new Sprite (700, nLevelHeight-2*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0));
    LvlBase.alSpikes.add(new Sprite (750, nLevelHeight-2*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0));
    LvlBase.alSpikes.add(new Sprite (800, nLevelHeight-1.5*nBoxSize, 0, 0, 0, 0, "Spikes.png", 0, 0, 0, 0));
    LvlBase.alSpikes.add(new Sprite (850, nLevelHeight-1.5*nBoxSize, 0, 0, 0, 0, "Spikes.png", 0, 0, 0, 0));
    LvlBase.alSpikes.add(new Sprite (900, nLevelHeight-1.5*nBoxSize, 0, 0, 0, 0, "Spikes.png", 0, 0, 0, 0));
    LvlBase.alSpikes.add(new Sprite (950, nLevelHeight-1.5*nBoxSize, 0, 0, 0, 0, "Spikes.png", 0, 0, 0, 0));
    LvlBase.alSpikes.add(new Sprite (1000, nLevelHeight-1.5*nBoxSize, 0, 0, 0, 0, "Spikes.png", 0, 0, 0, 0));
    LvlBase.alSpikes.add(new Sprite (1050, nLevelHeight-1.5*nBoxSize, 0, 0, 0, 0, "Spikes.png", 0, 0, 0, 0));

    LvlBase.alSpikes.add(new Sprite (800, nLevelHeight-5.5*nBoxSize, 0, 0, 0, 0, "Spikes.png", 0, 0, 0, 0));

    // ============== SAWS =============================================
    LvlBase.alSaws.add(new Sprite(nLevelWidth/2+nBoxSize, nLevelHeight/2, 0, 0, 0, 7, "shurikan.png", 75, 75, 0, 6));

    // ============== LASER GUNS =============================================
    LvlBase.alLasers.add(new LaserGun(nBoxSize*12, nBoxSize*4, 1500));

    // ============== FAKE =============================================
    LvlBase.alFake.add(new Sprite (850, nLevelHeight-5.5*nBoxSize, 0, 0, 0, 0, "Spikes.png", 0, 0, 0, 0));

    LvlBase.bDrawn = true;
  }
}