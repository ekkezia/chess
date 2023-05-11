// This value is set by the OSC event handler
float amplitude = 0;
 
int whichPiece = 0;
String whichPlayer = "WHITE";
int offsetWhichPlayer = 0;

void oscEvent(OscMessage theOscMessage) {
   float value = theOscMessage.get(0).floatValue();

   println("OSC", value);
   if (whichPlayer == "WHITE") {
     offsetWhichPlayer = 0;
   } else {
     offsetWhichPlayer = 16;
   }
   
   // Add range whether ure in DIRECTION value or not:
   if ((value >= 68 &&  value <= 72) || value == 62 || value == 64 || value == 65) {
     isSelecting = false; // is indicating which piece is on the move
      //countMove = 0; // allow to move
   }
   if ((value >= 48 && value <= 61) || value == 63 || value == 66) {
     isSelecting = true; // is selecting a new piece that yet to be moved
   }
    
   if (theOscMessage.checkAddrPattern("/amp")) {
     switch(int(value)) {
        // PLAYER SWITCH TURN
        case 36:
          whichPlayer = "WHITE"; // WHITE PLAYER TURN
          println("Player: WHITE");
          break;
        case 37:
          whichPlayer = "BLACK"; // BLACK PLAYER TURN
          println("Player: BLACK");
          break;
          
        // PIECES
        case 48: // ROOK L
          whichPiece = 0 + offsetWhichPlayer;
          break;
        case 50: // BISHOP L
          whichPiece = 1 + offsetWhichPlayer;
          break;
        case 52: // KNIGHT L 
          whichPiece = 2 + offsetWhichPlayer;
          break;
        case 53: // QUEEN
          whichPiece = 3 + offsetWhichPlayer;
          break;
        case 55: // KING
          whichPiece = 4 + offsetWhichPlayer;
          break;
        case 57: // KNIGHT R
          whichPiece = 5 + offsetWhichPlayer;
          break;
        case 59: // BISHOP R
          whichPiece = 6 + offsetWhichPlayer;
          break;
        case 60: // ROOK R
          whichPiece = 7 + offsetWhichPlayer;
          break;
          
        // PAWNS
        case 49: // 1
          whichPiece = 8 + offsetWhichPlayer;
          break;
        case 51: // 2
          whichPiece = 9 + offsetWhichPlayer;
          break;
        case 54: // 3
          whichPiece = 10 + offsetWhichPlayer;
          break;
        case 56: // 4
          whichPiece = 11 + offsetWhichPlayer;
          break;
        case 58: // 5
          whichPiece = 12 + offsetWhichPlayer;
          break;
        case 61: // 6
          whichPiece = 13 + offsetWhichPlayer;
          break;
        case 63: // 7
          whichPiece = 14 + offsetWhichPlayer;
          println("Which piece", whichPiece, "Name");
          break;
        case 66: // 8
          whichPiece = 15 + offsetWhichPlayer;
          break;
        
    
        // DIRECTIONS
        case 62: // UP LEFT
          up(whichPiece);
          left(whichPiece);
          break;
        case 64: // UP
          up(whichPiece);
          break;
        case 65: // UP RIGHT
          up(whichPiece);
          right(whichPiece);
          break;
        case 68: // LEFT
          left(whichPiece);
          break;
        case 69: // RIGHT
          right(whichPiece);
          break;
        case 70: // DOWN LEFT
          down(whichPiece);
          left(whichPiece);
          break;
        case 71: // DOWN
          down(whichPiece);
          break;
        case 72: // DOWN RIGHT
          down(whichPiece);
          right(whichPiece);
          break;
      }
    }
}
