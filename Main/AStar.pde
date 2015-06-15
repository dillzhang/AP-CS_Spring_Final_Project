import java.io.*;
import java.util.*;

public class AStar {
    
    private int[][] board;

    private int startX;
    private int startY;

    private int exitX;
    private int exitY;

    private boolean solved = false;
    private int[][] neighbors = { {1,0} , {0,1} , {-1,0} , {0,-1} };
    
    private AQueue searchOrder;
    private ANode finale;

    public AStar(int x, int y, int destx, int desty, int[][] b) {
      startX = x;
      startY = y;
      exitX = destx;
      exitY = desty;
      board = b;
    }
    
    public void aStar(ANode n) {
      
      if (n.getX() == exitX && n.getY() == exitY) {
          solved = true;
          finale = n;
      }
      
      if (solved == true) {
          return;
      }
    
      board[n.getX()][n.getY()] = 49;
 
      for (int i = 0 ; i < neighbors.length ; i++ ) {
          int xcor = n.getX() + neighbors[i][0];
          int ycor = n.getY() + neighbors[i][1];
          int location = board[xcor][ycor];
          if (location >= 50) {
        
            int prior = Math.abs(xcor - exitX) + Math.abs(ycor - exitY) + n.getSteps();
            int steps = n.getSteps() + 1;
            ANode temp = new ANode(xcor, ycor, n, prior, steps);
            
            //System.out.println(temp);
            searchOrder.enqueue(temp);
            //System.out.println(searchOrder);
          }
      } 
      //System.out.println(searchOrder);
      aStar(searchOrder.dequeue());
    }

    public ArrayList<int[]> aStar() {
        searchOrder = new AQueue();
  
        ANode temp = new ANode(startX,startY,null,(startX - exitX)^2 + (startY - exitY)^2,0);
        aStar(temp);
        
        ArrayList<int[]> path = new ArrayList<int[]>();
        temp = finale;
        while (temp != null) {
            int[] coordinates = new int[2];
            coordinates[0] = temp.getX();
            coordinates[1] = temp.getY();
            path.add(0, coordinates);
            temp = temp.getPrevious();
        }
        return path;
    }  
}
