Board b;

void setup() {
  size(560,720);
  background(0);
  b = new Board("board.dat");
}

void draw() {
  
}

void mouseClicked() {
  b.debugBoard();
}

void keyPressed() {
  
}
