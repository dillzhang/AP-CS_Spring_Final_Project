public class Ghost_Animation {
  private int direction = 0;
  private float[] directionValues = {0, PI / 2, PI, PI + PI/2};
  private int[][] delta = { {1,0}, {0,1}, {-1,0}, {0,-1} };
  
  private int x = 250;
  private int y = 250;
  
  private color colour;
  
  
  public Ghost_Animation(int r, int g, int b){
    colour = color(r,g,b);
  }


  void drawGhost(){
    noStroke();
    fill(colour);
    rectMode(CENTER);
    rect(x,y,25,13);
    //fill(255);
    arc(x,y - 6,24,25,PI,2*PI);
    fill(0);
    triangle(x,y + 1, x - 2.5, y + 7, x + 2.5, y + 7);
    triangle(x - 12, y + 7, x - 6, y + 7, x - 9, y + 1);
    triangle(x + 12, y + 7, x + 6, y + 7, x + 9, y + 1);
  }
}
