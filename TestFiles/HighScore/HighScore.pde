import java.util.Arrays;
private int[] scores = new int[10];
private String[] names = new String[10];
private String[] ranks = new String[] {"1st","2nd","3rd","4th","5th","6th","7th","8th","9th","10th"};
private int[][] colors = new int[][] {
  {255,255,255}, {255,0,0}, {255,127,0}, {255,255,0}, {127,255,0}, {0,255,127}, 
  {0,255,255}, {0,0,255}, {127,0,255}, {255,0,255}, {255,0,127} };
private int score = 0;

void setup() {
  size(560,720);
  background(0);
  displayScores();
  
}

int addScore() {
  BufferedReader reader = createReader("scores.dat");
  int addIndex = -1;
  try {
    reader.readLine();
  } catch (IOException e) {
    e.printStackTrace();
  }
  
  for(int i = 0; i < 10; i++) {
    try {
      String line = reader.readLine();
      String[] lineB = line.split("\\|");
      scores[i] = Integer.parseInt(lineB[1]);
      names[i] = lineB[2];
    } catch (IOException e) {
      e.printStackTrace();
    }
  }
  
  try {
    reader.close();
  } catch (IOException e) {
    e.printStackTrace();
  }
  for (int i = 0; i < 10; i++) {
    if (scores[i] < score) {
      addIndex = i;
      break;
    }
  }
  return addIndex;
}

void addScore(String name, int addIndex) {
  for (int i = 9; i > addIndex; i--) {
    scores[i] = scores[i - 1];
    names[i] = names[i - 1];
  }
  scores[addIndex] = score;
  names[addIndex] = name;
  PrintWriter writer = createWriter("scores.dat");
  writer.println("Rank|Score|Name");
  for (int i = 0; i < 10; i++) {
    writer.println(ranks[i] + "|" + scores[i] + "|" + names[i]);
  }
  
  writer.close();
  
}

void displayScores() {
  BufferedReader reader = createReader("scores.dat");
  
  String s = "";
  textAlign(CENTER,TOP);
  textSize(90);
  text("High Scores",280,20);
  //textAlign(LEFT,TOP);
  textSize(30);
  for(int i = 0; i < 11; i++) {
    try {
      String line = reader.readLine();
      String[] lineB = line.split("\\|");
      stroke(colors[i][0],colors[i][1],colors[i][2]);
      fill(colors[i][0],colors[i][1],colors[i][2]);
      int y = 200 + (i * 40);
      text(lineB[0],100,y);
      text(lineB[1],280,y);
      text(lineB[2],460,y);
    } catch (IOException e) {
      e.printStackTrace();
    }
  }
 
  
  
}
