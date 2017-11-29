// normalizing a vector
// got help from https://processing.org/tutorials/pvector/

int nDirec = 0;
PVector vPos2 = new PVector(10, 450);
PVector vPos = new PVector(10, 450);
PVector center = new PVector(width/2, height/2);
void setup() {  
  size(500, 500);
}
void draw() {

  background(255);
  vPos.x=vPos2.x;
  vPos.y=vPos2.y;
  vPos.sub(center);

  vPos.normalize();
  vPos.mult(25);
  //vPos.x+=25;
  // vPos.y+=25;
  line(0, 0, vPos.x, vPos.y);
  background(20);
  pushMatrix();
  translate(width/2, 50);
  stroke(250);
  line(0, 0, vPos.x, vPos.y);
  ellipse(vPos.x, vPos.y, 10, 10);
  popMatrix();
  rectMode(CENTER);
  rect(vPos2.x, vPos2.y, 50, 50);
  update();
}
void keyPressed() {
  if (key == 'w') { 
    nDirec=1;
  } else if (key == 'a') { 
    nDirec=2;
  } else if (key == 's') { 
    nDirec=3;
  } else if (key == 'd') { 
    nDirec=4;
  }
}
void keyReleased() {
  nDirec=0;
}
void update() {
  if (nDirec == 1) { 
    vPos2.y += -6;
  } else if (nDirec == 2) { 
    vPos2.x += -6;
  } else if (nDirec == 3) { 
    vPos2.y += 6;
  } else if (nDirec==4) { 
    vPos2.x +=6;
  }
}