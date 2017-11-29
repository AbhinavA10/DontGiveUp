class Level15 extends LevelBase {
  Level15() {
    super();

    // ============== PLATFORMS =============================================
    LvlBase.alPlat.add(new Sprite (nBoxSize*3, nLevelHeight-3*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));
    LvlBase.alPlat.add(new Sprite (nBoxSize*4, nLevelHeight-4*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));
    LvlBase.alPlat.add(new Sprite (nBoxSize*5, nLevelHeight-5*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));
    LvlBase.alPlat.add(new Sprite (nBoxSize*6, nLevelHeight-6*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));
    LvlBase.alPlat.add(new Sprite (nBoxSize*7, nLevelHeight-6*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));

    LvlBase.alPlat.add(new Sprite (nBoxSize*10, nBoxSize*4, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));
    LvlBase.alPlat.add(new Sprite (nBoxSize*14, nLevelHeight-6*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));
    LvlBase.alPlat.add(new Sprite (nBoxSize*14, nLevelHeight-8*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));
    LvlBase.alPlat.add(new Sprite (nBoxSize*15, nLevelHeight-8*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));
    //
    LvlBase.alPlat.add(new Sprite ( nLevelWidth-7*nBoxSize, nLevelHeight-5*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));
    LvlBase.alPlat.add(new Sprite ( nLevelWidth-7*nBoxSize, nLevelHeight-8*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));
    LvlBase.alPlat.add(new Sprite ( nLevelWidth-6*nBoxSize, nLevelHeight-6*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));

    // ============== FALLING PLATFORMS =============================================
    LvlBase.alFallPlats.add(new Sprite (nBoxSize*11, nLevelHeight-7*nBoxSize, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 250, 0, false));
    LvlBase.alFallPlats.add(new Sprite (nBoxSize*12, nLevelHeight-7*nBoxSize, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 250, 0, false));

    LvlBase.alFallPlats.add(new Sprite (nBoxSize*15, nLevelHeight-5*nBoxSize, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 250, 0, false));
    LvlBase.alFallPlats.add(new Sprite (nBoxSize*16, nLevelHeight-6*nBoxSize, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 250, 0, false));
    LvlBase.alFallPlats.add(new Sprite (nBoxSize*16, nLevelHeight-8*nBoxSize, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 250, 0, false));
    LvlBase.alFallPlats.add(new Sprite (nBoxSize*17, nLevelHeight-6*nBoxSize, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 250, 0, false));
    LvlBase.alFallPlats.add(new Sprite (nBoxSize*17, nLevelHeight-8*nBoxSize, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 250, 0, false));

    LvlBase.alFallPlats.add(new Sprite (nLevelWidth-8*nBoxSize, nLevelHeight-5*nBoxSize, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 250, 0, false));

    LvlBase.alFallPlats.add(new Sprite (nLevelWidth-5*nBoxSize, nLevelHeight-6*nBoxSize, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 250, 0, false));
    LvlBase.alFallPlats.add(new Sprite (nLevelWidth-4*nBoxSize, nLevelHeight-5*nBoxSize, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 250, 0, false));
    LvlBase.alFallPlats.add(new Sprite (nLevelWidth-3*nBoxSize, nLevelHeight-4*nBoxSize, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 250, 0, false));

    // ============== SPIKES =============================================
    LvlBase.alSpikes.add(new Sprite (nLevelWidth-4*nBoxSize, nLevelHeight-5.5*nBoxSize, 0, 0, 0, 0, "Spikes.png", 0, 0, 0, 0, false));
    LvlBase.alSpikes.add(new Sprite (nBoxSize*16, nLevelHeight-8.5*nBoxSize, 0, 0, 0, 0, "Spikes.png", 0, 0, 0, 0, false));


    // ============== LASER GUNS =============================================
    LvlBase.alLasers.add(new LaserGun(nBoxSize*3, nBoxSize*3, 2500));

    // ============== MOVING SPIKES =============================================
    //21
    for (int i = 0; i<19; i++) {
      LvlBase.alMovingSpikes.add(new Sprite (nBoxSize*int(i+3), nLevelHeight-1.5*nBoxSize, 0.8, 0.6, 10, 3, "movingSpikes.png", 0, 0, 0, 1, true)); //4,7
      LvlBase.alMovingSpikes.add(new Sprite (nBoxSize*int(i+3), nBoxSize+1, 0.8, 0.6, 8, 4, "movingSpikes.png", 0, 0, 0, 1, false)); //4,7
    }
    LvlBase.alMovingSpikes.add(new Sprite (nBoxSize*22, nLevelHeight-1.5*nBoxSize, 0.8, 0.6, 10, 3, "movingSpikes.png", 0, 0, 0, 1, true)); //4,7
    LvlBase.alMovingSpikes.add(new Sprite (nBoxSize*22, nBoxSize+1, 0.5, 0.6, 7, 4, "movingSpikes.png", 0, 0, 0, 1, false)); //4,7
    LvlBase.alMovingSpikes.add(new Sprite (nBoxSize*23, nLevelHeight-1.5*nBoxSize, 0.8, 0.6, 10, 3, "movingSpikes.png", 0, 0, 0, 1, true)); //4,7
    LvlBase.alMovingSpikes.add(new Sprite (nBoxSize*23, nBoxSize+1, 0.5, 0.6, 7, 4, "movingSpikes.png", 0, 0, 0, 1, false)); //4,7

    LvlBase.bDrawn = true;
  }
}