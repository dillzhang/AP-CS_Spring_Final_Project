import java.util.*;

public class Board {

  //int[][] to store the locations of board pieces based on an integer value
  private int[][] board;  


  //Stores the different types of board pieces
  private String[] pieces = {
  };

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

  //Draw the board by parsing int[][] and drawing the piece associated with that value
  public void debugBoard() {
    for (int i = 0; i < board.length; i++) {
      System.out.println(Arrays.toString(board[i]));
    }
  }  

  //Returns a list of nieghbors for a given coordinate on the board
  public int[][][] returnNeighbors(int x, int y) {
    return null;
  }

  //Draw the board by parsing int[][] and drawing the piece associated with that value
  public void drawBoard() {
    for (int i = 0; i < board.length; i++) {
      for (int j = 0; j < board[i].length; j++) {
      }
    }
  }
}

