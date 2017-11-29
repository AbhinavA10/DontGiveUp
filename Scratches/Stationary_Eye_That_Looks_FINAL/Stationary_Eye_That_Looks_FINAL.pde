/*For this eye we got help from https://processing.org/reference/PVector_normalize_.html,
 https://processing.org/reference/PVector_mult_.html, and
 https://processing.org/reference/PVector_sub_.html*/
// but these were also on your website...

int nX, nY, nDirec=0;
PVector vEye = new PVector(nX, nY);
PVector vCenter;
void setup() {
  size(900, 600);
  vCenter = new PVector(width/2, 35);
}
void draw() {
  stroke(255, 255, 0);
  background(20);
  vCenter = new PVector(width/2, 35);
  vEye = new PVector(nX, nY);

  vEye.sub(vCenter);
  vEye.normalize();
  vEye.mult(20);

  pushMatrix();  
  translate(vCenter.x, vCenter.y);

  //line(0, 0, vEye.x, vEye.y);

  noFill();
  stroke(#1EBFF7);
  strokeWeight(3);
  ellipse(0, 0, 60, 60);

  strokeWeight(1);
  noStroke();
  fill(255, 0, 255);
  ellipse(vEye.x, vEye.y, 15, 15);

  fill(255);
  ellipse(vEye.x-3, vEye.y-3, 7, 7);

  popMatrix();

  vEye = new PVector(nX, nY);
  vCenter.x+=75;
  vEye.sub(vCenter);
  vEye.normalize();
  vEye.mult(20);

  pushMatrix();  
  translate(vCenter.x, vCenter.y);

  //line(0, 0, vEye.x, vEye.y);

  noFill();
  stroke(#1EBFF7);
  strokeWeight(3);
  ellipse(0, 0, 60, 60);

  strokeWeight(1);
  noStroke();
  fill(255, 0, 255);
  ellipse(vEye.x, vEye.y, 15, 15);

  fill(255);
  ellipse(vEye.x-3, vEye.y-3, 7, 7);

  popMatrix();

  update();
  rectMode(CENTER);
  fill(0, 255, 0, 220);
  rect (nX, nY, 20, 20);
}
//=====MOVING=====
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
void update() {
  if (nX>width) {
    nDirec=2;
  }
  if (nX<0) {
    nDirec=4;
  }
  if (nY>height) {
    nDirec=1;
  }
  if (nY<0) {
    nDirec=3;
  } 
  if (nDirec == 1) { 
    nY += -6;
  } else if (nDirec == 2) { 
    nX += -6;
  } else if (nDirec == 3) { 
    nY += 6;
  } else if (nDirec==4) { 
    nX +=6;
  }
}