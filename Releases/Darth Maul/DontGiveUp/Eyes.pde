class Eye {
  /*For this eye we got help from https://processing.org/reference/PVector_normalize_.html,
   https://processing.org/reference/PVector_mult_.html, and
   https://processing.org/reference/PVector_sub_.html*/
  // but these were also on your website...
  PVector vEye = new PVector(width/2, height/2);
  PVector vCenter = new PVector(width/2, height/2);
  Eye(int nX, int nY) {
    vCenter = new PVector(nX, nY);
    //vCenter = new PVector(width/2, 35);
  }
  void update() { 
    drawEye();
    calculate();
  }
  void calculate() {
    stroke(255, 255, 0);

    vEye = new PVector(hero.fX, hero.fY);

    vEye.sub(vCenter);
    vEye.normalize();
    vEye.mult(20);
  }
  void drawEye() {
    pushMatrix();  
    translate(vCenter.x, vCenter.y);

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
  }
}