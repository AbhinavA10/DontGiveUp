
void setup() {
  size(500, 500);
}
void draw() {
  background(20);
  pushMatrix();
  translate(width/2, 20);
  float a = atan2(mouseY-height/2, mouseX-width/2); // first is y then x
  rotate(a);
  //rect(-30, -5, 60, 10);
  ellipse(30, 5, 10, 10);
  popMatrix();
}
//https://processing.org/reference/atan2_.html
//http://studio.processingtogether.com/sp/pad/export/ro.91kLmk61vAOZp/latest