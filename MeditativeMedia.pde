//public variables
String filename = "raindrop.jpg"; //face, face2, puddle, raindrop, window
int speed = 1;
int strokeWeight = 20;

//private variables
String type = "Lines";
PImage img;
int imgWidth;
int imgHeight;
double widthRatio;
int y;
boolean goingUp = false;
color[] palette;
int R = 128;
int G = 128;
int B = 128;

void setup() {
  
  // The image file must be in the data folder of the current sketch to load successfully 
  img = loadImage(filename);  // Load the image into the program
  imgWidth = img.width;
  imgHeight = img.height;
  y = imgHeight;
  
  //canvas
  fullScreen(2);
  widthRatio = (imgWidth*1.00)/width;
  println(widthRatio);
  
  //color
  palette = new color[imgWidth];
}

void draw() { 
  
  if(type == "Lines")
  {
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
      strokeWeight(strokeWeight);
      line(i, 0, i, height);    
      i = i + strokeWeight-1;
    }
    
    //update color read line
    y = scanLine(y);
  }
  else if(type == "White"){background(255);}
  else if(type == "Black"){background(0);}
  else if(type == "Grey"){background(R);}
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

//Keyboard input
void keyPressed() 
{ 
   //White background
   if(key == 'w'){type = "White";}
   //black background
   else if(key == 'b'){type = "Black";}
   //grey background
   else if(key == 'g'){type = "Grey";}
   //switch input camera
   else if(key == 'l'){type = "Lines";}
  
  //Coded keys
  if(key == CODED)
  {
     if(keyCode == UP){
       R++;
       if(R > 255){R = 255;}
     }
     else if(keyCode == DOWN){
       R--;
       if(R<0){R=0;}
     }
     
     if(keyCode == RIGHT){}
     else if(keyCode == LEFT){}
  }
}
