class InfoDisplay{
  //This is where we can put the information to display on the right
  //If we're just doing like a label up top and the sub catagories with definitions we can just put in separate instance variables for all of those
  //also feel free to get rid of anything below, this is all just a place filler mostly
  private String header;
  private String textOne;
  private String headerTwo;
  private String textTwo;
  private String headerThree;
  private String textThree;
  private String headerFour;
  private String textFour;

  private int margin = displayWidth/30;
  private int smallMargin = displayWidth/70;
  private int lineHeight = 2;
  private int leftLimit = displayWidth/2;
  private int topLimit = displayHeight/10;
  private int headerText = 45;
  private int normalText = 25;
  private float textBoxWidth = displayWidth/2.5;
  private int textBoxHeight = displayHeight/7;
  
  
  //Two constructors to accomodate terms with differing subterms
  InfoDisplay(String textOne, String textTwo, String textThree, String textFour)
  {
    this.header = textOne.substring(0, textOne.indexOf(":")+1);
    this.textOne = textOne.substring(textOne.indexOf(":")+2);
    
    this.headerTwo = textTwo.substring(0, textTwo.indexOf(":")+1);
    this.textTwo = textTwo.substring(textTwo.indexOf(":")+2);
    
    this.headerThree = textThree.substring(0, textThree.indexOf(":")+1);
    this.textThree = textThree.substring(textThree.indexOf(":")+2);
    
    this.headerFour = textFour.substring(0, textFour.indexOf(":")+1);
    this.textFour = textFour.substring(textFour.indexOf(":")+2);
  }
  
  InfoDisplay(String textOne, String textTwo, String textThree)
  {
    this.header = textOne.substring(0, textOne.indexOf(":")+1);
    this.textOne = textOne.substring(textOne.indexOf(":")+2);
    
    this.headerTwo = textTwo.substring(0, textTwo.indexOf(":")+1);
    this.textTwo = textTwo.substring(textTwo.indexOf(":")+2);
    
    this.headerThree = textThree.substring(0, textThree.indexOf(":")+1);
    this.textThree = textThree.substring(textThree.indexOf(":")+2);
    
    this.headerFour = "null";
    this.textFour = "null";
  }
  
  public void drawInfo()
  {
    int startPoint = 0;
    int endPoint = 0;
    int yMargin = 0;
    
     textAlign(LEFT);
     
    //header
    fill(#FF2E2E);
    textSize(60);
    yMargin+= topLimit;
    text(header, leftLimit, yMargin);
    
    //main definition
    fill(255);
    yMargin+= smallMargin;
    textSize(normalText);
    rectMode(CORNER);
    text(textOne, leftLimit, yMargin, textBoxWidth, textBoxHeight);
    
    //second header
    fill(#9D9D9D);
    textSize(headerText);
    yMargin+= textBoxHeight+ smallMargin;
    text(headerTwo, leftLimit, yMargin);
    
    //second definition
    fill(255);
    yMargin+= smallMargin;
    textSize(normalText);
    text(textTwo, leftLimit, yMargin, textBoxWidth, textBoxHeight);
    
    //third header
    fill(#9D9D9D);
    textSize(headerText);
    yMargin+= textBoxHeight + margin;
    text(headerThree, leftLimit, yMargin);
    
    //third definition
    fill(255);
    yMargin+= smallMargin;
    textSize(normalText);
    text(textThree, leftLimit, yMargin, textBoxWidth, textBoxHeight);
    
    //if last one does not equal null, display it
    if(!headerFour.equals("null")){
      fill(#9D9D9D);
      textSize(headerText);
      yMargin+= textBoxHeight + margin;
      text(headerFour, leftLimit, yMargin);
      fill(255);
      yMargin+= smallMargin;
      textSize(normalText);
      text(textFour, leftLimit, yMargin, textBoxWidth, textBoxHeight);
    }
    
    
    textAlign(CENTER);
    rectMode(CENTER);
  }
  
  //finds the end of word closest to a given number of indeces
  private int findWordEnd(int idxNum, String line)
  {
    int wordEnd = 0; 
    int nextWordEnd = 0;
    
    while(nextWordEnd<idxNum)
    {
      wordEnd = nextWordEnd;
      nextWordEnd = line.indexOf(" ", wordEnd);
      
      if(nextWordEnd == -1)
      {
        return( line.length());
      }
    }
    return wordEnd;
  }
}
