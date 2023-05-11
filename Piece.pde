class Piece {
  String pieceType;
  float xPos, yPos;
  boolean isPieceSelected;
  
  Piece (String type, int x, int y) {
    pieceType = type;
    xPos = x;
    yPos = y;
  }
  
  void put(String pieceColor) {
    noStroke();
    if (pieceColor == "WHITE") {
      fill(200, 87, 255); // purple
    } else {
      fill(100, 200, 0); // green
    }
    ellipse(xPos + width/8/2, yPos + width/8/2, width/8, height/8); 

    fill(0);
    text(pieceType, xPos + width/8/2, yPos + width/8/2);
  }
  
  void move(int xStep, int yStep) {
      xPos += (xStep * width/8);
      yPos += (yStep * width/8);
  }
  
  void select() {
    // Draw the selecting rect
    stroke(0,255,0);
    strokeWeight(4);
    noFill();
    rect(xPos, yPos, width/8, height/8);
    
    println("Selected Piece: ", piecesName[whichPiece % 16]);
  }
}
