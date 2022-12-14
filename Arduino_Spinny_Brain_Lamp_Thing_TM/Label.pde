class Label{
  
  //This is all just for creating the labels on the left and making them functional, some of the methods had to be in the main tab, though, I'm not sure why it wasn't working
  
  private int x;
  private int y;
  private String text;
  private int w;
  private int h;
  private int code;
  private Color fillColor;
  private boolean clicked;
  private int txtSize;
  
  //constructor
  Label(int x, int y, int w, int h, String text, int code, Color fillColor)
  {
    this.x = x;
    this.y = y; 
    this.text = text;
    this.w = w;
    this.h = h;
    this.code = code;
    this.fillColor = fillColor;
    clicked = false;
    txtSize = regularTxt;
  }
  
  //draws the label on the canvas
  public void drawLbl()
  {
    fill(fillColor.getR(), fillColor.getG(), fillColor.getB());
    rect(this.x, this.y, this.w, this.h);
    fill(0);
    textSize(txtSize);
    text(this.text, (this.x + 1/2*width), (this.y + 1/2*height));
    
  }
  
  //adds an outline around a button, needs to be called before drawLbl() function 
  public void addOutline()
  {
    fill(255);
    rect(this.x, this.y, this.w+10, this.h+10);
  }
  
  
  //===========================GETTERS========================================
  public int getX()
  {
    return x;
  }
  
  public int getY()
  {
    return y;
  }
  
  public int getW()
  {
    return w;
  }
  
  public int getH()
  {
    return h;
  }
  
   public int getCode()
  {
    return code;
  }
  
  public boolean getClicked()
  {
    return clicked;
  }
  
  
  //=========================SETTERS==============================
  
  public void setWidth(int amt)
  {
    this.w = amt;
  }
  
  public void setHeight(int amt)
  {
    this.h = amt;
  }
  
  public void setTxtSize(int amt)
  {
    txtSize = amt;
  }
  
  public void toggleClick()
  {
    clicked = !clicked;
    if(clicked)
    {
       this.setWidth(labelWidth+20);
       this.setHeight(labelHeight+20);
       textSize(bigTxt);
    } else 
    {
        this.setWidth(labelWidth);
        this.setHeight(labelHeight);
        textSize(regularTxt);
    }
  }
  
}
