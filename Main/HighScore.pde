public class HighScore {
  private int[] scores = new int[10];
  private String[] names = new String[10];
  private String[] ranks = new String[] { "1st", "2nd", "3rd", "4th", "5th", "6th", "7th", "8th", "9th", "10th"};
  private int[][] colors = new int[][] { {255,255,255}, {127,0,255}, {255,0,255}, {255,0,127}, {255,0,0}, {255,127,0}, {255,255,0}, {127,255,0}, {0,255,127}, {0,255,255}, {0,0,255}};
  private int score = 10000;
  private boolean scoreSubmit = true;
  private int[] letters = new int[] { 65, 65, 65 };
  private int keyLocation = 0;
  
  public HighScore(int num) {
    score = num;
    readScore();
    if (addIndex() == -1) displayScores();
    else resetName();
  }
  
  public boolean resetName() {
    background(0);
    fill(255);
    textAlign(CENTER, TOP);
    textSize(75);
    text("Enter Your\nName", 280, 5);
    scoreSubmit = false;
    // 32 = space, 48 = 0, 57 = 9,65 = A, 90 = Z, 97 = a, 112 = z
    for (int i = 0; i < letters.length; i++) {
      letters[i] = 65;
    }
    noStroke();
    textAlign(CENTER, CENTER);
    fill(255);
    textSize(25);
    text("Press Enter to Submit", 280, 600);
    return true;
  }

  void fixCount() {
    // 32 = space, 48 = 0, 57 = 9,65 = A, 90 = Z, 97 = a, 122 = z
    for (int i = 0; i < letters.length; i++) {
      if (letters[i] == 33) letters[i] = 48;
      else if (letters[i] == 58) letters[i] = 65;
      else if (letters[i] == 91) letters[i] = 97;
      else if (letters[i] == 123) letters[i] = 32;
      else if (letters[i] == 96) letters[i] = 90;
      else if (letters[i] == 64) letters[i] = 57;
      else if (letters[i] == 47) letters[i] = 32;
      else if (letters[i] == 31) letters[i] = 122;
    }
  }
  void displayName() {
    fill(0, 0, 255);
    noStroke();
    //top triangles
    triangle(56, 250, 168, 250, 112, 200);
    triangle(224, 250, 336, 250, 280, 200);
    triangle(392, 250, 504, 250, 448, 200);

    //lower triangles
    triangle(56, 450, 168, 450, 112, 500);
    triangle(224, 450, 336, 450, 280, 500);
    triangle(392, 450, 504, 450, 448, 500);

    fill(0);
    rect(0, 250, 560, 200);
    fill(255);
    textSize(170);
    textAlign(CENTER, TOP);
    text((char) letters[0], 112, 250);
    text((char) letters[1], 280, 250);
    text((char) letters[2], 448, 250);
  }

  void hiTri(int n, int colour) {
    if (colour == 0) fill(120, 50, 175);
    if (colour == 1) fill(204, 229, 255);
    if (n == 1) triangle(56, 250, 168, 250, 112, 200);
    if (n == 2) triangle(224, 250, 336, 250, 280, 200);
    if (n == 3) triangle(392, 250, 504, 250, 448, 200);
    if (n == 4) triangle(56, 450, 168, 450, 112, 500);
    if (n == 5) triangle(224, 450, 336, 450, 280, 500);
    if (n == 6) triangle(392, 450, 504, 450, 448, 500);
  }

  void readScore() {
    BufferedReader reader = createReader("scores.dat");
    try {
      reader.readLine();
    } 
    catch (IOException e) {
      e.printStackTrace();
    }

    for (int i = 0; i < 10; i++) {
      try {
        String line = reader.readLine();
        String[] lineB = line.split("\\|");
        scores[i] = Integer.parseInt(lineB[1]);
        names[i] = lineB[2];
      } 
      catch (IOException e) {
        e.printStackTrace();
      }
    }

    try {
      reader.close();
    } 
    catch (IOException e) {
      e.printStackTrace();
    }
  }


  int addIndex() {
    int addIndex = -1;
    for (int i = 0; i < 10; i++) {
      if (scores[i] < score) {
        addIndex = i;
        break;
      }
    }
    return addIndex;
  }


  boolean addScore(String name, int addIndex) {
    if (addIndex == -1) return false;
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
    scoreSubmit = true;
    return true;
  }

  void displayScores() {
    scoreSubmit = true;
    BufferedReader reader = createReader("scores.dat");
    String s = "";
    background(0);
    fill(255);
    textAlign(CENTER, TOP);
    textSize(90);
    text("High Scores", 280, 20);
    textSize(30);
    for (int i = 0; i < 11; i++) {
      try {
        String line = reader.readLine();
        String[] lineB = line.split("\\|");
        stroke(colors[i][0], colors[i][1], colors[i][2]);
        fill(colors[i][0], colors[i][1], colors[i][2]);
        int y = 150 + (i * 40);
        text(lineB[0], 100, y);
        text(lineB[1], 280, y);
        text(lineB[2], 460, y);
      } 
      catch (IOException e) {
        e.printStackTrace();
      }
    }
    noStroke();
    fill(255);
    textSize(20);
    text("Press Any Key to Go Back to Home Screen", 280, 625);
  }
  
  void keyPressed() {
    if (!scoreSubmit) {
      if (key == 'w') {
        letters[keyLocation]++;
        hiTri(keyLocation + 1, 0);
      }    
      else if (key == 'a') {
        if (keyLocation > 0) keyLocation--;
      }
      else if (key == 's') {
        letters[keyLocation]--;
        int time = millis();
        hiTri(keyLocation + 4, 0);
      }
      else if (key == 'd') {
        if (keyLocation < 2) keyLocation++;
      }
      else if (keyCode == ENTER) {
        addScore("" + (char) letters[0] + (char) letters[1] + (char) letters[2], addIndex());
        displayScores();
      }
      else if (keyCode == RETURN) {
        addScore("" + (char) letters[0] + (char) letters[1] + (char) letters[2], addIndex());
        displayScores();
      }
      fixCount();
    }
  }

  void draw() {
    if (!scoreSubmit) {
      displayName();
      hiTri(keyLocation + 1, 1);
      hiTri(keyLocation + 4, 1);
    }
  }
}

