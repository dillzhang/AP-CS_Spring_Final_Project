Board board;
PacMan pacman;

void setup() {
  size(560,720);
  background(0);
  frameRate(15);
  
  board = new Board("board.dat");
  pacman = new PacMan();
}

void draw() {
  background(0);
  board.draw();
  pacman.draw();
}

void keyPressed() {
  pacman.keyPressed();
}
