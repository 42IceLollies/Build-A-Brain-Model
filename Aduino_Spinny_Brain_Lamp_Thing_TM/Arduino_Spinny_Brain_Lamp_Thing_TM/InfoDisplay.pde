class InfoDisplay{
  public String partName;
  public String image; // this may need to be changed, I'm not sure how to work with images in here 
  
  InfoDisplay(String partName)
  {
    this.partName = partName;
  }
  
  public void draw()
  {
    fill(0);
    textSize(50);
    text(partName, (displayWidth/4)*3, margin);
    print("HI");
  }
}
