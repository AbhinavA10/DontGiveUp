PVector vPos;
/*float fAccel=0.8; //0.8 seems real
 float fVelocity=0.3;
 int nVelocityLimit = 8;//should be 6 with 0.2 accel
 boolean canJump=false;
 String sFileName = "patrick.png";
 int nDirec=0; //-1 is left, 1 is right*/
Protaginist hero; 
void setup() {
  size(900, 600);
  vPos= new PVector (width/2, height/2);
  hero = new Protaginist(vPos, 0.8, 0.3, 8, false, 0);
}
void draw() {
  stroke(0, 255, 0);
  background(20);
  line(0, 500, 900, 500);
  hero.update();
}
void keyPressed() {
  if (keyCode==UP&& hero.isHit(hero)) {
    hero.canJump=true;
  } else if (keyCode==LEFT) {
    hero.nDirec=-1;
  } else if (keyCode==RIGHT) {    
    hero.nDirec=1;
  }
}
void keyReleased() {
  if (keyCode==RIGHT||keyCode==LEFT) {
    hero.nDirec=0;
  }
}