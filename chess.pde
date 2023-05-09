import oscP5.*;
//OSC receive
OscP5 oscP5;

Piece[] pieces;

int[] xPoss;
int[] yPoss;

void setup() {
  size(600, 600);
  
  // Initialize an instance listening to port 12000
  oscP5 = new OscP5(this,12002);
  
  // Declare Pieces
  pieces = new Piece[16];
  
  xPoss = new int[16];
  yPoss = new int[16];
  
  for (int i = 0; i < 16; i++) {
      xPoss[i] = (i %  8) * (width/8);
      
      if (i < 8) {
        yPoss[i] = 0; 
      } else {
        yPoss[i] = 0 + (width/8);
      }
    }
}

void draw() {
      for (int x = 0; x < width/8; x++) {
          for (int y = 0; y < height/8; y++) {
            if((x % 2 == 0) && (y % 2 != 0)) {
              fill(100);
            }
            else if (((x % 2 != 0) && (y % 2 == 0))) {
              fill(100);
            }
            else {
              fill(255);
            }
             rect(x * (width/8), y * (height/8), width/8, height/8);
          }
    }

    for (int i = 0; i < 16; i++) {
      if (whichPiece == i) { // Selected
        pieces[i] = new Piece("piece", xPoss[i], yPoss[i], true);
      } else {
        pieces[i] = new Piece("piece", xPoss[i], yPoss[i], false);
      }
    }
}
