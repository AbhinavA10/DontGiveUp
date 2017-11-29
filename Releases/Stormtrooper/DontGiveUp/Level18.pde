class Level18 extends LevelBase {
  Level18() {
    super();

    // ============== PLATFORMS =============================================
    LvlBase.alPlat.add(new Sprite (nBoxSize*3, nLevelHeight-2*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));
    LvlBase.alPlat.add(new Sprite (nBoxSize*6, nLevelHeight-2*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));
    LvlBase.alPlat.add(new Sprite (nBoxSize*7, nBoxSize*6, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));
    LvlBase.alPlat.add(new Sprite (nBoxSize*12, nBoxSize*5, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));
    LvlBase.alPlat.add(new Sprite (nBoxSize*12, nBoxSize*6, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));
    LvlBase.alPlat.add(new Sprite (nBoxSize*14, nBoxSize*9, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));
    LvlBase.alPlat.add(new Sprite (nBoxSize*15, nBoxSize*8, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));
    // LvlBase.alPlat.add(new Sprite (nBoxSize*16, nBoxSize*5, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));
    LvlBase.alPlat.add(new Sprite (nBoxSize*16, nBoxSize*8, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));
    LvlBase.alPlat.add(new Sprite (nBoxSize*17, nBoxSize*6, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));
    LvlBase.alPlat.add(new Sprite (nBoxSize*17, nBoxSize*7, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));
    LvlBase.alPlat.add(new Sprite (nLevelWidth-5*nBoxSize, nLevelHeight-2*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));
    LvlBase.alPlat.add(new Sprite (nLevelWidth-4*nBoxSize, nLevelHeight-3*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));

    // ============== FALLING PLATFORMS =============================================
    LvlBase.alFallPlats.add(new Sprite (nBoxSize*7, nLevelHeight-3*nBoxSize, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 200, 0, false));
    LvlBase.alFallPlats.add(new Sprite (nBoxSize*8, nBoxSize*6, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 200, 0, false));
    LvlBase.alFallPlats.add(new Sprite (nBoxSize*8, nLevelHeight-4*nBoxSize, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 200, 0, false));
    LvlBase.alFallPlats.add(new Sprite (nBoxSize*9, nLevelHeight-4*nBoxSize, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 200, 0, false));
    LvlBase.alFallPlats.add(new Sprite (nBoxSize*10, nLevelHeight-5*nBoxSize, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 200, 0, false));
    LvlBase.alFallPlats.add(new Sprite (nBoxSize*11, nLevelHeight-6*nBoxSize, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 200, 0, false));
    LvlBase.alFallPlats.add(new Sprite (nBoxSize*12, nLevelHeight-3*nBoxSize, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 200, 0, false));
    LvlBase.alFallPlats.add(new Sprite (nBoxSize*13, nLevelHeight-4*nBoxSize, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 200, 0, false));
    LvlBase.alFallPlats.add(new Sprite (nBoxSize*14, nBoxSize*6, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 200, 0, false));


    LvlBase.alFallPlats.add(new Sprite (nLevelWidth-8*nBoxSize, nLevelHeight-5*nBoxSize, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 200, 0, false));
    LvlBase.alFallPlats.add(new Sprite (nLevelWidth-7*nBoxSize, nLevelHeight-4*nBoxSize, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 200, 0, false));
    LvlBase.alFallPlats.add(new Sprite (nLevelWidth-2*nBoxSize, nLevelHeight-4*nBoxSize, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 200, 0, false));


    LvlBase.alFallPlats.add(new Sprite (nBoxSize*16, nBoxSize*6, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 200, 0, false));
    // ============== SPIKES =============================================
    LvlBase.alSpikes.add(new Sprite (nBoxSize*4, nLevelHeight-1.5*nBoxSize, 0, 0, 0, 0, "Spikes.png", 0, 0, 0, 0, false));
    LvlBase.alSpikes.add(new Sprite (nBoxSize*5, nLevelHeight-1.5*nBoxSize, 0, 0, 0, 0, "Spikes.png", 0, 0, 0, 0, false));
    LvlBase.alSpikes.add(new Sprite (nBoxSize*14, nLevelHeight-1.5*nBoxSize, 0, 0, 0, 0, "Spikes.png", 0, 0, 0, 0, false));
    LvlBase.alSpikes.add(new Sprite (nLevelWidth-4*nBoxSize, nLevelHeight-1.5*nBoxSize, 0, 0, 0, 0, "Spikes.png", 0, 0, 0, 0, false));


    LvlBase.alSpikes.add(new Sprite (nBoxSize*7, nBoxSize*5.5, 0, 0, 0, 0, "Spikes.png", 0, 0, 0, 0, false));
    LvlBase.alSpikes.add(new Sprite (nBoxSize*12, nLevelHeight-3.5*nBoxSize, 0, 0, 0, 0, "Spikes.png", 0, 0, 0, 0, false));
    LvlBase.alSpikes.add(new Sprite (nBoxSize*13, nLevelHeight-4.5*nBoxSize, 0, 0, 0, 0, "Spikes.png", 0, 0, 0, 0, false));

    LvlBase.alSpikes.add(new Sprite (nBoxSize*14, nBoxSize*8.5, 0, 0, 0, 0, "Spikes.png", 0, 0, 0, 0, false));


    LvlBase.alSpikes.add(new Sprite (nBoxSize*16, nBoxSize*7.5, 0, 0, 0, 0, "Spikes.png", 0, 0, 0, 0, false));

    // ============== MOVING SPIKES =============================================
    LvlBase.alMovingSpikes.add(new Sprite (nBoxSize*4, nBoxSize+1, 0.8, 1, 15, 4, "movingSpikes.png", 0, 0, 0, 1, false));
    LvlBase.alMovingSpikes.add(new Sprite (nBoxSize*5, nBoxSize+1, 0.8, 1, 15, 4, "movingSpikes.png", 0, 0, 0, 1, false));
    LvlBase.alMovingSpikes.add(new Sprite (nBoxSize*14, nBoxSize+1, 0.8, 1, 15, 4, "movingSpikes.png", 0, 0, 0, 1, false));
    LvlBase.alMovingSpikes.add(new Sprite (nBoxSize*22, nBoxSize+1, 0.8, 1, 15, 4, "movingSpikes.png", 0, 0, 0, 1, false));


    // ============== SAWS =============================================
    LvlBase.alSaws.add(new Sprite(nBoxSize*3.5, nBoxSize*8.5, 0, 0, 0, 5, "shurikan.png", 75, 75, 0, 7, false));
    //LvlBase.alSaws.add(new Sprite(nBoxSize*10.5, nBoxSize*6.5, 0, 0, 0, 7, "shurikan.png", 50, 50, 0, 8, false));

    LvlBase.alSaws.add(new Sprite(nBoxSize*12.5, nBoxSize*8.5, 0, 0, 0, 7, "shurikan.png", 75, 75, 0, 5, false));

    LvlBase.alSaws.add(new Sprite(nBoxSize*18, nBoxSize*5.5, 0, 0, 0, 2, "shurikan.png", 50, 50, 0, 6, false));

    LvlBase.alSaws.add(new Sprite(nBoxSize*24, nBoxSize*8.5, 0, 0, 0, 3, "shurikan.png", 50, 50, 0, 3, false));


    LvlBase.alSaws.add(new Sprite(nBoxSize*10, nLevelHeight-1.5*nBoxSize, 0, 0, 0, 2, "shurikan.png", 125, 175, 0, 7, false));
    LvlBase.alSaws.add(new Sprite(nBoxSize*8, nLevelHeight-1.5*nBoxSize, 0, 0, 0, 1, "shurikan.png", 25, 100, 0, 11, false));
    LvlBase.alSaws.add(new Sprite(nBoxSize*12, nLevelHeight-1.5*nBoxSize, 0, 0, 0, 2, "shurikan.png", 75, 50, 0, 9, false));

    LvlBase.alSaws.add(new Sprite(nBoxSize*18, nLevelHeight-1.5*nBoxSize, 0, 0, 0, 1, "shurikan.png", 150, 175, 0, 8, false));
    LvlBase.alSaws.add(new Sprite(nBoxSize*16, nLevelHeight-1.5*nBoxSize, 0, 0, 0, 2, "shurikan.png", 25, 100, 0, 6, false));
    LvlBase.alSaws.add(new Sprite(nBoxSize*20, nLevelHeight-1.5*nBoxSize, 0, 0, 0, 1, "shurikan.png", 75, 50, 0, 10, false));
    // ============== LASER GUNS =============================================
    LvlBase.alLasers.add(new LaserGun(nBoxSize*3, nBoxSize*3, 3500));


    LvlBase.bDrawn = true;
  }
}