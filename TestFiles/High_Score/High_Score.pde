HighScore high;

void setup() {
  size(560,720);
  high = new HighScore(20000);
}

void draw() {
  high.draw();
}

void mouseClicked() {
  high.mouseClicked();
}

void keyPressed() {
  high.keyPressed();
}
