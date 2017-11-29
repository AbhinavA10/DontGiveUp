Sprite sprHero;
void setup() {
  background(20); 
  size(720, 720);
  stroke(255);
  sprHero = new Sprite();
}

void draw() {
  background(20); 
  sprHero.update();
  line(0, 620, 720, 620);
}
//===== decides things :) =====//
void keyPressed() {
  if (keyCode==UP && sprHero.jumpCount==0) {
    sprHero.fVelocity = -16;
    sprHero.jumpCount+=1;
  }
  if (keyCode==RIGHT) {
    sprHero.nDirec=1;
    sprHero.nLastDirec=1;
  } else if (keyCode==LEFT) {
    sprHero.nDirec=-1;
    sprHero.nLastDirec=-1;
  }
}
void keyReleased() {
  if (keyCode==RIGHT||keyCode==LEFT) {
    sprHero.nDirec=0;
  }
}