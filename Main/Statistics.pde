public class Statistics {

  // INSTANCE VARIABLES ====================================================================================================================================================================================
  
  //TIMING
  private boolean startscreen = true;
  private boolean gameplay = false;
  private boolean death = false;
  private boolean reset = false;
  private boolean highscore = false;
  
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
  private int scaredtime = millis();
  
  // CONSTRUCTOR ===========================================================================================================================================================================================  

  //Statistics
  public Statistics(Board bor) {
    start = new Start();
    p = new PacMan();
    b = bor;
    blinky = new Ghost(color(255,39,40),13,11,0);
    pinky = new Ghost(color(243,176,67),11,14,5000);
    inky = new Ghost(color(94,219,192),13,14,10000);
    clyde = new Ghost(color(240,178,202),15,14,15000);
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
    } else if (death) {
      fill(255);
      textAlign(CENTER,TOP);
      textSize(125);
      text("You Died",280,10);
      textSize(20);
      text("Press Any Key to Continue", 280, 600);
    } else if (reset) {
      reset();
      b = new Board("board.dat");
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
  
  public void reset() {
    for (Ghost g: Spooky) {
      g.reset();
    }
    p = new PacMan();
    reset = false;
    gameplay = true;
  }
  
  public void drawStats() {
    
    fill(255);
    textSize(60);
    textAlign(CENTER,TOP);
    text("Pacman", 280, -5);
    
    textSize(25);
    textAlign(RIGHT,BOTTOM);
    text("" + score, 560, 720);
    
    color yellow = color(255, 255, 0);
    fill(yellow);
    for (int i = 0; i < lives; i++) {
      arc(20 + (i * 30), 700, 25, 25, PI/12, 11* PI/6, PIE);
    
    }
    
    
    
    
  }
  
  public void nextStep() {
    
    
    if (b.value(p.getY(),p.getX()) == 52) {
      b.setvalue(p.getY(), p.getX(), 50);
      score += 20;
      blinky.scared();
      pinky.scared();
      inky.scared();
      clyde.scared();
      scaredtime = millis();
    }
        
    if (millis() - scaredtime > 10000) {
      blinky.notscared();
      pinky.notscared();
      inky.notscared();
      clyde.notscared();
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
          death = true;
          reset = true;
        } else {
          //g.reset();
          score += 100;
          g.timereset();
          g.reset();
        }
      }
    }
    
    if (b.count() <= 0){
      level += 1;
      reset = true;
    }
    
    if (lives == 0) {
      gameplay = false;
      high = new HighScore(score);
      highscore = true;
    }
    
  }

// KEYPRESSED() ==========================================================================================================================================================================================
  
  void keyPressed() {
    if (startscreen) {
      startscreen = false;
      reset = true;
    } else if (death) {
      reset();
      death = false;
    } else if (!reset && gameplay) {
      p.keyPressed();
    } else if (highscore) {
      high.keyPressed();
    }
  }  
 
  
}
