import oscP5.*;
//OSC receive
OscP5 oscP5;

Piece[] pieces;

int[] xPoss;
int[] yPoss;

String[] piecesName = {"rookL", "bishopL", "knight", "queen", "king", "knightR", "bishopR", "rookR", "1", "2", "3", "4", "5", "6", "7", "8"};

void setup() {
  size(600, 600);
  // Initialize an instance listening to port 12000
  oscP5 = new OscP5(this,12002);
  
  // Declare Pieces
  pieces = new Piece[16];
 

  for (int i = 0; i < 16; i++) {
    boolean select = false;
    int xPoss = (i %  8) * (width/8);
    
    if (i == 1) { 
      select = true;
    } else { select = false; }
    
    if (i < 8) {
        pieces[i] = new Piece(piecesName[i], xPoss, 0, false);
      } else {
        pieces[i] = new Piece(piecesName[i], xPoss, 1 * width/8, false);
      }
  }
}

void draw() {
  frameRate(1);
  drawChessBoard();
  
  for (int i = 0; i < 16; i++) {
     pieces[i].put();
  }
}
