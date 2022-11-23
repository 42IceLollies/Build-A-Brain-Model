   //runs in Processing IDE 
   
   
   import processing.serial.*;
  //creates serial port object
  //UNCOMMENT FOR TESTING WITH ARDUINO (throws errors when there's nothing hooked up to the USB port) 
  //Serial myPort;
   
   
   /*
   still need to:
   -Display specific parts of brain w/ definitions
   -Have it switch between definition pages when different buttons are clicked
   -maybe add like a landing page like thing so that there's something there on the right side even when none of the buttons have been selected
   -add white border to boxes when they've been clicked been clicked
   */


//some global variables
  int margin;
  int labelWidth;
  int labelHeight;
  

  Label[] sections = new Label[8]; 
  InfoDisplay[] sectionInfo = new InfoDisplay[29]; //changed from 8 to 29, might be wrong but easy fix
  
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
  
  //serial port setup, copied from https://learn.sparkfun.com/tutorials/connecting-arduino-to-processing/all
  //String portName = Serial.list()[0];
  //myPort = new Serial(this, portName, 9600);
  
  
  //more settings
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
   2- diencephalon
   3- limbic system
   4- frontal lobe
   5- parietal lobe
   6- temporal lobe
   7- occipital lobe
*/

//does all the math beforehand so we don't have to do it repeatedly later
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
  sections[0] = new Label(colOne, rowOne, labelWidth, labelHeight, "Brainstem", 1, blue);
  sections[1] = new Label(colTwo, rowOne, labelWidth, labelHeight, "Frontal Lobe", 2, yellow);
  sections[2] = new Label(colOne, rowTwo, labelWidth, labelHeight, "Diencephalon", 3, blue); 
  sections[3] = new Label(colTwo, rowTwo, labelWidth, labelHeight, "Limbic System", 4, red);
  sections[4] = new Label(colOne, rowThree, labelWidth, labelHeight, "Cerebellum", 5, blue);
  sections[5] = new Label(colTwo, rowThree, labelWidth, labelHeight, "Parietal Lobe", 6, green);
  sections[6] = new Label(colOne, rowFour, labelWidth, labelHeight, "Temporal Lobe", 7, green);
  sections[7] = new Label(colTwo, rowFour, labelWidth, labelHeight, "Occipital Lobe", 8, green);
  
 
 //initializes additional information for sections that will be displayed on the side
 //whatever you want to put on the right side to define the terms can be put into an object (infoDisplay) and then it will be displayed when an object is clicked
 sectionInfo[0] = new InfoDisplay("Brainstem: The foundation and oldest part of the brain. Responsible for most vital bodily functions, including autonomic reflexes and consciousness.");
 sectionInfo[1] = new InfoDisplay("Medulla Oblongata: Serves as the main connection between the brain and the Autonomic Nervous system, and both Sympathetic and Parasympathetic nervous systems. Responsible for all autonomous functions including body temperature, heart rate, and blood pressure.");
 sectionInfo[2] = new InfoDisplay("Pons: Serve as a relay station between the cerebral cortex and the cerebellum and processes brainwaves during sleep. Vital because the Cerebral Cortex is responsible for many higher level functions such as critical thought, hearing, sensation, and sight, while the Cerebellum is responsible for muscular coordination and balance.");
 sectionInfo[3] = new InfoDisplay("Reticular Formation: Responsible for arousal and determining whether you are awake or asleep. Fires electrical signals all over the brain to alert you to your surroundings and wake you up once the cerebral cortex ignites.");

 sectionInfo[4] = new InfoDisplay("Frontal Lobe: Responsible for planning movement, decision making and general planning");
 sectionInfo[5] = new InfoDisplay("Prefrontal Cortex: Responsible for decision making, critical thinking, personality formation, and emotional processing.");
 sectionInfo[6] = new InfoDisplay("Basal Ganglia: Connects the cerebral cortex, thalamus, and cerebellum. Responsible for reward processing/production, habit formation, learning and movement.");
 sectionInfo[7] = new InfoDisplay("Broca's Area: Responsible for speech production and articulation.");

 sectionInfo[8] = new InfoDisplay("Diencephalon: Serves as a relay for sensory information and autonomic control.");
 sectionInfo[9] = new InfoDisplay("Thalamus: Serves as a relay for sensory input to the rest of the brain, directs it to the intended destination. (Does not directly manage smell).");
 sectionInfo[10] = new InfoDisplay("Hypothalamus: Responsible for the basic survival behaviors known as the 4-F’s, fighting, flighting, feeding, and reproduction.");

 sectionInfo[11] = new InfoDisplay("Limbic System: Barrier between the primal brain and the cerebral cortex");
 sectionInfo[12] = new InfoDisplay("Amygdala: Responsible for basic emotional behaviors and serves as the body’s fear switch.");
 sectionInfo[13] = new InfoDisplay("Hippocampus: Processes memories by turning short term memories into long term memories. Also makes complex synaptic connections to every region of the brain to encode information.");
 sectionInfo[14] = new InfoDisplay("Ventral Tegmental Pathway: Regulates reward consumption, learning, memory and addictive behaviors by controlling dopamine release.");

 sectionInfo[15] = new InfoDisplay("Cerebellum: Responsible for muscular coordination and balance, three regions.");
 sectionInfo[16] = new InfoDisplay("Cerebrocerebellum: Plans movement.");
 sectionInfo[17] = new InfoDisplay("Spinocerebellum: Corrects movement");
 sectionInfo[18] = new InfoDisplay("Vestibulocerebellum: Helps with maintaining balance and eye tracking.");
 
 sectionInfo[19] = new InfoDisplay("Parietal Lobe: Responsible for processing sensations, evaluating how outside forces feel, the position of limbs in space and the amount of pressure to place on an object.");
 sectionInfo[20] = new InfoDisplay("Primary Somatosensory Cortex: Directly receives sensory input from the Thalamus and transmits it to the mortar cortex to evaluate sensations and plan responses.");
 sectionInfo[21] = new InfoDisplay("Secondary Somatosensory Area: Takes information from the S1 and compares it to past sensory patterns you experienced");

 sectionInfo[22] = new InfoDisplay("Temporal Lobe: Responsible for memory, emotional responses, auditory understanding and language production.");
 sectionInfo[23] = new InfoDisplay("Primary Auditory Cortex: Directly receives sound and determines the quality of it");
 sectionInfo[24] = new InfoDisplay("Auditory Association Area: Processes sound from the A1 and compares it to what you've heard.");

 sectionInfo[25] = new InfoDisplay("Occipital Lobe: Responsible for processing what you see.");
 sectionInfo[26] = new InfoDisplay("Visual Cortex: Immediately identifies the basic data(Shapes/Shadows) of what you see.");
 sectionInfo[27] = new InfoDisplay("Ventral Stream: Surrounds and supports the V1 to determine color, movement, and depth perception of an object and compares to what you've already seen.");
 sectionInfo[28] = new InfoDisplay("Fusiform Face Area/Gyrus: Responsible for recognizing faces and people.");

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
       // print(curr.getCode());
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
        //sendToPort(curr.getCode());
        
        //add the code to switch between information on the left side here, I think
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
