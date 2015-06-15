public class PacMan {

// INSTANCE VARIABLES ====================================================================================================================================================================================

  //ANIMATION
  //int to determine the instance of animation  
  private int animation = 0; //0 - 5
  private int[] animationValues = {
    0, 1, 2, 3, 2, 1
  };
  private final int animationrate = 6;
  private final int animationstep  = 6;

  //MOTION
  //int to determine direction of travel and changes in xcor and ycor
  private int direction = 0; //0-Right, 1-Down, 2-Left, 3-Up
  private int nextDirection = 0; //For turning
  private float[] directionValues = {0, PI / 2, PI, PI + PI/2};
  private int[][] delta = { {1, 0}, {0, 1}, {-1, 0}, {0, -1}};

  //LOCATION
  private int xbor, ybor, xpos, ypos;


  // CONSTRUCTOR ===========================================================================================================================================================================================  

  //PACMAN
  public PacMan() {
    xbor = 14;
    ybor = 23;
    xpos = 0;
    ypos = 2;
  }
  
  public PacMan(int x, int y) {
    xbor = x;
    ybor = y;
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

  public void setDirection(int i) {
    nextDirection = i;
  }

  // DRAW() ================================================================================================================================================================================================

  void draw() {
    drawSprite();
    nextStep();
  }

  public void drawSprite() {
    color yellow = color(255, 255, 0);
    fill(yellow);
    arc(xbor*20 + xpos*5, ybor*20 + ypos*5 + 60, 25, 25, directionValues[direction] + animationValues[animation] * PI / 12, 2 * PI + directionValues[direction] - animationValues[animation] * PI / 12, PIE);
  }

  public void nextStep() {

    //X Coordinate
    if ( !(board.isWall(ybor, xbor + delta[direction][0]) && xpos == 2) ) {
      xpos += delta[direction][0];
      if (xpos >= 4) {
        xbor += 1;
        xpos = 0;
      } else if (xpos <= 0) {
        xbor -= 1;
        xpos = 4;
      }
    }

    //Y Coordinate
    if ( !(board.isWall(ybor + delta[direction][1], xbor) && ypos == 2) ) {
      ypos += delta[direction][1];
      if (ypos >= 4) {
        ybor += 1;
        ypos = 0;
      } else if (ypos <= 0) {
        ybor -= 1;
        ypos = 4;
      }
    }

    //Animation
    animation = (animation + 1) % animationrate;

    //Direction
    if (direction != nextDirection) {
      if ((direction + nextDirection) % 2 == 0 ) {
        direction = nextDirection;
      } else if ( nextDirection%2==1 && xpos==2 && !board.isWall(ybor + delta[nextDirection][1], xbor) ) {
        direction = nextDirection;
      } else if ( nextDirection%2==0 && ypos==2 && !board.isWall(ybor, xbor + delta[nextDirection][0]) ) {
        direction = nextDirection;
      }
    }
  }

  // KEYPRESSED() ==========================================================================================================================================================================================

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


