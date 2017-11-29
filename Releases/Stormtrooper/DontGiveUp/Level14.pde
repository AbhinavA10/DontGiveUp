class Level14 extends LevelBase {
  Level14() {
    super();

    // ============== PLATFORMS =============================================
    LvlBase.alPlat.add(new Sprite (1200, 8*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));
    LvlBase.alPlat.add(new Sprite (1100, 7*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));
    LvlBase.alPlat.add(new Sprite (1000, 6*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));
    LvlBase.alPlat.add(new Sprite (850, 5*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));
    LvlBase.alPlat.add(new Sprite (800, 5*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));
    LvlBase.alPlat.add(new Sprite (650, 4*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));
    LvlBase.alPlat.add(new Sprite (600, 4*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));
    LvlBase.alPlat.add(new Sprite (550, 3*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));
    LvlBase.alPlat.add(new Sprite (500, 3*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));
    LvlBase.alPlat.add(new Sprite (450, 2*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));
    LvlBase.alPlat.add(new Sprite (400, 2*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));

    LvlBase.alPlat.add(new Sprite (600, nLevelHeight-2*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));
    LvlBase.alPlat.add(new Sprite (650, nLevelHeight-2*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));
    LvlBase.alPlat.add(new Sprite (700, nLevelHeight-2*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));

    // ============== MOVING SPIKES =============================================
    LvlBase.alMovingSpikes.add(new Sprite (600, nLevelHeight-2.5*nBoxSize, 0.8, 1, 15, 3, "movingSpikes.png", 0, 0, 250, 1, true)); //4,7
    LvlBase.alMovingSpikes.add(new Sprite (650, nLevelHeight-2.5*nBoxSize, 0.8, 1, 15, 3, "movingSpikes.png", 0, 0, 250, 1, true));
    LvlBase.alMovingSpikes.add(new Sprite (700, nLevelHeight-2.5*nBoxSize, 0.8, 1, 15, 3, "movingSpikes.png", 0, 0, 250, 1, true));

    // ============== SPIKES =============================================
    LvlBase.alSpikes.add(new Sprite (500, nBoxSize, 0, 0, 0, 0, "Spikes.png", 0, 0, 0, 0, true));
    LvlBase.alSpikes.add(new Sprite (550, nBoxSize, 0, 0, 0, 0, "Spikes.png", 0, 0, 0, 0, true));
    LvlBase.alSpikes.add(new Sprite (600, nBoxSize, 0, 0, 0, 0, "Spikes.png", 0, 0, 0, 0, true));

    LvlBase.alSpikes.add(new Sprite (200, nLevelHeight-1.5*nBoxSize, 0, 0, 0, 0, "Spikes.png", 0, 0, 0, 0, false));
    LvlBase.alSpikes.add(new Sprite (250, nLevelHeight-1.5*nBoxSize, 0, 0, 0, 0, "Spikes.png", 0, 0, 0, 0, false));
    LvlBase.alSpikes.add(new Sprite (300, nLevelHeight-1.5*nBoxSize, 0, 0, 0, 0, "Spikes.png", 0, 0, 0, 0, false));
    LvlBase.alSpikes.add(new Sprite (350, nLevelHeight-1.5*nBoxSize, 0, 0, 0, 0, "Spikes.png", 0, 0, 0, 0, false));

    // ============== SAWS =============================================
    LvlBase.alSaws.add(new Sprite(nLevelWidth-5.5*nBoxSize, nLevelHeight-3.5*nBoxSize, 0, 0, 0, 7, "shurikan.png", 75, 75, 0, 3, false));

    // ============== LASER GUNS =============================================
    LvlBase.alLasers.add(new LaserGun(nBoxSize*5, nBoxSize*3, 2500));

    sprHero.bFlipGravity=true;

    LvlBase.bDrawn = true;
  }
}