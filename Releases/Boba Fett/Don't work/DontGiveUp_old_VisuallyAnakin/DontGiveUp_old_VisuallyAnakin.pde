// Release 1.2 - Boba Fett

PVector vPos; // create vector to pass to hero
Protagonist hero; // create an instance of Protagonist
int nLevel = 1; // needed for multiple levels in later releases
boolean bDrawn = false;// needed for multiple levels in later releases and to stop continously adding more boxes (of Class Wall)
ArrayList <Wall> alWall = new ArrayList<Wall>(); // create a new ArrayList
int i;
void setup() {
  size(900, 600);
  vPos= new PVector (100, 100);// set vector
  hero = new Protagonist(vPos, 0.8, 0.3, 8, false, 0);//construct a hero
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
/*void draw() {
 background(20);
 line(0, 500, 900, 500);
 stroke(0, 255, 0);
 createBoxes();
 box.update();
 for (i = 0; i<alWall.size(); i++) {
 alWall.get(i).display();
 if (isHit(box.vPos.x, box.vPos.y, alWall.get(i).fX, alWall.get(i).fY, box.nSize, alWall.get(i).nSize)) {
 box.nDirec=0;
 }
 }
 }*/
/*boolean isHit(float nX1, float nY1, float nX2, float nY2, int nSize1, int nSize2) {
 
 int nW1 = nSize1;
 int nW2 = nSize2;
 int nH1 = nSize1;
 int nH2 = nSize2;
 
 if (
 ( ( (nX1 <= nX2) && (nX1+nW1 >= nX2) ) ||
 ( (nX1 >= nX2) && (nX1 <= nX2+nW2) ) )
 &&
 ( ( (nY1 <= nY2) && (nY1+nH1 >= nY2) ) ||
 ( (nY1 >= nY2) && (nY1 <= nY2+nH2) ) )
 ){
 return (true) ;}
 else{
 return(false) ;}
 }*/
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

void createBoxes() {
  int nAmount = 56;
  int fX=0, fY=0;
  String sDrawDirec="Right";
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