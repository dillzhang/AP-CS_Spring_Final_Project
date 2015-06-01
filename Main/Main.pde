Board b;
PacMan p;

void setup() {
  size(560,720);
  background(0);
  frameRate(20);
  b = new Board("board.dat");
  p = new PacMan();
}

void draw() {
  b.draw();
  p.draw();
}

void mouseClicked() {
  
}

void keyPressed() {
  p.keyPressed();
}
