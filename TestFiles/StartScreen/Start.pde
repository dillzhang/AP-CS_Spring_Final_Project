public class Start {
  int dots, prevCount, count;
  private PImage dot = loadImage("dot.jpg");
  
  void draw() {
    DrawDots();
  }
  
  public void addPrevCount() {
    prevCount++;
  }
  
  public int getPrevX(){
    return prevCount * 20 + 260;
  }
  
  public Start() {
    prevCount = 1;
    count = 1;
    dots = 100;
  }
  
  void DrawDots(){
    while (count < 15) {
      //image(dot, 260 + count * 20, 360);
      fill(255);
      ellipse(260 + count * 20, 360, 6, 6);
      count ++;
    }
    count = prevCount;
  }
}
