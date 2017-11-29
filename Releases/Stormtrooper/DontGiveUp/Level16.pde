class Level16 extends LevelBase {
  Level16() {
    super();
    // ============== PLATFORMS =============================================
    LvlBase.alPlat.add(new Sprite (nBoxSize*7, nLevelHeight-7*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));
    LvlBase.alPlat.add(new Sprite (nBoxSize*7, nLevelHeight-4*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));
    LvlBase.alPlat.add(new Sprite (nBoxSize*9, nLevelHeight-5*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));

    LvlBase.alPlat.add(new Sprite (nBoxSize*10, nLevelHeight-6*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));
    LvlBase.alPlat.add(new Sprite (nBoxSize*10, nLevelHeight-5*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));
    LvlBase.alPlat.add(new Sprite (nBoxSize*10, nLevelHeight-4*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));
    LvlBase.alPlat.add(new Sprite (nBoxSize*11, nLevelHeight-4*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));

    LvlBase.alPlat.add(new Sprite (nBoxSize*12, nLevelHeight-8*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));
    LvlBase.alPlat.add(new Sprite (nBoxSize*12, nLevelHeight-4*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));


    LvlBase.alPlat.add(new Sprite (nBoxSize*13, nLevelHeight-8*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));
    LvlBase.alPlat.add(new Sprite (nBoxSize*13, nLevelHeight-7*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));
    LvlBase.alPlat.add(new Sprite (nBoxSize*13, nLevelHeight-6*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));
    LvlBase.alPlat.add(new Sprite (nBoxSize*13, nLevelHeight-4*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));

    LvlBase.alPlat.add(new Sprite (nBoxSize*16, nLevelHeight-6*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));
    LvlBase.alPlat.add(new Sprite (nBoxSize*17, nLevelHeight-6*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));

    // ============== FALLING PLATFORMS =============================================
    LvlBase.alFallPlats.add(new Sprite (nBoxSize*3, nLevelHeight-3*nBoxSize, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 100, 0, false));
    LvlBase.alFallPlats.add(new Sprite (nBoxSize*4, nLevelHeight-3*nBoxSize, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 100, 0, false));
    LvlBase.alFallPlats.add(new Sprite (nBoxSize*5, nLevelHeight-4*nBoxSize, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 100, 0, false));
    LvlBase.alFallPlats.add(new Sprite (nBoxSize*6, nLevelHeight-5*nBoxSize, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 100, 0, false));
    LvlBase.alFallPlats.add(new Sprite (nBoxSize*8, nLevelHeight-8*nBoxSize, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 100, 0, false));
    LvlBase.alFallPlats.add(new Sprite (nBoxSize*8, nLevelHeight-5*nBoxSize, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 100, 0, false));
    LvlBase.alFallPlats.add(new Sprite (nBoxSize*9, nLevelHeight-9*nBoxSize, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 100, 0, false));
    LvlBase.alFallPlats.add(new Sprite (nBoxSize*11, nLevelHeight-8*nBoxSize, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 250, 0, false));

    LvlBase.alFallPlats.add(new Sprite (nLevelWidth-9*nBoxSize, nLevelHeight-7*nBoxSize, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 100, 0, false));
    LvlBase.alFallPlats.add(new Sprite (nLevelWidth-8*nBoxSize, nLevelHeight-7*nBoxSize, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 100, 0, false));
    LvlBase.alFallPlats.add(new Sprite (nLevelWidth-7*nBoxSize, nLevelHeight-6*nBoxSize, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 100, 0, false));
    LvlBase.alFallPlats.add(new Sprite (nLevelWidth-6*nBoxSize, nLevelHeight-5*nBoxSize, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 100, 0, false));
    LvlBase.alFallPlats.add(new Sprite (nLevelWidth-5*nBoxSize, nLevelHeight-2*nBoxSize, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 100, 0, false));
    LvlBase.alFallPlats.add(new Sprite (nLevelWidth-4*nBoxSize, nLevelHeight-2*nBoxSize, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 100, 0, false));

    // ============== SPIKES =============================================
    LvlBase.alSpikes.add(new Sprite (nBoxSize*7, nLevelHeight-4.5*nBoxSize, 0, 0, 0, 0, "Spikes.png", 0, 0, 0, 0, false));

    // ============== MOVING SPIKES =============================================
    LvlBase.alMovingSpikes.add(new Sprite (nBoxSize*3, nBoxSize+1, 0.8, 0.6, 8, 4, "movingSpikes.png", 0, 0, 0, 1, false));
    LvlBase.alMovingSpikes.add(new Sprite (nBoxSize*11, nBoxSize+1, 0.8, 0.6, 8, 4, "movingSpikes.png", 0, 0, 0, 1, false));
    LvlBase.alMovingSpikes.add(new Sprite (nBoxSize*12, nBoxSize+1, 0.8, 0.6, 8, 4, "movingSpikes.png", 0, 0, 0, 1, false));
    LvlBase.alMovingSpikes.add(new Sprite (nBoxSize*13, nBoxSize+1, 0.8, 0.6, 8, 4, "movingSpikes.png", 0, 0, 0, 1, false));

    LvlBase.alMovingSpikes.add(new Sprite (nLevelWidth-9*nBoxSize, nBoxSize+1, 0.8, 0.6, 8, 4, "movingSpikes.png", 0, 0, 0, 1, false));

    LvlBase.alMovingSpikes.add(new Sprite (nLevelWidth-2.01*nBoxSize, nBoxSize+1, 0.8, 0.6, 8, 4, "movingSpikes.png", 0, 0, 0, 1, false));

    // ============== SAWS =============================================
    LvlBase.alSaws.add(new Sprite(nBoxSize*10.5, nLevelHeight-8.5*nBoxSize, 0, 0, 0, 3, "shurikan.png", 100, 100, 0, 9, false));
    LvlBase.alSaws.add(new Sprite(nBoxSize*16, nLevelHeight-8*nBoxSize, 0, 0, 0, 7, "shurikan.png", 25, 100, 0, 8, false));
    LvlBase.alSaws.add(new Sprite(nLevelWidth-3.5*nBoxSize, nLevelHeight-4*nBoxSize, 0, 0, 0, 7, "shurikan.png", 200, 100, 0, 7, false));

    LvlBase.alSaws.add(new Sprite(nLevelWidth-8*nBoxSize, nLevelHeight-4.5*nBoxSize, 0, 0, 0, 1, "shurikan.png", 150, 100, 0, 8, false));
    LvlBase.alSaws.add(new Sprite(nLevelWidth-9*nBoxSize, nLevelHeight-3.5*nBoxSize, 0, 0, 0, 2, "shurikan.png", 150, 100, 0, 6, false));

    LvlBase.alSaws.add(new Sprite(nBoxSize*5, nLevelHeight-1.5*nBoxSize, 0, 0, 0, 1, "shurikan.png", 100, 100, 0, 7, false));
    LvlBase.alSaws.add(new Sprite(nBoxSize*5.5, nLevelHeight-1.5*nBoxSize, 0, 0, 0, 2, "shurikan.png", 100, 100, 0, 8, false));
    LvlBase.alSaws.add(new Sprite(nBoxSize*9, nLevelHeight-1.5*nBoxSize, 0, 0, 0, 1, "shurikan.png", 100, 150, 0, 6, false));
    LvlBase.alSaws.add(new Sprite(nBoxSize*7, nLevelHeight-1.5*nBoxSize, 0, 0, 0, 2, "shurikan.png", 150, 100, 0, 5, false));
    LvlBase.alSaws.add(new Sprite(nBoxSize*10, nLevelHeight-1.5*nBoxSize, 0, 0, 0, 1, "shurikan.png", 100, 100, 0, 7, false));
    LvlBase.alSaws.add(new Sprite(nBoxSize*9.5, nLevelHeight-1.5*nBoxSize, 0, 0, 0, 2, "shurikan.png", 100, 100, 0, 8, false));
    LvlBase.alSaws.add(new Sprite(nBoxSize*16, nLevelHeight-1.5*nBoxSize, 0, 0, 0, 1, "shurikan.png", 100, 150, 0, 6, false));
    LvlBase.alSaws.add(new Sprite(nBoxSize*15, nLevelHeight-1.5*nBoxSize, 0, 0, 0, 2, "shurikan.png", 150, 100, 0, 5, false));
    LvlBase.alSaws.add(new Sprite(nBoxSize*11, nLevelHeight-1.5*nBoxSize, 0, 0, 0, 1, "shurikan.png", 250, 250, 0, 9, false));
    LvlBase.alSaws.add(new Sprite(nBoxSize*14, nLevelHeight-1.5*nBoxSize, 0, 0, 0, 1, "shurikan.png", 250, 250, 0, 9, false));
    LvlBase.alSaws.add(new Sprite(nBoxSize*16, nLevelHeight-1.5*nBoxSize, 0, 0, 0, 1, "shurikan.png", 250, 250, 0, 9, false));

    // ============== LASER GUNS =============================================
    LvlBase.alLasers.add(new LaserGun(nBoxSize*5, nBoxSize*3, 3500));

    LvlBase.bDrawn = true;
  }
}