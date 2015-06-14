public class Statistics {

  // INSTANCE VARIABLES ====================================================================================================================================================================================
  
  //TIMING
  private boolean startscreen = false; //true;
  private boolean gameplay = true; //false;
  private boolean reset = false;
  private boolean highscore = true;
  
  //SCORING
  private int lives = 3;
  private int score = 0;
  private int level = 1;
  
  //Components
  private Start start;
  private PacMan p;
  private Board b;
  private Ghost blinky, pinky, inky, clyde;
  private Ghost[] Spooky;
  private HighScore high;
  
  // CONSTRUCTOR ===========================================================================================================================================================================================  

  //Statistics
  public Statistics(Board bor) {
    start = new Start();
    p = new PacMan();
    b = bor;
    blinky = new Ghost(color(255,39,40),13,11);
    pinky = new Ghost(color(243,176,67),11,14);
    inky = new Ghost(color(94,219,192),13,14);
    clyde = new Ghost(color(240,178,202),15,14);
    Spooky = new Ghost[4];
    Spooky[0] = blinky;
    Spooky[1] = pinky;
    Spooky[2] = inky;
    Spooky[3] = clyde;
  }
  
 // DRAW() ================================================================================================================================================================================================
  
  void draw() {
    if (startscreen) {
      start.draw();
    } else if (!reset && gameplay) {
      nextStep();
      drawStats();
      b.draw();
      p.draw();
      blinky.draw();
      pinky.draw();
      inky.draw();
      clyde.draw();
    } else if (highscore) {
      high.draw();
    }
  }
  
  public void drawStats() {
    
  }
  
  public void nextStep() {
    println("x: " + p.getX() + " y: " + p.getY());
    if (b.value(p.getY(),p.getX()) == 52) {
      b.setvalue(p.getY(), p.getX(), 50);
      score += 20;
      blinky.scared();
      pinky.scared();
      inky.scared();
      clyde.scared();
    }
    
    if (b.value(p.getY(), p.getX()) == 51) {
      b.setvalue(p.getY(), p.getX(), 50);
      score += 10;
    }
    
    for (Ghost g:Spooky) {
      if (p.getX() == g.getX() && p.getY() == g.getY()) {
        println("Death");
        if (!g.getScared()) { 
          lives -= 1;
          reset = true;
        } else {
          g.reset();
          score += 100;
        }
      }
    }
    
    if (lives == 0) {
      gameplay = false;
      highscore = true;
    }
    
  }

// KEYPRESSED() ==========================================================================================================================================================================================
  
  void keyPressed() {
    if (startscreen) {
      startscreen = false;
      reset = true;
    } else 
    if (!reset && gameplay) {
      p.keyPressed();
    } else if (highscore) {
      high.keyPressed();
    }
  }  
 
  
}
