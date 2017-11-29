/*Assuming that you have a PImage object called img then inside draw() you can copy just part of this image with
 
 image(img, dx, dy, dw, dh, sx, sy, sw, sh);
 
 where
 dx, dy, dw, dh   = the area of your display that you want to draw to.
 and
 sx, sy, sw, sh  = the part of the image to draw (measured in pixels)
 
 The beauty of this is that the destination width and height does not hve to match the source width and height. 
 The image source will be scaled to fit the destination. */
//http://forum.processing.org/one/topic/displaying-a-part-of-the-image.html
PImage imgDoor;
void setup() {
  size(500, 500);
  imgDoor = loadImage("door.png");
}
void draw() {
  image(imgDoor, 20, height-100, 78, 78, 0, 0, 78, 78);
  image(imgDoor, width-100, height-100, 78, 78, 0, 86, 82,158);
}