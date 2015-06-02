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
    xcor += delta[direction][0] * 3;
    ycor += delta[direction][1] * 3;
    animation = (animation + 1) % 10;
  }
  
  public void drawSprite() {
    fill(skin);
    System.out.println();
    rect(xcor-10.5,ycor-1,21,9);
    arc(xcor, ycor, 21, 21, PI, 2 * PI);
    
    if (animation < 5) {
      arc(xcor-7, ycor+8,5,5  ,0,PI);
      arc(xcor, ycor+8,5,5,0,PI);
      arc(xcor+7, ycor+8,5,5,0,PI);
    } else {
      arc(xcor-7.5, ycor+8,5,5  ,0,PI);
      arc(xcor-2.5, ycor+8,5,5,0,PI);
      arc(xcor+2.5, ycor+8,5,5,0,PI);
      arc(xcor+7.5, ycor+8,5,5,0,PI);
    }
    
    
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
