class Level17 extends LevelBase {
  Level17() {
    super();
    // ============== PLATFORMS =============================================
    LvlBase.alPlat.add(new Sprite (nBoxSize*3, nLevelHeight-2*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));
    LvlBase.alPlat.add(new Sprite (nBoxSize*6, nLevelHeight-4*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));
    LvlBase.alPlat.add(new Sprite (nBoxSize*7, nLevelHeight-4*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));
    LvlBase.alPlat.add(new Sprite (nBoxSize*8, nLevelHeight-5*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));

    LvlBase.alPlat.add(new Sprite (nBoxSize*6, nBoxSize*3, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false)); // block that saves you from the gun
    //LvlBase.alPlat.add(new Sprite (nBoxSize*7, nBoxSize*5, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));
    //LvlBase.alPlat.add(new Sprite (nBoxSize*9, nBoxSize*5, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));
    LvlBase.alPlat.add(new Sprite (nBoxSize*11, nBoxSize*6, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));

    LvlBase.alPlat.add(new Sprite (nBoxSize*18, nLevelHeight-4*nBoxSize, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));

    LvlBase.alPlat.add(new Sprite (nBoxSize*6, nBoxSize*5, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));

    LvlBase.alPlat.add(new Sprite (nBoxSize*4, nBoxSize*7, 0, 0, 0, 0, "box.png", 0, 0, 0, 0, false));

    // ============== FALLING PLATFORMS =============================================
    LvlBase.alFallPlats.add(new Sprite (nBoxSize*3, nBoxSize*6, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 250, 0, false));
    LvlBase.alFallPlats.add(new Sprite (nBoxSize*4, nLevelHeight-3*nBoxSize, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 100, 0, false));
    // LvlBase.alFallPlats.add(new Sprite (nBoxSize*4, nBoxSize*7, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 100, 0, false));
    // LvlBase.alFallPlats.add(new Sprite (nBoxSize*5, nBoxSize*7, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 100, 0, false));
    LvlBase.alFallPlats.add(new Sprite (nBoxSize*5, nLevelHeight-3*nBoxSize, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 250, 0, false));


    //LvlBase.alFallPlats.add(new Sprite (nBoxSize*6, nBoxSize*5, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 300, 0, false));
    LvlBase.alFallPlats.add(new Sprite (nBoxSize*8, nBoxSize*3, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 100, 0, false));
    LvlBase.alFallPlats.add(new Sprite (nBoxSize*10, nBoxSize*5, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 250, 0, false));

    LvlBase.alFallPlats.add(new Sprite (nBoxSize*12, nBoxSize*7, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 100, 0, false));
    LvlBase.alFallPlats.add(new Sprite (nBoxSize*14, nBoxSize*6, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 100, 0, false));
    LvlBase.alFallPlats.add(new Sprite (nBoxSize*15, nBoxSize*7, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 100, 0, false));

    LvlBase.alFallPlats.add(new Sprite (nLevelWidth-10*nBoxSize, nLevelHeight-3*nBoxSize, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 100, 0, false));
    LvlBase.alFallPlats.add(new Sprite (nLevelWidth-8*nBoxSize, nLevelHeight-4*nBoxSize, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 100, 0, false));
    LvlBase.alFallPlats.add(new Sprite (nLevelWidth-7*nBoxSize, nLevelHeight-5*nBoxSize, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 100, 0, false));
    LvlBase.alFallPlats.add(new Sprite (nLevelWidth-5*nBoxSize, nLevelHeight-3*nBoxSize, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 100, 0, false));
    LvlBase.alFallPlats.add(new Sprite (nLevelWidth-4*nBoxSize, nLevelHeight-3*nBoxSize, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 100, 0, false));


    LvlBase.alFallPlats.add(new Sprite (nBoxSize*7, nBoxSize*5, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 250, 0, false));
    LvlBase.alFallPlats.add(new Sprite (nBoxSize*8, nBoxSize*5, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 250, 0, false));
    LvlBase.alFallPlats.add(new Sprite (nBoxSize*9, nBoxSize*5, 1.6, 0.6, 16, 0, "falling platform.png", 0, 0, 250, 0, false));
    // ============== SPIKES =============================================
    LvlBase.alSpikes.add(new Sprite (nBoxSize*11, nBoxSize*5.5, 0, 0, 0, 0, "Spikes.png", 0, 0, 0, 0, false));
    LvlBase.alSpikes.add(new Sprite (nBoxSize*19, nLevelHeight-4.5*nBoxSize, 0, 0, 0, 0, "Spikes.png", 0, 0, 0, 0, false));

    LvlBase.alSpikes.add(new Sprite (nLevelWidth-5*nBoxSize, nLevelHeight-3.5*nBoxSize, 0, 0, 0, 0, "Spikes.png", 0, 0, 0, 0, false));

    // ============== SAWS =============================================
    LvlBase.alSaws.add(new Sprite(nBoxSize*2, nBoxSize*8, 0, 0, 0, 7, "shurikan.png", 50, 50, 0, 6, false));
    LvlBase.alSaws.add(new Sprite(nBoxSize*10.5, nBoxSize*9.5, 0, 0, 0, 8, "shurikan.png", 50, 50, 0, 7, false));
    LvlBase.alSaws.add(new Sprite(nBoxSize*11.5, nBoxSize*3, 0, 0, 0, 5, "shurikan.png", 50, 50, 0, 6, false));
    LvlBase.alSaws.add(new Sprite(nBoxSize*16.5, nBoxSize*8.5, 0, 0, 0, 7, "shurikan.png", 75, 75, 0, 8, false));
    LvlBase.alSaws.add(new Sprite(nBoxSize*23, nBoxSize*7.5, 0, 0, 0, 6, "shurikan.png", 50, 50, 0, 5, false));

    LvlBase.alSaws.add(new Sprite(nBoxSize*5.5, nLevelHeight-1.5*nBoxSize, 0, 0, 0, 2, "shurikan.png", 50, 75, 0, 5, false));
    LvlBase.alSaws.add(new Sprite(nBoxSize*11, nLevelHeight-1.5*nBoxSize, 0, 0, 0, 1, "shurikan.png", 100, 100, 0, 10, false));
    LvlBase.alSaws.add(new Sprite(nBoxSize*16.5, nLevelHeight-1.5*nBoxSize, 0, 0, 0, 2, "shurikan.png", 100, 100, 0, 7, false));
    LvlBase.alSaws.add(new Sprite(nBoxSize*21, nLevelHeight-1.5*nBoxSize, 0, 0, 0, 1, "shurikan.png", 50, 50, 0, 5, false));

    // ============== LASER GUNS =============================================
    LvlBase.alLasers.add(new LaserGun(nBoxSize*3, nBoxSize*3, 2500));
    LvlBase.alLasers.add(new LaserGun(nBoxSize*17, round(nBoxSize*3.5), 3500));


    LvlBase.bDrawn = true;
  }
}