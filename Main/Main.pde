Board b;
PacMan p;

void setup() {
  size(560,720);
  background(0);
  frameRate(15);
  
  b = new Board("board.dat");
  p = new PacMan();
}

void draw() {
  background(0);
  b.draw();
  p.draw();
}

void keyPressed() {
  p.keyPressed();
}
