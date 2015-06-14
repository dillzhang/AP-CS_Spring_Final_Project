public class StartPac{
  
  private int direction = 0; //0-Right, 1-Down, 2-Left, 3-Up
  private float[] directionValues = {0, PI / 2, PI, PI + PI/2};
  private int[][] delta = { {1,0}, {0,1}, {-1,0}, {0,-1} };
  
  private int animation = 0; //0 - 5
  private int[] animationValues = {0, 1, 2, 3, 2, 1};
  
  private int x = 100;
  private int y = 100;
  
  public StartPac(int x, int y){
    this.x = x;
    this.y = y;
  }
  
  public int getX(){
    return this.x;
  }
  
  public void setX(int x) {
    this.x = x;
  }

  public void setDirection(int i) {
    direction = i;
  }
  
  public void nextStep() {
    x += delta[direction][0] * 5;
    y += delta[direction][1] * 5;
    animation = (animation + 1) % 6;
  }
  
  public void drawSprite() {
    color yellow = color(255,255,0);
    fill(yellow);
    System.out.println();
    arc(x, y, 25, 25, directionValues[direction] + animationValues[animation] * PI / 12, 2 * PI + directionValues[direction] - animationValues[animation] * PI / 12, PIE);
  }
  
  void keyPressed() {
  }
  
  void draw() {
    this.drawSprite();
    this.nextStep();
  }
}
