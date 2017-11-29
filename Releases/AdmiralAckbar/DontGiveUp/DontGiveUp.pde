// Release 1.0 - Admiral Ackbar
PVector vPos; // create vector to pass to hero
Protagonist hero; // create an instance of Protagonist
void setup() {
  size(900, 600);
  vPos= new PVector (width/2, height/2); // set vector to the center
  hero = new Protagonist(vPos, 0.8, 0.3, 8, false, 0); //construct a hero
}
void draw() {
  stroke(0, 255, 0);
  background(20);
  line(0, 500, 900, 500);
  hero.update();
}
void keyPressed() {
  if ((key=='w'||key=='W')&& hero.isHit(hero)) {
    hero.canJump=true;
  } else if (key=='a'||key=='A') {
    hero.nDirec=-1;
  } else if (key=='d'||key=='D') {    
    hero.nDirec=1;
  }
}
void keyReleased() {
  if ((key=='d'||key=='D')||(key=='a'||key=='A')) {
    hero.nDirec=0;
  }
}