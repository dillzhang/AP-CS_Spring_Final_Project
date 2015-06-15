Statistics stat;
Board board;
AStarMaze maze;

void setup() {
  size(560,720);
  background(0);
  frameRate(15);
  board = new Board("board.dat");
  stat = new Statistics(board);
  maze = new AStarMaze(14,23);
  maze.bfs(1,1);
}

void draw() {
  background(0);
  //stat.draw();
}

void keyPressed() {
  //stat.keyPressed();
}
