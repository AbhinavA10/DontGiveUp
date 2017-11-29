class Level19 extends LevelBase {
  Level19() {
    super();

    // ============== PLATFORMS =============================================
    LvlBase.alPlat.add(new Sprite (nBoxSize*3, nLevelHeight-3*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));
    LvlBase.alPlat.add(new Sprite (nBoxSize*4, nLevelHeight-5*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));

    LvlBase.alPlat.add(new Sprite (nBoxSize*8, nBoxSize*6, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));
    LvlBase.alPlat.add(new Sprite (nBoxSize*10, nBoxSize*4, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));

    LvlBase.alPlat.add(new Sprite (nBoxSize*10, nBoxSize*8, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));
    LvlBase.alPlat.add(new Sprite (nBoxSize*12, nBoxSize*6, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));
    LvlBase.alPlat.add(new Sprite (nBoxSize*16, nBoxSize*8, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));
    LvlBase.alPlat.add(new Sprite (nBoxSize*18, nBoxSize*7, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));
    LvlBase.alPlat.add(new Sprite (nBoxSize*21, nBoxSize*5, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));

    // ============== FALLING PLATFORMS =============================================
    LvlBase.alFallPlats.add(new Sprite (nBoxSize*5, nLevelHeight-4*nBoxSize, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 200, 0, false));
    LvlBase.alFallPlats.add(new Sprite (nBoxSize*6, nLevelHeight-4*nBoxSize, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 200, 0, false));
    LvlBase.alFallPlats.add(new Sprite (nBoxSize*7, nLevelHeight-5*nBoxSize, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 200, 0, false));
    LvlBase.alFallPlats.add(new Sprite (nBoxSize*8, nLevelHeight-4*nBoxSize, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 200, 0, false));

    LvlBase.alFallPlats.add(new Sprite (nBoxSize*9, nBoxSize*5, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 200, 0, false));
    LvlBase.alFallPlats.add(new Sprite (nBoxSize*11, nBoxSize*4, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 200, 0, false));
    LvlBase.alFallPlats.add(new Sprite (nBoxSize*11, nBoxSize*7, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 200, 0, false));
    LvlBase.alFallPlats.add(new Sprite (nBoxSize*12, nBoxSize*4, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 200, 0, false));
    LvlBase.alFallPlats.add(new Sprite (nBoxSize*13, nBoxSize*3, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 200, 0, false));
    LvlBase.alFallPlats.add(new Sprite (nBoxSize*13, nBoxSize*6, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 200, 0, false));
    LvlBase.alFallPlats.add(new Sprite (nBoxSize*14, nBoxSize*4, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 200, 0, false));

    LvlBase.alFallPlats.add(new Sprite (nBoxSize*15, nBoxSize*7, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 200, 0, false));
    LvlBase.alFallPlats.add(new Sprite (nBoxSize*17, nBoxSize*8, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 200, 0, false));
    LvlBase.alFallPlats.add(new Sprite (nBoxSize*19, nBoxSize*7, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 200, 0, false));
    LvlBase.alFallPlats.add(new Sprite (nBoxSize*20, nBoxSize*6, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 200, 0, false));
    LvlBase.alFallPlats.add(new Sprite (nBoxSize*23, nBoxSize*5, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 200, 0, false));
    // ============== SPIKES =============================================
    LvlBase.alSpikes.add(new Sprite (nBoxSize*5, nLevelHeight-4.5*nBoxSize, 0, 0, 0, 0, "Spikes.png", 0, 0, 0, 0, false));
    LvlBase.alSpikes.add(new Sprite (nBoxSize*8, nLevelHeight-1.5*nBoxSize, 0, 0, 0, 0, "Spikes.png", 0, 0, 0, 0, false));
    LvlBase.alSpikes.add(new Sprite (nBoxSize*12, nLevelHeight-1.5*nBoxSize, 0, 0, 0, 0, "Spikes.png", 0, 0, 0, 0, false));
    LvlBase.alSpikes.add(new Sprite (nBoxSize*13, nLevelHeight-1.5*nBoxSize, 0, 0, 0, 0, "Spikes.png", 0, 0, 0, 0, false));
    LvlBase.alSpikes.add(new Sprite (nBoxSize*15, nLevelHeight-1.5*nBoxSize, 0, 0, 0, 0, "Spikes.png", 0, 0, 0, 0, false));
    LvlBase.alSpikes.add(new Sprite (nBoxSize*20, nLevelHeight-1.5*nBoxSize, 0, 0, 0, 0, "Spikes.png", 0, 0, 0, 0, false));
    LvlBase.alSpikes.add(new Sprite (nBoxSize*22, nLevelHeight-1.5*nBoxSize, 0, 0, 0, 0, "Spikes.png", 0, 0, 0, 0, false));

    LvlBase.alSpikes.add(new Sprite (nBoxSize*12, nBoxSize*3.5, 0, 0, 0, 0, "Spikes.png", 0, 0, 0, 0, false));
    LvlBase.alSpikes.add(new Sprite (nBoxSize*13, nBoxSize*4, 0, 0, 0, 0, "Spikes.png", 0, 0, 0, 0, true));
    LvlBase.alSpikes.add(new Sprite (nBoxSize*17, nBoxSize*7.5, 0, 0, 0, 0, "Spikes.png", 0, 0, 0, 0, false));

    // ============== SAWS =============================================
    LvlBase.alSaws.add(new Sprite(nBoxSize*4, nBoxSize*5.5, 0, 0, 0, 7, "shurikan.png", 100, 100, 0, 7, false));
    LvlBase.alSaws.add(new Sprite(nBoxSize*5.5, nLevelHeight-1.5*nBoxSize, 0, 0, 0, 1, "shurikan.png", 75, 75, 0, 7, false));

    LvlBase.alSaws.add(new Sprite(nBoxSize*9.5, nBoxSize*2, 0, 0, 0, 2, "shurikan.png", 75, 75, 0, 5, false));

    LvlBase.alSaws.add(new Sprite(nBoxSize*9, nLevelHeight-2*nBoxSize, 0, 0, 0, 5, "shurikan.png", 25, 25, 0, 3, false));
    LvlBase.alSaws.add(new Sprite(nBoxSize*10, nLevelHeight-2*nBoxSize, 0, 0, 0, 6, "shurikan.png", 25, 25, 0, 3, false));

    LvlBase.alSaws.add(new Sprite(nBoxSize*12.5, nLevelHeight-2.5*nBoxSize, 0, 0, 0, 7, "shurikan.png", 50, 50, 0, 5, false));

    LvlBase.alSaws.add(new Sprite(nBoxSize*13, nLevelHeight-3*nBoxSize, 0, 0, 0, 5, "shurikan.png", 75, 75, 0, 3, false));

    LvlBase.alSaws.add(new Sprite(nBoxSize*14, nBoxSize*7.5, 0, 0, 0, 8, "shurikan.png", 50, 50, 0, 4, false));

    LvlBase.alSaws.add(new Sprite(nBoxSize*20, nBoxSize*8.5, 0, 0, 0, 7, "shurikan.png", 100, 100, 0, 8, false));
    LvlBase.alSaws.add(new Sprite(nBoxSize*22, nBoxSize*9.5, 0, 0, 0, 7, "shurikan.png", 75, 75, 0, 5, false));

    LvlBase.alSaws.add(new Sprite(nBoxSize*18, nLevelHeight-1.5*nBoxSize, 0, 0, 0, 2, "shurikan.png", 75, 75, 0, 5, false));
    LvlBase.alSaws.add(new Sprite(nBoxSize*21, nLevelHeight-1.5*nBoxSize, 0, 0, 0, 2, "shurikan.png", 1, 51, 0, 2, false));

    LvlBase.alSaws.add(new Sprite(nLevelWidth-2*nBoxSize, nBoxSize*7, 0, 0, 0, 3, "shurikan.png", 125, 125, 0, 5, false));
    LvlBase.alSaws.add(new Sprite(nLevelWidth-1.5*nBoxSize, nBoxSize*7, 0, 0, 0, 4, "shurikan.png", 125, 125, 0, 5, false));

    // ============== LASER GUNS =============================================
    LvlBase.alLasers.add(new LaserGun(nBoxSize*3, nBoxSize*3, 100));    
    LvlBase.alLasers.add(new LaserGun(nBoxSize*18, nBoxSize*3, 3500));


    LvlBase.bDrawn = true;
  }
}