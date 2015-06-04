Ghost g;

void setup() {
  size(400, 400);
  background(0);
  frameRate(15);

  color red = color(255, 0, 0);
  g = new Ghost(red);
  g.setScared(true);
}

void draw() {
  background(100);
  g.drawSprite();
  g.nextStep();
}

void keyPressed() {
  g.keyPressed();
}

