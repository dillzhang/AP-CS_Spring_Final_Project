import java.util.Random;

public class Ghost {

  // INSTANCE VARIABLES ====================================================================================================================================================================================

  //ANIMATION
  //int to determine the instance of animation
  private int animation = 0;
  private final int animationrate = 10;
  private final int animationstep  = 2;

  //MOTION
  //int to determine direction of travel and changes in xcor and ycor
  private int direction = 2; //0-Right, 1-Down, 2-Left, 3-Up
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
  private Random rand = new Random();
  private int time;
  private int wait;
  private boolean exiting = true;

  //LOCATION
  private int xbor, ybor, xpos, ypos, defx, defy;

  //INFO
  private color skin;
  private boolean scared = false;

  // CONSTRUCTOR ===========================================================================================================================================================================================

  public Ghost(color s, int x, int y, int delay) {
    defx = x;
    defy = y;
    skin = s;
    time = millis();
    wait = delay;
    reset();
  }
  
  public void reset() {
    xbor = defx;
    xpos = 4;
    ybor = defy;
    ypos = 2;
    notscared();
  }
  
  public void timereset() {
    time = millis();
    exiting = true;
    wait = 5000;
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
  
  public void scared() {
    scared = true;
  }
  
  public void notscared() {
    scared = false;
  }
  
  public boolean getScared() {
    return scared;
  }

  // DRAW() ================================================================================================================================================================================================

  void draw() {
    nextStep();
    drawSprite();
    exiter();
  }

  public void exiter() {
    if (millis() - time > wait && exiting) {
      reset();
      xbor = 13;
      ybor = 11;
      exiting = false;
    }
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
    animation = (animation + 1) % animationrate;
    
    if ( !(board.isWall(ybor, xbor + delta[direction][0]) && xpos == 2) ) {
      xpos += delta[direction][0];
      if (xpos >= 4) {
        xbor += 1;
        xpos = 0;
      } else if (xpos <= 0) {
        xbor -= 1;
        xpos = 4;
      }
    } else {
      nextDirection = rand.nextInt(4);
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
    } else {
      nextDirection = rand.nextInt(4);
    }
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
}



