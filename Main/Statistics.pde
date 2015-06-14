public class Statistics {

  // INSTANCE VARIABLES ====================================================================================================================================================================================
  
  //TIMING
  private boolean startscreen = true;
  private boolean gameplay = false;
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
      
    }
  }
  
  public void drawStats() {
    
  }
  
  public void nextStep() {
    
  }

// KEYPRESSED() ==========================================================================================================================================================================================
  
  void keyPressed() {
    if (startscreen) {
      startscreen = false;
      reset = true;
    } else if (!reset && gameplay) {
      p.keyPressed();
    } else if (highscore) {
    
    }
  }  
 
  
}
