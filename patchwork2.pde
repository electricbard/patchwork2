
// --------------------------------------------------
import processing.svg.*;
import java.util.*;

// --------------------------------------------------
boolean bExportSVG = false;
int sqDim = 25;
int xDim = 796;
int yDim = 576;
int spaceDim = 10;

int xStart = 0;
int yStart = 0;
int xNum = 0;
int yNum = 0;

int patches = 8;
int patchElements = 1;

// --------------------------------------------------
void setup()
{
  size(796, 576);
  xNum = floor(xDim / (sqDim + spaceDim));
  print("xNum: ");
  println(xNum);
  xStart = floor((xDim - ((xNum * sqDim) + ((xNum - 1) * spaceDim))) / 2);
  yNum = floor(yDim / (sqDim + spaceDim));
  print("yNum: ");
  println(yNum);
  yStart = floor((yDim - ((yNum * sqDim) + ((yNum - 1) * spaceDim))) / 2);
  print("xStart: ");
  println(xStart);
  print("yStart: ");
  println(yStart);
  
  noLoop();

}

// --------------------------------------------------
void draw()
{
  // White background
  // The function is called before beginRecord 
  background(255);
  
  // Start recording if the flag bExportSVG is set
  // When recording, all Processing drawing commands will be displayed on screen and saved into a file
  // The filename is set with a timestamp 
  if (bExportSVG)
  {
    beginRecord(SVG, "data/exports/svg/export_"+timestamp()+".svg");
  }

  // Drawing options  
  //noFill();
  fill(255);
  stroke(0);
  rectMode(CORNERS);

  // Start drawing here

  for (int i = 0; i < xNum; i++) {
    for (int j = 0; j < yNum; j++) {
      push();
      translate((xStart + i*(sqDim + spaceDim)), (yStart + j*(sqDim + spaceDim)));
      square(0,0,sqDim);
      for(int k = 0; k < patchElements; k++) {
        drawPatch(int(random(patches)));
      }
      pop();
    }
  }

  // End drawing here

  // If we were exporting, then we stop recording and set the flag to false
  if (bExportSVG)
  {
    endRecord();
    bExportSVG = false;
  }
}

// --------------------------------------------------
void keyPressed()
{
  if (key == 'e')
  {
    bExportSVG = true;
  }
}
// --------------------------------------------------
// Function borrowed from generative gestaltung sketches
// http://www.generative-gestaltung.de
String timestamp() 
{
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}

void drawPatch(int p)
{
  switch(p) {
    case 0:
      line(sqDim/2, 0, sqDim/2, sqDim);
      break;
    case 1:
      line(sqDim/4, 0, sqDim/4, sqDim);
      break;
    case 2:
      line(sqDim/8, 0, sqDim/8, sqDim);
      break;
    case 3:
      circle(sqDim/2, sqDim/2, sqDim/2);
      break;
    case 4:
      triangle(0, sqDim, sqDim/2, 0, sqDim, sqDim);
      break;
     case 5:
      triangle(0, 0, sqDim/2, sqDim, sqDim, 0);
      break;
     case 6:
      line(0, sqDim/2, sqDim, sqDim/2);
      break;
     case 7:
      line(0, sqDim/8, sqDim, sqDim/8);
      break;
    default:
      break;
  }
}
