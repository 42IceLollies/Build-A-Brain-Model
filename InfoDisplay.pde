class InfoDisplay{
  //This is where we can put the information to display on the right
  //If we're just doing like a label up top and the sub catagories with definitions we can just put in separate instance variables for all of those
  //also feel free to get rid of anything below, this is all just a place filler mostly
  public String partName;
  
  InfoDisplay(String partName)
  {
    this.partName = partName;
  }
  
  public void draw()
  {
    fill(0);
    textSize(50);
    text(partName, (displayWidth/4)*3, margin);
  }
}
