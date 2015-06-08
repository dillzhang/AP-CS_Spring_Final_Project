public class Start {
  int dots, prevCount, count;
  private PImage dot = loadImage("dot.jpg");
  
  void draw() {
    DrawDots();
  }
  
  public Start() {
    prevCount = 1;
    count = 1;
    dots = 100;
  }
  
  public void addPrevCount() {
    prevCount++;
    if (prevCount > 16) prevCount = -13;
  }
  
  public int getPrevX(){
    return prevCount * 20 + 260;
  }
  
  public void WriteText() {
    fill(0);
  }
  
  void DrawDots(){
    noStroke();
    fill(255,218,185);
    while (count < 15) {
      println(count);
      ellipse(260 + count * 20, 360, 6, 6);
      count ++;
    }
    print(count);
    count = prevCount;
  }
}
