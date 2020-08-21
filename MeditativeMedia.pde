//public variables
String filename = "raindrop.jpg"; //face, face2, puddle, raindrop, window
int speed = 2;

//private variables
PImage img;
int imgWidth;
int imgHeight;
double widthRatio;
int y;
boolean goingUp = false;
color[] palette;

void setup() {
  
  // The image file must be in the data folder of the current sketch to load successfully 
  img = loadImage(filename);  // Load the image into the program
  imgWidth = img.width;
  imgHeight = img.height;
  y = imgHeight;
  
  //canvas
  fullScreen();
  widthRatio = (imgWidth*1.00)/width;
  println(widthRatio);
  
  //color
  palette = new color[imgWidth];
}

void draw() { 
  
  //read color
  for(int i = 0;i<imgWidth;i++)
  {
    palette[i] = img.get(i, y);
  }
  
  //set color
  for(int i = 0;i<width;i++)
  {   
    int p = (int)(i*widthRatio);   
    if(p>width)continue;
    stroke(palette[p]);
    line(i, 0, i, height);
  }
  
  //update color read line
  y = scanLine(y);
}

int scanLine(int i){

  if(goingUp){
    i = i + speed; 
  }
  else{
    i = i - speed; 
  }
  if (i <= 0) { 
    i = 0;
    goingUp = true;
  } 
  else if(i >= imgHeight){
    i = imgHeight;
    goingUp = false;
  }
  return i;
}
