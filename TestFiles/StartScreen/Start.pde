public class Start {
  int dots, prevCount, count;
  private PImage dot = loadImage("dot.jpg");
  private Ghost r, o, c, p;
  private PacMan pac;
  
  void draw() {
    pac.draw();
    r.drawSprite();
    r.nextStep();
    o.drawSprite();
    o.nextStep();
    c.drawSprite();
    c.nextStep();
    p.drawSprite();
    p.nextStep();
    if (start.getPX() < (pac.getX() + 20)) start.addPC();
    if (pac.getX() == 0) start.setPC(-13);
    if (pac.getX() > 560) pac.setX(-160);
    if (r.getX() > 560) r.setX(-160);
    if (o.getX() > 560) o.setX(-160);
    if (c.getX() > 560) c.setX(-160);
    if (p.getX() > 560) p.setX(-160);
    DrawDots();
    WriteText();
  }
  
  public Start() {
    prevCount = 1;
    count = 1;
    dots = 100;
    color red = color(255,39,40);
    color orange = color(243,176,67);
    color cyan = color(94,219,192);
    color pink = color(240,178,202);
    r = new Ghost(red, 100, 360);
    o = new Ghost(orange, 130, 360);
    c = new Ghost(cyan, 160, 360);
    p = new Ghost(pink, 190, 360);
    pac = new PacMan(245, 360);
    frameRate(20);
  }
  
  public void addPC() {
    prevCount++;
  }
  
  public void setPC(int num) {
    prevCount = num;
  }
  
  public int getPX(){
    return prevCount * 20 + 260;
  }
  
  public void WriteText() {
    fill(255);
    textAlign(CENTER,TOP);
    textSize(125);
    text("Pac-Man",280,10);
    textSize(20);
    text("Press Any Key to Start", 280, 600);
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


