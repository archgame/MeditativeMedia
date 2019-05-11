//https://editor.p5js.org/generative-design/sketches/P_1_2_2_01
//https://www.alanzucconi.com/2015/09/30/colour-sorting/

PImage img;
int imgWidth;
int imgHeight;
int y;
int step = 5;
boolean goingUp = false;
color[] palette;

void setup() {
  
  // The image file must be in the data folder of the current sketch to load successfully 
  //img = loadImage("johnmarkees.jpg");  // Load the image into the program
  //img = loadImage("face.jpg");  // Load the image into the program
  img = loadImage("face2.jpg");  // Load the image into the program
  imgWidth = img.width;
  imgHeight = img.height;
  y = imgHeight;
  
  //canvas
  size(1, 1); // use only numbers (not variables) for the size() command, Processing 3
  surface.setResizable(true); // allow resize 
  surface.setSize(imgWidth, imgHeight); //update surface to image dimensions
  
  //color
  palette = new color[imgWidth];
}

void draw() { 
  
  //read color
  //image(img, 0, 0, width, height); // Displays the image - scale to the available width,height for display
  for(int i = 0;i<imgWidth;i++)
  {
    palette[i] = img.get(i, y);
  }
  
  //sort color
  //palette = sortColor(palette);
  
  //set color
  for(int i = 0;i<imgWidth;i++)
  {
    stroke(palette[i]);
    line(i, 0, i, imgHeight);
  }
  
  //update color read line
  y = scanLine(y);
}

color[] sortColor(color[] colors)
{
  int i, j; 
  boolean sorted = false; 
 
  // while the array isn't sorted 
  while (!sorted) { 
      sorted = true; 
      // loop through array 
      for (i=0;i<colors.length-1;i++) { 
       if (colors[i] > colors[i+1]) { 
         // swap values 
         j = colors[i]; 
         colors[i] = colors[i+1]; 
         colors[i+1] = j; 
         //println(array); 
         // trigger's been hit, array isn't sorted. 
         sorted = false; 
       } 
     } 
  } 
  return colors;
}

int scanLine(int i){

  if(goingUp){
    i = i + step; 
  }
  else{
    i = i - step; 
  }
  if (i <= 0) { 
    i = 0;
    goingUp = true;
  } 
  else if(i >= imgWidth){
    i = imgWidth;
    goingUp = false;
  }
  return i;
}
