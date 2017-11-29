class Door {
  float  fX, fY;
  PImage imgDoor;
  Door( float fTempX, float fTempY, String sDoorChoice) {
    fX = fTempX;
    fY = fTempY;
    if (sDoorChoice=="Entry") {
      imgDoor=loadImage("entryDoor.png");
    }else if (sDoorChoice=="Exit") {
      imgDoor=loadImage("exitDoor.png");
    }
  }
  void display() {
      image(imgDoor, fX, fY);
  }
}