public class Ghost {

  // INSTANCE VARIABLES ====================================================================================================================================================================================

  //ANIMATION
  //int to determine the instance of animation
  private int animation = 0;
  private final int animationrate = 6;
  private final int animationstep  = 2;

  //MOTION
  //int to determine direction of travel and changes in xcor and ycor
  private int direction = 0; //0-Right, 1-Down, 2-Left, 3-Up
  private int nextDirection = 0; //For turning
  private float[] directionValues = {
    0, PI / 2, PI, PI + PI/2
  };
  private int[][] delta = { 
    {
      1, 0
    }
    , {
      0, 1
    }
    , {
      -1, 0
    }
    , {
      0, -1
    }
  };
  private boolean controllable;

  //LOCATION
  private int xbor, ybor, xpos, ypos;

  //INFO
  private color skin;
  private boolean scared = false;

  // CONSTRUCTOR ===========================================================================================================================================================================================

  public Ghost(color s, int x, int y) {
    xbor = x;
    xpos = 4;
    ybor = y;
    ypos = 2;
    skin = s;
  }

  // METHODS ===============================================================================================================================================================================================

  public int getX() {
    return xbor;
  }

  public int getY() {
    return ybor;
  }
  
  public void setX(int x) {
    xbor = x;
  }

  // DRAW() ================================================================================================================================================================================================

  void draw() {
    nextStep();
    drawSprite();
  }

  public void drawSprite() {
    color filler = skin;
    color mouth = skin;
    color whites = color(255, 255, 255);
    color eyes = color(40, 80, 251);
    int xdir = delta[direction][0];
    int ydir = delta[direction][1];

    if (scared) {
      filler = color(40, 80, 251);
      mouth = color (255);
      eyes = whites;
      whites = filler;
      xdir = 0;
      ydir = 0;
    }

    fill(filler);
    rect((xbor*20+xpos*5)-12.5, (ybor*20+ypos*5+60)-1, 25, 9);
    arc((xbor*20+xpos*5), (ybor*20+ypos*5+60), 25, 25, PI, 2 * PI);

    arc((xbor*20+xpos*5)-9, (ybor*20+ypos*5+60)+8, 7, 10, 0, PI);
    if (animation < 5) {
      arc((xbor*20+xpos*5), (ybor*20+ypos*5+60)+8, 7, 10, 0, PI);
    } else {
      arc((xbor*20+xpos*5)-3, (ybor*20+ypos*5+60)+8, 7, 10, 0, PI);
      arc((xbor*20+xpos*5)+3, (ybor*20+ypos*5+60)+8, 7, 10, 0, PI);
    }
    arc((xbor*20+xpos*5)+9, (ybor*20+ypos*5+60)+8, 7, 10, 0, PI);

    noStroke();
    fill(whites);
    ellipse((xbor*20+xpos*5) - 5, (ybor*20+ypos*5+60) - 3, 6, 8);
    ellipse((xbor*20+xpos*5) + 5, (ybor*20+ypos*5+60) - 3, 6, 8);
    stroke(1);

    fill(eyes);
    noStroke();

    ellipse((xbor*20+xpos*5) + 5 + 2 * xdir, (ybor*20+ypos*5+60) - 3 + 2 * ydir, 4, 4);
    ellipse((xbor*20+xpos*5) - 5 + 2 * xdir, (ybor*20+ypos*5+60) - 3 + 2 * ydir, 4, 4);    

    stroke(mouth);
    strokeWeight(1.25);
    line((xbor*20+xpos*5) - 9, (ybor*20+ypos*5+60) + 6, (xbor*20+xpos*5) - 6, (ybor*20+ypos*5+60) + 2);
    line((xbor*20+xpos*5) - 6, (ybor*20+ypos*5+60) + 3, (xbor*20+xpos*5) - 3, (ybor*20+ypos*5+60) + 5); 
    line((xbor*20+xpos*5) - 3, (ybor*20+ypos*5+60) + 6, (xbor*20+xpos*5) - 0, (ybor*20+ypos*5+60) + 2);
    line((xbor*20+xpos*5) + 0, (ybor*20+ypos*5+60) + 3, (xbor*20+xpos*5) + 3, (ybor*20+ypos*5+60) + 5);
    line((xbor*20+xpos*5) + 3, (ybor*20+ypos*5+60) + 6, (xbor*20+xpos*5) + 6, (ybor*20+ypos*5+60) + 2);
    line((xbor*20+xpos*5) + 6, (ybor*20+ypos*5+60) + 3, (xbor*20+xpos*5) + 9, (ybor*20+ypos*5+60) + 5);
    strokeWeight(1);
    stroke(0);
  }

  public void nextStep() {
  }
}



