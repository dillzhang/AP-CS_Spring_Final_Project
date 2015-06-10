import java.util.*;

public class Board {
  
// INSTANCE VARIABLES ====================================================================================================================================================================================
  
  //ANIMATION
  //int to determine the instance of animation
  private int animation = 0;
  private final int animationrate = 6;
  private final int animationstep  = 2;
  
  //BOARD 
  //int[][] to store the locations of board pieces based on an integer value
  private int[][] board;  
  
  //Loads the different images for the board pieces
  private PImage d0 = loadImage("images/black.jpg");
  
  private PImage d1 = loadImage("images/d1.jpg");
  private PImage d2 = loadImage("images/d2.jpg");
  private PImage d3 = loadImage("images/d3.jpg");
  private PImage d4 = loadImage("images/d4.jpg");
  
  private PImage d5 = loadImage("images/d5.jpg");
  private PImage d6 = loadImage("images/d6.jpg");
  private PImage d7 = loadImage("images/d7.jpg");
  private PImage d8 = loadImage("images/d8.jpg");
  
  private PImage d10 = loadImage("images/d10.jpg");
  private PImage d11 = loadImage("images/d11.jpg");
  private PImage d12 = loadImage("images/d12.jpg");
  private PImage d13 = loadImage("images/d13.jpg");
  
  private PImage dh0 = loadImage("images/dh0.jpg");
  private PImage dh1 = loadImage("images/dh1.jpg");
  private PImage dh2 = loadImage("images/dh2.jpg");
  private PImage dh3 = loadImage("images/dh3.jpg");
  
  private PImage dv0 = loadImage("images/dv0.jpg");
  private PImage dv1 = loadImage("images/dv1.jpg");
  private PImage dv2 = loadImage("images/dv2.jpg");
  private PImage dv3 = loadImage("images/dv3.jpg");
  
  private PImage c0 = loadImage("images/c0.jpg");
  private PImage c1 = loadImage("images/c1.jpg");
  private PImage c2 = loadImage("images/c2.jpg");
  private PImage c3 = loadImage("images/c3.jpg");
  
  private PImage vW = loadImage("images/vW.jpg");
  private PImage hW = loadImage("images/hW.jpg");
  
  private PImage dot = loadImage("images/dot.jpg");
  private PImage powerDot = loadImage("images/powerDot.jpg");
  
  //Stores the different values for the board
  private PImage[] pieces = {
     d0,  d1,  d2,  d3, d4, //0
     d5,  d6,  d7,  d8, null, //1
    d10, d11, d12, d13, null, //2
    dh0, dh1, dh2, dh3, null, //3
    dv0, dv1, dv2, dv3, null, //4
     c0,  c1,  c2,  c3, null, //5
     vW,  hW, null, null, null, //6
    null, null, null, null, null, //7
    null, null, null, null, null, //8
    null, null, null, null, null, //9
     d0, dot, powerDot, null, null  //10
  };

// CONSTRUCTOR ===========================================================================================================================================================================================

  //Board()
  //Constructs a board with a given filename or path
  //  File must be formatted as follows
  //    -Line 1: int h, Height of the Board
  //    -Line 2: int w, Width of the Board
  //    -Next h lines: int values for the board seperated by spaces
  public Board(String filename) {
    String[] lines = loadStrings(filename);
    board = new int[Integer.parseInt(lines[0])][Integer.parseInt(lines[1])];
    for (int i = 0; i < board.length; i++) {
      String[] line = lines[i + 2].split(" ");  
      for (int j = 0; j < board[i].length; j++) {
        board[i][j] = Integer.parseInt(line[j]);
      }
    }
  }

  //debugBoard()
  //Draw the board by parsing int[][] and drawing the piece associated with that value for debugging the constructor
  public void debugBoard() {
    for (int i = 0; i < board.length; i++) {
      System.out.println(Arrays.toString(board[i]));
    }
  }  

// METHODS ===============================================================================================================================================================================================

  //returnNeighbors()
  //Returns a list of nieghbors for a given coordinate on the board
  public int[][][] returnNeighbors(int x, int y) {
    return null;
  }

// DRAW() ================================================================================================================================================================================================
  
  void draw() {
    nextStep();
    drawBoard();
  }
  
  //drawBoard()
  //Draw the board by parsing int[][] and drawing the piece associated with that value
  public void drawBoard() {
    for (int i = 0; i < board.length; i++) {
      for (int j = 0; j < board[i].length; j++) {
        if (board[i][j] == 52) {
          image(pieces[board[i][j] - 2 * (animationstep * animation / animationrate)],20 * j, 20 * i + 60);
        } else {
          image(pieces[board[i][j]],20 * j, 20 * i + 60);
        }
      }
    }
  }
  
  //nextStep()
  public void nextStep() {
    animation = (animation + 1) % animationrate;
  }

// KEYPRESSED() ==========================================================================================================================================================================================
  
  void keyPressed() {
    
  } 
  
}

