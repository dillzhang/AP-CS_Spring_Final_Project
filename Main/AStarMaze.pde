import java.io.*;
import java.util.*;

public class AStarMaze 
{
  private char[][] board;
  private int[][] thePath = new int[100][100];
  private int maxX;
  private int maxY;

  private char path='#';
  private char wall=' ';
  private char me='G';
  private char exit='P';
  private int exitX;
  private int exitY;
  private char visited = '.';
  private boolean solved = false;

  private Frontier f;

  public void delay(int n) {
    try {
      Thread.sleep(n);
    } 
    catch (Exception e) {
    }
  }

  public AStarMaze(int pacX, int pacY) 
  {
    exitX = pacX;
    exitY = pacY;
    maxX=28;
    maxY=31;
    board = new char[maxY][maxX];
    String[] lines = loadStrings("board.dat");
    for (int i = 0; i < board.length; i++) {
      String[] line = lines[i + 2].split(" ");  
      for (int j = 0; j < board[i].length; j++) {
        //println("i: " + i + " j: " + j);
        String num = line[j];
        if (!num.equals("51")) board[i][j] = wall;
        else if (i == exitX && j == exitY) board[i][j] = exit;
        else if (num.equals("51")) board[i][j] = path;
      }
    }
    
  }

  public String toString()
  {
    String s = "[2J\n";

    for (int y=0; y<maxY; y++)
    {
      for (int x=0; x<maxX; x++)
        s = s +board[x][y];
      s=s+"\n";
    }
    return s;
  }

  /*
      solved - instance variable to indicate we're done
   			
   */
  public void solve(int x, int y) {
    if (board[x][y]==wall ||
      board[x][y]==me ||
      board[x][y]==visited ||
      solved) {
      return;
    }

    if (board[x][y]==exit) {
      //System.out.println(this);
      solved = true;
    }
    delay(100);
    System.out.println(this);
    board[x][y]=me;
    solve(x+1, y);
    solve(x-1, y);
    solve(x, y+1);
    solve(x, y-1);
    if (!solved) {
      board[x][y]=visited;
    }
  }

  /*
      Only adds if the tx,ty spot is available path or exit
   */
  public void addToFront(int tx, int ty, int steps, Node current) {
    Node tmp = null;
    if (board[tx][ty]=='#' || board[tx][ty]=='$') {
      //System.out.println(steps);
      tmp = new Node(tx, ty);
      tmp.setPriority( Math.abs(exitX - tx) + Math.abs(exitY - ty)+ steps);
      tmp.setSteps(steps);
      tmp.setPrev(current);
      f.add(tmp);
    }
  }

  public void bfs(int x, int y) {
    //f = new Frontier();
    f = new Frontier();

    f.add(new Node(x, y));

    int tx=0, ty=0;
    Node current = null;
    while (!f.isEmpty ()) {
      current = f.remove();
      int cx = current.getX();
      int cy = current.getY();
      int steps = current.getSteps() + 1;
      if (board[cx][cy]=='$')
        break;

      board[cx][cy]='z';
      //System.out.println(steps);
      addToFront(cx+1, cy, steps, current);
      addToFront(cx-1, cy, steps, current);
      addToFront(cx, cy+1, steps, current);
      addToFront(cx, cy-1, steps, current);

      delay(50);
      //System.out.println(this);
    }

    // path recovery
    int count = 0;
    for (Node p = current; p != null; p = p.getPrev ()) {
      int xc = p.getX();
      int yc = p.getY();
      int [] coord = new int[] {
        xc, yc
      };
      //board[p.getX()][p.getY()] = 'P';
      thePath[count] = coord;
      delay(100);
      count++;
      //System.out.println(this);
    }
    for (int i = 0; i < thePath.length; i++) {
      print(Arrays.toString(thePath[i]) + " ");
    }
    //print(Arrays.toString(thePath));
  }

  /*public static void main(String[] args){
   	AStarMaze m = new AStarMaze();
   	System.out.println(m);
   	m.bfs(1,1);
   	System.out.println(m);
   		
   }*/
}

