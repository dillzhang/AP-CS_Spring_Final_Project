Statistics stat;
Board board;

void setup() {
  size(560,720);
  background(0);
  frameRate(15);
  board = new Board("board.dat");
  stat = new Statistics(board);
}

void draw() {
  background(0);
  stat.draw();
}

void keyPressed() {
  stat.keyPressed();
}
