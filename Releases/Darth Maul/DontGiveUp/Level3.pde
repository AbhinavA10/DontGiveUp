class Level3 extends LevelBase {
  Level3() {
    super();
    LvlBase.alPlat.add(new Sprite (250, nLevelHeight-2*nBoxSize, 0, 0, 1.6, 0.6, 16, 0, "box.png"));  
    LvlBase.alPlat.add(new Sprite (300, nLevelHeight-3*nBoxSize, 0, 0, 1.6, 0.6, 16, 0, "box.png"));  
    LvlBase.alPlat.add(new Sprite (350, nLevelHeight-4*nBoxSize, 0, 0, 1.6, 0.6, 16, 0, "box.png"));  
    LvlBase.alPlat.add(new Sprite (400, nLevelHeight-5*nBoxSize, 0, 0, 1.6, 0.6, 16, 0, "box.png"));  
    LvlBase.alPlat.add(new Sprite (450, nLevelHeight-5*nBoxSize, 0, 0, 1.6, 0.6, 16, 0, "box.png"));  
    LvlBase.alPlat.add(new Sprite (550, nLevelHeight-5*nBoxSize, 0, 0, 1.6, 0.6, 16, 0, "box.png"));  
    LvlBase.alPlat.add(new Sprite (500, nLevelHeight-5*nBoxSize, 0, 0, 1.6, 0.6, 16, 0, "box.png"));  
    LvlBase.alPlat.add(new Sprite (650, nLevelHeight-5*nBoxSize, 0, 0, 1.6, 0.6, 16, 0, "box.png"));  
    LvlBase.alPlat.add(new Sprite (750, nLevelHeight-4*nBoxSize, 0, 0, 1.6, 0.6, 16, 0, "box.png"));  

    bDrawn = true;
  }
}