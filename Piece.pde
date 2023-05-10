class Piece {
  String pieceType;
  float xPos, yPos, xPosSelected, yPosSelected;
  boolean isPieceSelected;
  
  Piece (String type, int x, int y, boolean selected) {
    pieceType = type;
    xPos = x;
    yPos = y;
    xPosSelected = xPos;
    yPosSelected = yPos;
    isPieceSelected = selected;
  }
  
  void put() {
    fill(255,0,0);
    ellipse(width/8/2 + xPos, width/8/2 + yPos, width/8, height/8);   

    fill(0);
    text(pieceType, xPos + width/8/2, yPos + width/8/2);
  }
  
  void move(int xStep, int yStep) {
    xPos += (xStep * width/8);
    yPos += (yStep * width/8);
  }
  
  void select() {
    noFill();
    stroke(0, 255, 0);
    strokeWeight(10);
    rect(xPosSelected, yPosSelected, width/8, height/8);
  }
}
