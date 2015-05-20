public abstract class Piece {
  //Function to draw a board piece at a specified location
  public abstract void drawPiece(int x, int y);
  
  //Walls (00 - 19)
  //Piece00 - Black Space Wall
  //Piece01 - Horizontal Wall
  //Piece02 - Vertical Wall
  //Piece03 - Right to Top Corner Wall
  //Piece04 - Top to Left Corner Wall
  //Piece05 - Left to Bottom Corner Wall
  //Piece06 - Bottom to Right Corner Wall
  //Piece07 - Right Endpoint Wall
  //Piece08 - Top Endpoint Wall
  //Piece09 - Left Endpoint Wall
  //Piece10 - Bottom Endpoint Wall
  
  //Paths (20 - 39)
  //Piece20 - Black Space Path
  //Piece21 - Power Dot Path
  //Piece22 - Score Dot Path
  
  //Specialty Pieces (40 - 59)
  //  Maybe if time allows
  //    -Oneway Paths
  //    -Forced Direction Path
}
