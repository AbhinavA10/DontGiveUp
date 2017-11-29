ArrayList<Sprite> alPlosions = new ArrayList<Sprite>();
PImage img;
int nI=0;
void setup() {
  background(20); 
  fullScreen();
  stroke(255);
}

void draw() {
  println(alPlosions.size());

  background(#7966CE); 
  for (Sprite nI : alPlosions) {
    nI.update();
  }  
  //remove
  if (alPlosions.size()!=0) {
    for (int nJ=alPlosions.size()-1; nJ>=0; nJ--) {
      if (alPlosions.get(nJ).bFinished) {
        alPlosions.remove(nJ);
      }
    }
  }
  //remove
}
void mousePressed() {
  alPlosions.add(new Sprite(mouseX, mouseY));
}