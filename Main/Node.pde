public class Node {
  private int x, y, priority, steps;
  private Node prev;

  public Node(int x, int y) {
    this.x = x;
    this.y = y;
    this.steps = 0;
  }

  public Node getPrev() {
    return prev;
  }

  public void setPrev(Node n) {
    prev = n;
  }

  public int getX() {
    return x;
  }

  public int getY() {
    return y;
  }

  public void setPriority(int n) {
    priority = n;
  }

  public int getPriority() {
    return priority;
  }

  public void setSteps(int n) {
    steps = n;
  }

  public int getSteps() {
    return steps;
  }
}









