import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Minim minim;
AudioPlayer player;

//Variables
PImage Slope;
int SlopeX=400;
int SlopeY=400;
PImage Flag;
int FlagX=245;
int FlagY=330;
PImage Flag2;
int Flag2X=250;
int Flag2Y=400;
PImage Flag3;
int Flag3X=270;
int Flag3Y=400;
PImage Flag4;
int Flag4X=270;
int Flag4Y=500;
PImage Flag5;
int Flag5X=230;
int Flag5Y=500;
PImage Skier;
int SkierX=250;
float SkierY=250;
float SkiSpeed=0.8;
int scene = 1;
void setup()
{  minim = new Minim(this);
 
  player = minim.loadFile("ski.mp3");
  player.loop();
  size(800, 800); 
  imageMode(CENTER);
  //This tells the program which images to load
  Slope= loadImage("Slope.jpg");
  Slope.resize(800, 800);
  Flag= loadImage("Flag.jpg");
  Flag.resize(20, 20);
  Flag2= loadImage("Flag2.jpg");
  Flag2.resize(20, 20);
  Flag3 =loadImage("Flag3.jpg");
  Flag3.resize(30, 30);
  Flag4=loadImage("Flag4.jpg");
  Flag4.resize(30, 50);
  Flag5=loadImage("Flag5.jpg");
  Flag5.resize(30, 30);
  Skier=loadImage("Skier.png");
  Skier.resize(20, 20);
}

void draw()
{ 
  
  if(scene==1)
  {
    
  
  //This draws the images
  image(Slope, SlopeX, SlopeY); 
  image(Flag, FlagX, FlagY);
  image(Flag2, Flag2X, Flag2Y);
  image(Flag3, Flag3X, Flag3Y); 
  image(Flag4, Flag4X, Flag4Y);
  image(Flag5, Flag5X, Flag5Y);
  image(Skier, SkierX, SkierY);

  //These are for the ski collisions 
  if (SkierY>700)
  {
    background(0);
    fill(255);
    textSize(80);
    text("Success", 100, 100);
  }
  if (SkierX>500)
  {
    scene=2;
  }
  if (SkierX<200)
  {scene=2;
  }
  if (dist(SkierX, SkierY, FlagX, FlagY)<20)
  {
    scene=2;
  }
  if (dist(SkierX, SkierY, Flag2X, Flag2Y)<20)
  {
    scene=2;
  }
  if (dist(SkierX, SkierY, Flag3X, Flag3Y)<25)
  { 
    scene=2;
  }
  if (dist(SkierX, SkierY, Flag4X, Flag4Y)<32.5)
  { 
   scene=2;
  }
  if (dist(SkierX, SkierY, Flag5X, Flag5Y)<25)
  { 
    scene=2;
  }


  //This is so the skier moves down
  SkierY=SkierY+SkiSpeed;
  }
  if(scene==2)
  {
   SkiSpeed=0;
    background(0);
    fill(255);
    textSize(80);
    text("Failure", 100, 100);
  }
  
  
}
void keyPressed()
  //To move the skier using WASD
{

  if (key == 'a' || key == 'A')
  {
    SkierX=SkierX-5;
  } 
  if (key == 'd' || key == 'D')
  {
    SkierX=SkierX+5;
  }

} 
