public class Ghost {
  
  private color skin;
  private boolean scared = false;
  
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
    color filler = skin;
    color mouth = skin;
    color whites = color(255,255,255);
    color eyes = color(40,80,251);
    int xdir = delta[direction][0];
    int ydir = delta[direction][1];
        
    if (scared) {
      filler = color(40,80,251);
      mouth = color (255);
      eyes = whites;
      whites = filler;
      xdir = 0;
      ydir = 0;
    }
    
    fill(filler);
    rect(xcor-12.5,ycor-1,25,9);
    arc(xcor, ycor, 25, 25, PI, 2 * PI);
    
    arc(xcor-9, ycor+8,7,10,0,PI);
    if (animation < 5) {
      arc(xcor, ycor+8,7,10,0,PI);
    } else {
      arc(xcor-3, ycor+8,7,10,0,PI);
      arc(xcor+3, ycor+8,7,10,0,PI);
    }
    arc(xcor+9, ycor+8,7,10,0,PI);
    
    noStroke();
    fill(whites);
    ellipse(xcor - 5, ycor - 3, 6,8);
    ellipse(xcor + 5, ycor - 3, 6,8);
    stroke(1);
    
    fill(eyes);
    noStroke();
    ellipse(xcor + 5 + 2 * xdir, ycor - 3 + 2 * ydir, 4, 4);
    ellipse(xcor - 5 + 2 * xdir, ycor - 3 + 2 * ydir, 4, 4);    
    
    stroke(mouth);
    strokeWeight(1.5);
    line(xcor - 9, ycor + 6, xcor - 6, ycor + 2);
    line(xcor - 6, ycor + 3, xcor - 3, ycor + 5); 
    line(xcor - 3, ycor + 6, xcor - 0, ycor + 2);
    line(xcor + 0, ycor + 3, xcor + 3, ycor + 5);
    line(xcor + 3, ycor + 6, xcor + 6, ycor + 2);
    line(xcor + 6, ycor + 3, xcor + 9, ycor + 5);
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
    } else if (key == ' ') {
      scared = !scared;
    }
  }
  
}
