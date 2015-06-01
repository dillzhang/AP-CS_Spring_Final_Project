PacMan p;

void setup() {
  size(400,400);
  background(0);
  frameRate(15);
  p = new PacMan();
}

void draw() {
  background(100);
  p.drawSprite();
  p.nextStep();
}

void keyPressed() {
  p.keyPressed();
}
