PVector vPos;
Protagonist hero; 
void setup() {
  size(900, 600);
  vPos= new PVector (50, 100);
  hero = new Protagonist(vPos, 0.8, 0.3, 8, false, 0);
}
void draw() {
  stroke(0, 255, 0);
  background(20);
  createBoxes();
  for (i = 0; i<alWall.size(); i++) {
    alWall.get(i).display();
  }
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

void createBoxes() {
  int nAmount = 56;
  int fX=0, fY=0;
  String sDrawDirec = "Right";
  if (bDrawn == false) {
    if (nLevel == 1) {
      for (int i= 0; i<nAmount; i++) {
        if (sDrawDirec == "Right") {
          alWall.add(new Wall (fX, fY));
          fX+=50;        
          if (fX>=width-50) {
            sDrawDirec="Down";
          }
        } else if (sDrawDirec == "Down") {
          alWall.add(new Wall (fX, fY));
          fY+=50;        
          if (fY>=height-50) {
            sDrawDirec="Left";
          }
        } else if (sDrawDirec == "Left") {
          alWall.add(new Wall (fX, fY));
          fX-=50;        
          if (fX<=0) {
            sDrawDirec="Up";
          }
        } else if (sDrawDirec == "Up") {
          alWall.add(new Wall (fX, fY));
          fY-=50;        
          if (fY<=0) {
            sDrawDirec="none";
          }
        }
      }
    }
    bDrawn = true;
  }
}