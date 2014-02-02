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

//Define the zoom vars
int scale = 1;
int maxScale = 10;
float zoomFactor = 0.4;

//Define the pan vars
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
  
  size(800, 600);
  //size(1024, 683);
}


void draw(){
  background(0);
  imageMode(CENTER);
  image(map, centerX, centerY, imgW, imgH);
  
  println("imgW/2: ", imgW / 2);
  //println(" |  imgH/2: ", imgH / 2);
  println("centerX: ", centerX);
  //println(" |  centerY: ", centerY);
}


void mousePressed(){
  if (mouseButton == LEFT){
    panFromX = mouseX;
    panFromY = mouseY;
  }
}


void mouseDragged(){
  if (mouseButton == LEFT){
    panToX = mouseX;
    panToY = mouseY;
    
    xShift = panToX - panFromX; 
    yShift = panToY - panFromY;
    
    if(centerX - imgW / 2 <= 0
    && centerX + imgW / 2 >= width
    && centerY - imgH / 2 <= 0
    && centerY + imgH / 2 >= height){
      centerX = centerX + xShift;
      centerY = centerY + yShift;
    }
    
    if(centerX - imgW / 2 > 0){
      centerX = imgW / 2;
    }
    
    if(centerX + imgW / 2 < width){
      centerX = width - imgW / 2;
    }
    
    if(centerY - imgH / 2 > 0){
      centerY = imgH / 2;
    }
    
    if(centerY + imgH / 2 < height){
      centerY = height - imgH / 2;
    }
    
    panFromX = panToX;
    panFromY = panToY;
  }
}

//Zoom function
void mouseWheel(MouseEvent event) {
  float e = event.getAmount();
  
  //Zoom in
  if(e == -1){
    if(scale < maxScale
    ){
      scale++;
      imgW = int(imgW * (1+zoomFactor));
      imgH = int(imgH * (1+zoomFactor));
      
      int oldCenterX = centerX;
      int oldCenterY = centerY;  
      
      centerX = centerX - int(zoomFactor * (mouseX - centerX));
      centerY = centerY - int(zoomFactor * (mouseY - centerY));
    }
  }
  
  //Zoom out
  if(e == 1){
    if(scale < 1){
      scale = 1;
      imgW = map.width;
      imgH = map.height;
    }
    
    if(scale > 1){
      scale--;
      imgH = int(imgH/(1+zoomFactor));
      imgW = int(imgW/(1+zoomFactor));
      
      int oldCenterX = centerX;
      int oldCenterY = centerY;  
      
      centerX = centerX + int((mouseX - centerX) 
      * (zoomFactor/(zoomFactor + 1))); 
      centerY = centerY + int((mouseY - centerY) 
      * (zoomFactor/(zoomFactor + 1)));
      
      if(centerX - imgW / 2 > 0){
        centerX = imgW / 2;
      }
      
      if(centerX + imgW / 2 < width){
        centerX = width - imgW / 2;
      }
      
      if(centerY - imgH / 2 > 0){
        centerY = imgH / 2;
      }
      
      if(centerY + imgH / 2 < height){
        centerY = height - imgH / 2;
      }
    }
  }
}
