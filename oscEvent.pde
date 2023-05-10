// This value is set by the OSC event handler
float amplitude = 0;
// Declare a scaling factor
float scale=6;
// Declare a smooth factor
float smooth_factor=0.1;

int whichPiece = 0;

void oscEvent(OscMessage theOscMessage) {
    float value = theOscMessage.get(0).floatValue();
    //String dirValue = theOscMessage.get(1).stringValue();
    println("OSC", value);
    if (theOscMessage.checkAddrPattern("/amp")) {
      switch(int(value)) {
        // PIECES
        case 48: // ROOK L
          whichPiece = 0;
          break;
        case 50: // BISHOP L
          whichPiece = 1;
          break;
        case 52: // KNIGHT L 
          whichPiece = 2;
          break;
        case 53: // QUEEN
          whichPiece = 3;
          break;
        case 55: // KING
          whichPiece = 4;
          break;
        case 57: // KNIGHT R
          whichPiece = 5;
          break;
        case 59: // BISHOP R
          whichPiece = 6;
          break;
        case 60: // ROOK R
          whichPiece = 7;
          break;
          
        // PAWNS
        case 49: // 1
          whichPiece = 8;
          break;
        case 51: // 2
          whichPiece = 9;
          break;
        case 54: // 3
          whichPiece = 10;
          break;
        case 56: // 4
          whichPiece = 11;
          break;
        case 58: // 5
          whichPiece = 12;
          break;
        case 61: // 6
          whichPiece = 13;
          break;
        case 47: // 7
          whichPiece = 14;
          break;
        case 66: // 8
          whichPiece = 15;
          break;
          
    
        // DIRECTIONS
        case 62: // UP LEFT
          up(whichPiece);
          left(whichPiece);
          break;
        case 63: // UP
          up(whichPiece);
          break;
        case 64: // UP RIGHT
          up(whichPiece);
          right(whichPiece);
          break;
        case 65: // LEFT
          left(whichPiece);
          break;
        case 67: // RIGHT
          right(whichPiece);
          break;
        case 69: // DOWN LEFT
          down(whichPiece);
          left(whichPiece);
          break;
        case 70: // DOWN
          down(whichPiece);
          break;
        case 71: // DOWN RIGHT
          down(whichPiece);
          right(whichPiece);
          break;
      }
        if (value > 0) {
            amplitude = value/ 10;
        } else {
            amplitude = 0.0;
        }
        
        
        // Add range whether ure in SELECT value or not:
        select(whichPiece);
    }
    
     if (theOscMessage.checkAddrPattern("/piece")) {
        
     }
}
