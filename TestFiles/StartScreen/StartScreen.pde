Ghost r, o, c, p;
PacMan pac;
Start start;

void setup() {
  size(560,720);
  background(0);
  color red = color(255,39,40);
  color orange = color(243,176,67);
  color cyan = color(94,219,192);
  color pink = color(240,178,202);
  r = new Ghost(red, 100, 360);
  o = new Ghost(orange, 130, 360);
  c = new Ghost(cyan, 160, 360);
  p = new Ghost(pink, 190, 360);
  pac = new PacMan(245, 360);
  start = new Start();
  frameRate(20);
}

void draw() {
  background(0);
  start.draw();
  pac.draw();
  r.drawSprite();
  r.nextStep();
  o.drawSprite();
  o.nextStep();
  c.drawSprite();
  c.nextStep();
  p.drawSprite();
  p.nextStep();
  if (start.getPrevX() < (pac.getX() + 20)) start.addPrevCount();
  if (pac.getX() > 560) pac.setX(0);
  if (r.getX() > 560) r.setX(0);
  if (o.getX() > 560) o.setX(0);
  if (c.getX() > 560) c.setX(0);
  if (p.getX() > 560) p.setX(0);
  
}
