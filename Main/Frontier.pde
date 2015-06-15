import java.util.*;

public class Frontier {
  public LinkedList<Node> l = new LinkedList<Node>();

  public void add(Node n) {
    l.add(n);
  }

  public Node remove() {
    int minPriority = Integer.MAX_VALUE;
    int minIndex = 0;
    for (int i = 0; i < l.size (); i++) {
      int temp = l.get(i).getPriority();
      if (temp < minPriority) {
        minPriority = temp;
        minIndex = i;
      }
    }
    return l.remove(minIndex);
  }

  public boolean isEmpty() {
    return l.isEmpty();
  }
}









