/*Zoom and Pan in Processing
Author: Jinlong Yang
Email: jinlong.yang@mail.sdsu.edu
*/

//Define the image vars
PImage map;
int imgW;
int imgH;
int centerX;
int centerY;

//Define the zoom and pan vars
int scale = 1;
float zoomFactor = 0.4;
int panFromX;
int panFromY;
int panToX;
int panToY;
int xShift = 0;
int yShift = 0;

void setup() {
  map = loadImage("image.jpg");
  
  imgW = map.width;
  imgH = map.height;
  centerX = imgW / 2;
  centerY = imgH / 2;
  
  size(imgW, imgH);
}

void draw(){
  imageMode(CENTER);
  image(map, centerX, centerY, imgW, imgH);
}


