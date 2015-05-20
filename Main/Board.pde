import java.util.*;
import java.io.*;

public class Board {
  
  //int[][] to store the locations of board pieces based on an integer value
  private int[][] board;  
  
  //Different board pieces 
  private Piece00 p00 = new Piece00();
  private Piece01 p01 = new Piece01();
  private Piece02 p02 = new Piece02();
  private Piece03 p03 = new Piece03();
  private Piece04 p04 = new Piece04();
  private Piece05 p05 = new Piece05();
  private Piece06 p06 = new Piece06();
  private Piece07 p07 = new Piece07();
  private Piece08 p08 = new Piece08();
  private Piece09 p09 = new Piece09();
  private Piece10 p10 = new Piece10();
  
  //Stores the different types of board pieces
  private Piece[] pieces = {p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10};
  
  //Constructs a board with a given filename or path
  //  File must be formatted as follows
  //    -Line 1: int h, Height of the Board
  //    -Line 2: int w, Width of the Board
  //    -Next h lines: int values for the board seperated by spaces
  public Board(String filename) {
    Scanner s = null;
    try {
      s = new Scanner(new File(filename));
      board = new int[s.nextInt()][s.nextInt()];
      for (int i = 0; i < board.length; i++) {
        String[] values = s.nextLine().split(" ");
        for (int j = 0; j < board[i].length; j++) {
          board[i][j] = Integer.parseInt(values[j]);
        }
      }
    } catch (Exception e) {
      System.out.println("Board Constructor Failure");
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
        pieces[board[i][j]].drawPiece(i, j);
      }
    }
  }
  
}
