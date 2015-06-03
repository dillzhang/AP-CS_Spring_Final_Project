public class Ghost {
  private color skin;
  
  private int xcor = 100, ycor = 100;
  private int xbor = 0, ybor = 0;
  
  private int direction;
  
  private float[] directionValues = {0, PI / 2, PI, PI + PI/2};
  private int[][] delta = { {1,0}, {0,1}, {-1,0}, {0,-1} };
  
  private int animation = 0; //0 - 5
  private int[] animationValues = {0, 1, 2, 3, 2, 1};
  
  public Ghost(color s) {
    skin = s;
  }
  
  public void setDirection(int i) {
    direction = i;
  }
  
  public void nextStep() {
    xcor += delta[direction][0] * 5;
    ycor += delta[direction][1] * 5;
    animation = (animation + 1) % 10;
  }
  
  public void drawSprite() {
    fill(skin);
    println();
    rect(xcor-12.5,ycor-1,25,8);
    arc(xcor, ycor, 25, 25, PI, 2 * PI);
    
    if (animation < 5) {
      arc(xcor-8, ycor+7,7,12,0,PI);
      arc(xcor, ycor+7,7,12,0,PI);
      arc(xcor+8, ycor+7,7,12,0,PI);
    } else {
      arc(xcor-9, ycor+7,7,12,0,PI);
      arc(xcor-3, ycor+7,7,12,0,PI);
      arc(xcor+3, ycor+7,7,12,0,PI);
      arc(xcor+9, ycor+7,7,12,0,PI);
    }
    
    
  }
  
  public void drawScaredSprite() {
    fill(0,0,255);
    println();
    rect(xcor-12.5,ycor-1,25,8);
    arc(xcor, ycor, 25, 25, PI, 2 * PI);
    
    if (animation < 5) {
      arc(xcor-8, ycor+7,7,12,0,PI);
      arc(xcor, ycor+7,7,12,0,PI);
      arc(xcor+8, ycor+7,7,12,0,PI);
    } else {
      arc(xcor-9, ycor+7,7,12,0,PI);
      arc(xcor-3, ycor+7,7,12,0,PI);
      arc(xcor+3, ycor+7,7,12,0,PI);
      arc(xcor+9, ycor+7,7,12,0,PI);
    }
    
    fill(255);
    noStroke();
    rect(xcor - 5.25, ycor - 4, 3, 3);
    rect(xcor + 3.25, ycor - 4, 3, 3);
    stroke(255);
    strokeWeight(1.5);
    line(xcor - 9, ycor + 6, xcor - 6, ycor + 3);
    line(xcor - 6, ycor + 3, xcor - 3, ycor + 6); 
    line(xcor - 3, ycor + 6, xcor, ycor + 3);
    line(xcor, ycor + 3, xcor + 3, ycor + 6);
    line(xcor + 3, ycor + 6, xcor + 6, ycor + 3);
    line(xcor + 6, ycor + 4, xcor + 9, ycor + 6);
    strokeWeight(1);
    stroke(0);
  }
  void keyPressed() {
    if (key == 'd') {
      setDirection(0);
    } else if (key == 's') {
      setDirection(1);
    } else if (key == 'a') {
      setDirection(2);
    } else if (key == 'w') {
      setDirection(3);
    }
  }
  
}
