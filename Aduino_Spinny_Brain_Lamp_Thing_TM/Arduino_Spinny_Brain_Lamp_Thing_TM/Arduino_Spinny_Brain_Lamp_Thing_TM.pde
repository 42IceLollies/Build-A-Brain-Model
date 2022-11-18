   import processing.serial.*;
  //creates serial port object
  //UNCOMMENT 
   //Serial myPort;
   
   
   /*
   still need to:
   -add what happens when you click on a square
   -find/draw pictures to display sections of brain 
   -sort of a landing page image of a brain, maybe animated?
   
   ideas for making it look cool
   - circles or something around the cursor
   -somehow make the labels not look like 2010s internet css
   -color code labels to led colors? if we do the leds in colors, that is
   -add white border to boxes once they've been clicked
   */


//some global variables because if there's one thing I've learned, it's not to make yourself change a value twenty million times while formatting a program
//Such learning abilities, brought to you by the basal ganglia. You're very welcome. 
  int margin;
  int labelWidth;
  int labelHeight;
  

  Label[] sections = new Label[8]; 
  InfoDisplay[] sectionInfo = new InfoDisplay[8];
  
  //text setting vars
  int regularTxt;
  int bigTxt;

//=========================================================================SETUP=========================================================================

void setup()
{
  //SWITCH TO FULLSCREEN WHEN FINISHED DEBUGGING SERIAL PORT
  //display size setting
  size(displayWidth, displayHeight);
  //fullScreen();
  
  //UNCOMMENT
  
  ////serial port setup, copied from https://learn.sparkfun.com/tutorials/connecting-arduino-to-processing/all
 // String portName = Serial.list()[0];
  //myPort = new Serial(this, portName, 9600);
  
  
  //more settings, what did you expect for a function called setup?
  background(0);
  colorMode(RGB);
  rectMode(CENTER);
  
  
  //text settings
  regularTxt = 25;
  bigTxt = 30;
  textSize(regularTxt);
  textAlign(CENTER);
  PFont footFont = createFont("Footlight MT Light", 25.0);
  textFont(footFont);
  
  //sets values of labels
  margin = displayWidth/30;
  labelWidth = displayWidth/5;
  labelHeight = displayHeight/6;
  
    
  /*
   0- brainstem
   1- cerebellum
   2- dencephalon
   3- limbic system
   4- frontal lobe
   5- parietal lobe
   6- temporal lobe
   7- occipital lobe
*/

//do all the math beforehand so we don't have to do it repeatedly later
//*efficiency* 
  int rowOne = margin + (labelHeight/2);
  int rowTwo = 2* margin + (labelHeight/2) + labelHeight;
  int rowThree = 3* margin + (labelHeight/2) + 2* labelHeight;
  int rowFour = 4 * margin + (labelHeight/2) + 3* labelHeight;
  int colOne = margin + (labelWidth/2);
  int colTwo = 2* margin + (labelWidth/2) + labelWidth;
  
  Color red = new Color(211,53,103);
  Color blue = new Color(116,163,255);
  Color green = new Color(64,191,115);
  Color yellow = new Color(255,236,124);


  //initializes label 
  sections[0] = new Label(colOne, rowOne, labelWidth, labelHeight, "Brainstem", 0, red);
  sections[1] = new Label(colTwo, rowOne, labelWidth, labelHeight, "Frontal Lobe", 1, yellow);
  sections[2] = new Label(colOne, rowTwo, labelWidth, labelHeight, "Diencephalon", 2, blue); // check the spelling on this, I don't think it's right
  sections[3] = new Label(colTwo, rowTwo, labelWidth, labelHeight, "Limbic System", 3, blue);
  sections[4] = new Label(colOne, rowThree, labelWidth, labelHeight, "Cerebellum", 4, blue);
  sections[5] = new Label(colTwo, rowThree, labelWidth, labelHeight, "Parietal Lobe", 5, green);
  sections[6] = new Label(colOne, rowFour, labelWidth, labelHeight, "Temporal Lobe", 6, green);
  sections[7] = new Label(colTwo, rowFour, labelWidth, labelHeight, "Occipital Lobe", 7, green);
  
 
 //initializes additional information for sections that will be displayed on the side
 sectionInfo[0] = new InfoDisplay("Brainstem");
 sectionInfo[1] = new InfoDisplay("Frontal Lobe");
 sectionInfo[2] = new InfoDisplay("Diencephalon");
 sectionInfo[3] = new InfoDisplay("Limbic System");
 sectionInfo[4] = new InfoDisplay("Cerebellum");
 sectionInfo[5] = new InfoDisplay("Parietal Lobe");
 sectionInfo[6] = new InfoDisplay("Temporal Lobe");
 sectionInfo[7] = new InfoDisplay("Occipital Lobe");
  
  

}




//===================================================================MAIN LOOP==========================================================================

void draw()
{
  
  //redraws the background
  background(0);
  
   //draws all labels;
   for(Label curr: sections)
   {
     //if the mouse is hovering over one, it changes the size of box and font
     if(mouseOn(curr))
     {
       curr.setWidth(labelWidth+20);
       curr.setHeight(labelHeight+20);
       curr.setTxtSize(bigTxt);
     }
     
     //otherwise, it just sets it back to normal proportions
     else if(!curr.getClicked())
     {
       curr.setWidth(labelWidth);
       curr.setHeight(labelHeight);
       curr.setTxtSize(regularTxt);
     }
     curr.drawLbl();
   }

}




//====================================================OTHER FUNCTIONS================================================================



  //checks if current mouse location is within the area of a label
   boolean mouseOn(Label l)
  {
    int w = l.getW();
    int x = l.getX();
    int y = l.getY();
    int h = l.getH();
    if(mouseX >= x-(w/2) && mouseX <= x+(w/2) && mouseY >= y-(h/2) && mouseY<= y+(h/2))
    {
      return true;
    }
    return false;
  }
  
   //checks if the place that was clicked was within the area of a label
   boolean clickedOn(Label l, Click c)
  {
    int w = l.getW();
    int x = l.getX();
    int y = l.getY();
    int h = l.getH();
    if(c.getX() >= x-(w/2) && c.getX() <= x+(w/2) && c.getY() >= y-(h/2) && c.getY()<= y+(h/2))
    {
      return true;
    }
    return false;
  } 
  
  
  //called when the mouse is clicked
  void mouseClicked()
  {
    //creates an object to store the location of the click
    Click c = new Click(mouseX, mouseY);
    
    //searches to see if any of the labels have been clicked and sends light code to arduino if one has been 
    for(int i = 0; i<8; i++)
    {
      Label curr = sections[i];
      
      
      //If one of the buttons has been clicked on, searches for the button and makes adjustments
      if(clickedOn(curr, c))
      {
        print(curr.getCode());
        curr.toggleClick();
        sectionInfo[i].draw();
        
        //unclicks other buttons
          for(int j = 0; j<8; j++)
          {
            if(j!= i && sections[j].getClicked())
            {
              sections[j].toggleClick();
            }
          }
          
        //UNCOMMENT
       // sendToPort(curr.getCode());
      } 
      
      
    }
  }

//UNCOMMENT
//function that to send numbers to ardunio to turn on lights
//public void sendToPort(int lightCode)
//{
//  println(lightCode);
//  myPort.write(lightCode);
//}
