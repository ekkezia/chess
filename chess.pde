import oscP5.*;
//OSC receive
OscP5 oscP5;

Piece[] pieces;

String[] piecesName = {"rookL", "bishopL", "knight", "queen", "king", "knightR", "bishopR", "rookR", "1", "2", "3", "4", "5", "6", "7", "8"};

int offsetY = 0;

void setup() {
  size(600, 600);
  // Initialize an instance listening to port 12000
  oscP5 = new OscP5(this,12002);
  
  // Declare Pieces
  pieces = new Piece[32];

  // WHITE
  for (int i = 0; i < 16; i++) {
    offsetY = height - (width/8 * 2);
    int xPoss = (i %  8) * (width/8);    
    if (i < 8) { // RANK 
        pieces[i] = new Piece(piecesName[i % 16], xPoss, 1 * (width/8) + offsetY);
      } else { // PAWN
        pieces[i] = new Piece(piecesName[i % 16], xPoss, 0 * (width/8) + offsetY);
      }
  }
  // BLACK
  for (int i = 16; i < 32; i++) {
    offsetY = 0;
    int xPoss = (i %  8) * (width/8);    
    if (i < 24) { // RANK
        pieces[i] = new Piece(piecesName[i % 16], xPoss, 0 * (width/8) + offsetY);
      } else { // PAWN
        pieces[i] = new Piece(piecesName[i % 16], xPoss, 1 * (width/8) + offsetY);
      }
  }
}

//int countMove = 0;
boolean isSelecting = true; // indicates that the piece is selected but has NOT move
void draw() {
  frameRate(1);
  drawChessBoard();
  drawChessPieces();
  
  if (isSelecting) {
    if (frameCount % 2 == 0) { 
      pieces[whichPiece].select();   // draw a blinking indicator on the selected piece that has yet to be moved
    }
  } else { 
    pieces[whichPiece].select(); // always draw an indicator on the selected piece that has moved
  }
}
