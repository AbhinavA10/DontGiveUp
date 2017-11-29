// Release 1.2 - Boba Fett
PVector vPosStartOff, vPosStartStartOff; // create vector to pass to hero
Protagonist hero; // create an instance of Protagonist
int nLevel = 1; // needed for multiple levels in later releases
boolean bDrawn = false;// needed for multiple levels in later releases and to stop continously adding more boxes (of Class Wall)
ArrayList <Wall> alWall = new ArrayList<Wall>(); // create a new ArrayList
int i;
void setup() {
  size(900, 600);
  vPosStartOff= new PVector (100, 100);// set vector
  vPosStartStartOff= new PVector (100, 100);
  hero = new Protagonist(vPosStartOff, vPosStartStartOff, 0.8, 0.3, 8, false, 0);//construct a hero
}
void draw() {
  stroke(0, 255, 0);
  background(20);
  createBoxes();
  for (i = 0; i<alWall.size(); i++) {
    alWall.get(i).display();
  }
  hero.update();
}
void keyPressed() {
  if (key == 'w' || key == 'W') {
    hero.jump();
    hero.nJumpCount++;
  }
  if (key == 'a' || key == 'A') {
    hero.nDirec=1;
  }
  if (key == 'd' || key == 'D') {
    hero.nDirec=2;
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
boolean isHitUpDown(float nX1, float nY1, float nX2, float nY2, int nH1, int nW1, int nH2, int nW2) {

  if (
    ( ( (nX1 <= nX2) && (nX1+nW1 >= nX2) ) ||
    ( (nX1 >= nX2) && (nX1 <= nX2+nW2) ) )
    &&
    ( ( (nY1 <= nY2) && (nY1+nH1 >= nY2) ) ||
    ( (nY1 >= nY2) && (nY1 <= nY2+nH2) ) )
    )
    return (true) ;
  else
    return(false) ;
}

boolean isHitLeftRight(float nX1, float nY1, float nX2, float nY2, int nH1, int nW1, int nH2, int nW2) {

  if (
    ( ( (nX1 <= nX2) && (nX1+nW1 >= nX2) ) ||
    ( (nX1 >= nX2) && (nX1 <= nX2+nW2) ) )
    &&
    ( ( (nY1 <= nY2) && (nY1+nH1 >= nY2) ) ||
    ( (nY1 >= nY2) && (nY1 <= nY2+nH2) ) )
    )
    return (true) ;
  else
    return(false) ;
}