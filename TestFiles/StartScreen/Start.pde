public class Start {
  int dots, prevCount, count;
  private PImage dot = loadImage("dot.jpg");
  
  void draw() {
    DrawDots();
    WriteText();
  }
  
  public Start() {
    prevCount = 1;
    count = 1;
    dots = 100;
  }
  
  public void addPrevCount() {
    prevCount++;
  }
  
  public void setPrevCount(int num) {
    prevCount = num;
  }
  
  public int getPrevX(){
    return prevCount * 20 + 260;
  }
  
  public void WriteText() {
    fill(255);
    textAlign(CENTER,TOP);
    textSize(125);
    text("Pac-Man",280,10);
    textSize(20);
    text("Click Anywhere to Start", 280, 600);
  }
  
  void DrawDots(){
    noStroke();
    fill(255,218,185);
    while (count < 15) {
      ellipse(260 + count * 20, 360, 6, 6);
      count ++;
    }
    print(count);
    count = prevCount;
  }
}
