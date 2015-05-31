void setup() {
  size(20,20);
  background(0);
  
  color blue = color(0,80,251);
  color yellow = color(255,255,0);
  color pale = color(255,218,185);
  
  
  //Black Space
  background(0);
  save("black.jpg");
  
  //d1
  background(0);
  stroke(blue);
  strokeWeight(3);
  line(0,1,20,1);
  line(0,10,20,10);
  save("d1.jpg");
  stroke(0);
  strokeWeight(1);
  
  //d2
  background(0);
  stroke(blue);
  strokeWeight(3);
  line(1,0,1,20);
  line(10,0,10,20);
  save("d2.jpg");
  stroke(0);
  strokeWeight(1);
  
  //d3
  background(0);
  stroke(blue);
  strokeWeight(3);
  line(19,0,19,20);
  line(10,0,10,20);
  save("d3.jpg");
  stroke(0);
  strokeWeight(1);
  
  //d4
  background(0);
  stroke(blue);
  strokeWeight(3);
  line(0,19,20,19);
  line(0,10,20,10);
  save("d4.jpg");
  stroke(0);
  strokeWeight(1);
  
  //d5
  background(0);
  fill(blue);
  arc(20,20,42,42,PI,PI + HALF_PI);
  fill(0);
  arc(20,20,33,33,PI,PI + HALF_PI);
  fill(blue);
  arc(20,20,24,24,PI,PI + HALF_PI);
  fill(0);
  arc(20,20,14,14,PI,PI + HALF_PI);
  save("d5.jpg");
  stroke(0);
  strokeWeight(1);
  
  //d6
  background(0);
  fill(blue);
  arc(0,20,42,42,PI + HALF_PI,PI + PI);
  fill(0);
  arc(0,20,33,33,PI + HALF_PI,PI + PI);
  fill(blue);
  arc(0,20,24,24,PI + HALF_PI,PI + PI);
  fill(0);
  arc(0,20,14,14,PI + HALF_PI,PI + PI);
  save("d6.jpg");
  stroke(0);
  strokeWeight(1);
  
  //d7
  background(0);
  fill(blue);
  arc(20,0,42,42,HALF_PI,PI);
  fill(0);
  arc(20,0,33,33,HALF_PI,PI);
  fill(blue);
  arc(20,0,24,24,HALF_PI,PI);
  fill(0);
  arc(20,0,14,14,HALF_PI,PI);
  save("d7.jpg");
  stroke(0);
  strokeWeight(1);
  
  //d8
  background(0);
  fill(blue);
  arc(0,0,42,42,0,HALF_PI);
  fill(0);
  arc(0,0,33,33,0,HALF_PI);
  fill(blue);
  arc(0,0,24,24,0,HALF_PI);
  fill(0);
  arc(0,0,14,14,0,HALF_PI);
  save("d8.jpg");
  stroke(0);
  strokeWeight(1);
  
  //d10
  background(0);
  fill(blue);
  arc(20,20,24,24,PI,PI + HALF_PI);
  fill(0);
  arc(20,20,16,16,PI,PI + HALF_PI);
  fill(blue);
  arc(20,20,6,6,PI,PI + HALF_PI);
  save("d10.jpg");
  stroke(0);
  strokeWeight(1);
  
  //d11
  background(0);
  fill(blue);
  arc(0,20,24,24,PI + HALF_PI,PI + PI);
  fill(0);
  arc(0,20,16,16,PI + HALF_PI,PI + PI);
  fill(blue);
  arc(0,20,6,6,PI + HALF_PI,PI + PI);
  save("d11.jpg");
  stroke(0);
  strokeWeight(1);
  
  //d12
  background(0);
  fill(blue);
  arc(20,0,24,24,HALF_PI,PI);
  fill(0);
  arc(20,0,16,16,HALF_PI,PI);
  fill(blue);
  arc(20,0,6,6,HALF_PI,PI);
  save("d12.jpg");
  stroke(0);
  strokeWeight(1);
  
  //d13
  background(0);
  fill(blue);
  arc(0,0,24,24,0,HALF_PI);
  fill(0);
  arc(0,0,16,16,0,HALF_PI);
  fill(blue);
  arc(0,0,6,6,0,HALF_PI);
  save("d13.jpg");
  stroke(0);
  strokeWeight(1);
  
  //Power Dot
  background(0);
  fill(pale);
  ellipse(10,10,19,19);
  save("powerDot.jpg");
  
  //Regular Dot
  background(0);
  fill(pale);
  ellipse(10,10,6,6);
  save("dot.jpg");
  
}
